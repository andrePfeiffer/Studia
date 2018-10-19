package cc.studia.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import cc.studia.entity.Usuario;

public interface UsuarioService extends UserDetailsService {
	public Usuario findByUserName(String userName);
	public void save(String email, String login, String senha);
	public boolean existeEmail(String email);
	public boolean existeLogin(String login);
	public void enviarEmail();
}
