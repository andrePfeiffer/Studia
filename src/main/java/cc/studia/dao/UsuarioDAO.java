package cc.studia.dao;

import cc.studia.entity.Usuario;

public interface UsuarioDAO {

	Usuario findByUserName(String theUserName);

	void save(Usuario theUser);

	boolean existeEmail(String email);
	boolean existeLogin(String login);

}