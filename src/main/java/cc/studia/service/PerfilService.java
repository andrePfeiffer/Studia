package cc.studia.service;

import cc.studia.entity.Papel;
import cc.studia.entity.Perfil;

public interface PerfilService {
	public void salvar(Perfil perfil);
	public Perfil buscar(Papel papel);
	public Perfil ver(int id);
}
