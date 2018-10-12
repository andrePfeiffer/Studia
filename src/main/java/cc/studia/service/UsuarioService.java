package cc.studia.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import cc.studia.entity.Usuario;

public interface UsuarioService extends UserDetailsService {
	public Usuario findByUserName(String userName);
	public void save(Usuario usuario);
}
