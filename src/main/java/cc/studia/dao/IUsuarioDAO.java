package cc.studia.dao;

import cc.studia.entity.Usuario;

public interface IUsuarioDAO {

	Usuario findByUserName(String theUserName);

	void save(Usuario theUser);

}