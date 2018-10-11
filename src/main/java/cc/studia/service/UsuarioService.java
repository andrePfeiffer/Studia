 package cc.studia.service;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.IUsuarioDAO;
import cc.studia.dao.PapelDAO;
import cc.studia.entity.Papel;
import cc.studia.entity.Perfil;
import cc.studia.entity.Usuario;

@Service
public class UsuarioService implements IUsuarioService {
	
	@Autowired
	private IUsuarioDAO usuarioDao;

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
		return new org.springframework.security.core.userdetails.User(
					user.getNome(), 
					user.getSenha(),
					mapRolesToAuthorities(user.getPerfils())
				);
	}

	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Perfil> perfils) {
		Collection<Papel> papeis = perfils.stream().map(perfil -> perfil.getPapel()).collect(Collectors.toList());
		return papeis.stream().map(papel -> new SimpleGrantedAuthority(papel.getNome())).collect(Collectors.toList());
	}

}
