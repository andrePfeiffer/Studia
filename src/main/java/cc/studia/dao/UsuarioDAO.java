package cc.studia.dao;

import cc.studia.entity.Usuario;

public interface UsuarioDAO {

	Usuario findByUserName(String theUserName);

	void save(Usuario theUser);

}