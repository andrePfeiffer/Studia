 package cc.studia.service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.UsuarioDAO;
import cc.studia.entity.Papel;
import cc.studia.entity.Perfil;
import cc.studia.entity.Usuario;

@Service
public class UsuarioServiceImpl implements UsuarioService {
	
	@Autowired
	private Environment env;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private PerfilService perfilService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Transactional
	public Usuario findByUserName(String userName) {
		return usuarioDAO.findByUserName(userName);
	}
	
	@Override
	@Transactional
	public void atualizaSenha(Usuario usuario, String senha) {
		usuario.setSenha(passwordEncoder.encode(senha));
		usuarioDAO.save(usuario);
	}
	
	@Override
	public boolean verificaSenha(Usuario usuario, String senha) {
		if(passwordEncoder.matches(senha, usuario.getSenha())) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	@Transactional
	public void atualiza(Usuario usuario) {
		usuarioDAO.save(usuario);
	}

	@Override
	@Transactional
	public void save(String email, String login, String senha) {
		Usuario usuario = new Usuario();
		usuario.setEmail(email);
		usuario.setNome(login);
		usuario.setSenha(passwordEncoder.encode(senha));
		Perfil perfil = perfilService.ver(2);
		usuario.addPerfil(perfil);
		usuarioDAO.save(usuario);
	}

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		Usuario user = usuarioDAO.findByUserName(userName);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username or password.");
		}
        UserDetails userDetails =  new org.springframework.security.core.userdetails.User(
        		user.getNome(),
        		user.getSenha(),
        		true,
        		true, 
        		true,
        		true,
        		mapRolesToAuthorities(user.getPerfils())
		); 
        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return userDetails;
	}

	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Perfil> perfils) {
		Collection<Papel> papeis = perfils.stream().map(perfil -> perfil.getPapel()).collect(Collectors.toList());
		Collection<GrantedAuthority> retorno = papeis.stream().map(papel -> new SimpleGrantedAuthority(papel.getNome())).collect(Collectors.toList());
		
		return retorno;
	}

	@Override
	@Transactional
	public boolean existeEmail(String email) {
		return usuarioDAO.existeEmail(email);
	}

	@Override
	@Transactional
	public boolean existeLogin(String login) {
		return usuarioDAO.existeLogin(login);
	}
	
	@Override
	public void enviarEmailRecuperarSenha(Usuario usuario) {
		Properties props = System.getProperties();
		String code = gerarCodigo(usuario.getNome());
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session = Session.getDefaultInstance(props,
        		new javax.mail.Authenticator() {
                     protected PasswordAuthentication getPasswordAuthentication() 
                     {
                           return new PasswordAuthentication(env.getProperty("smtp.mail"), env.getProperty("smtp.password"));
                     }
                });
	    try {
	          Message message = new MimeMessage(session);
	          message.setFrom(new InternetAddress(env.getProperty("smtp.mail"))); //Remetente
	          Address[] toUser = InternetAddress.parse(usuario.getEmail());  
	          message.setRecipients(Message.RecipientType.TO, toUser);
	          message.setSubject("Recuperação de senha do Studia");//Assunto
	          message.setText("Para recuperar a sua senha clique aqui:\n http://localhost:8080/video/nova-senha?code=" + code);
	          Transport.send(message);
	     } catch (MessagingException e) {
	          throw new RuntimeException(e);
	    }
	}
	
	@Override
	public String gerarCodigo(String login) {
		String hash1 = "aasd01232las";
		String hash2 = "0asdasladsa,0s0s";
		String code = hash1 + login + hash2;
		
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(code.getBytes(StandardCharsets.UTF_8));
			StringBuilder sb = new StringBuilder();
			for (byte b : hash) {
				sb.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
			}
			code = sb.toString();
			return code;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "erro";
		
	}
}
