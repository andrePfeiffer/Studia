package cc.studia.dao;

import cc.studia.entity.Papel;
import cc.studia.entity.Perfil;

public interface PerfilDAO {
	public void salvar(Perfil perfil);

	Perfil buscar(Papel papel);

	Perfil ver(int id);
}
