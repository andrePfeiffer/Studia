 package cc.studia.service;

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
	public void enviarEmail() {
		Properties props = System.getProperties();
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
	          Address[] toUser = InternetAddress.parse("andre@pfeiffer.com.br");  
	          message.setRecipients(Message.RecipientType.TO, toUser);
	          message.setSubject("Enviando email com JavaMail");//Assunto
	          message.setText("Enviei este email utilizando JavaMail com minha conta GMail!");
	          Transport.send(message);
	          System.out.println("Feito!!!");
	     } catch (MessagingException e) {
	          throw new RuntimeException(e);
	    }
	}
}
