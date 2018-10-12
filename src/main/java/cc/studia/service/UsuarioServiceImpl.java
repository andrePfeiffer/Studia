 package cc.studia.service;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.UsuarioDAO;
import cc.studia.entity.Papel;
import cc.studia.entity.Perfil;
import cc.studia.entity.Usuario;

@Service
public class UsuarioServiceImpl implements UsuarioService {
	
	@Autowired
	private UsuarioDAO usuarioDao;

	@Transactional
	public Usuario findByUserName(String userName) {
		// check the database if the user already exists
		return usuarioDao.findByUserName(userName);
	}

	@Transactional
	public void save(Usuario usuario) {
		/*
		Usuario user = new Usuario();
		 // assign user details to the user object
		user.setUserName(crmUser.getUserName());
		user.setPassword(passwordEncoder.encode(crmUser.getPassword()));
		user.setFirstName(crmUser.getFirstName());
		user.setLastName(crmUser.getLastName());
		user.setEmail(crmUser.getEmail());

		// give user default role of "employee"
		user.setRoles(Arrays.asList(papelDao.findRoleByName("ROLE_EMPLOYEE")));
		*/

		 // save user in the database
		usuarioDao.save(usuario);
	}

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		Usuario user = usuarioDao.findByUserName(userName);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username or password.");
		}
		System.out.println("usuarioService");
		System.out.println(user.getNome());
		System.out.println(user.getPerfils());
		/*
		return new org.springframework.security.core.userdetails.User(
					user.getNome(), 
					user.getSenha(),
					mapRolesToAuthorities(user.getPerfils())
				);
		*/
        UserDetails userDetails =  new org.springframework.security.core.userdetails.User(
        		user.getNome(),
        		user.getSenha(),
        		true,
        		true, 
        		true,
        		true,
        		mapRolesToAuthorities(user.getPerfils())
		); 
        System.out.println(">>> getauthorities <<<");
        System.out.println(userDetails.getAuthorities());
        
        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return userDetails;
	}

	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Perfil> perfils) {
		System.out.println(">>> MAP ROLES TO AUTHORITIES <<<");
		System.out.println(">>> PERFILS <<<");
		perfils.forEach((temp) -> {
            System.out.println(temp);
		});
		Collection<Papel> papeis = perfils.stream().map(perfil -> perfil.getPapel()).collect(Collectors.toList());
		System.out.println(">>> PAPEIS <<<");
		papeis.forEach((temp) -> {
            System.out.println(temp.getNome());
		});
		
		Collection<GrantedAuthority> retorno = papeis.stream().map(papel -> new SimpleGrantedAuthority(papel.getNome())).collect(Collectors.toList());
		System.out.println(">>> RETORNO <<<");
		retorno.forEach((temp) -> {
            System.out.println(temp);
		});
		
		return retorno;
	}

}
