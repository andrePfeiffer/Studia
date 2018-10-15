package cc.studia.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.studia.dao.PerfilDAO;
import cc.studia.entity.Papel;
import cc.studia.entity.Perfil;

@Service
public class PerfilServiceImpl implements PerfilService {

	@Autowired
	private PerfilDAO perfilDAO;
	
	@Override
	@Transactional
	public void salvar(Perfil perfil) {
		perfilDAO.salvar(perfil);
	}

	@Override
	@Transactional
	public Perfil buscar(Papel papel) {
		return perfilDAO.buscar(papel);
	}
	
	@Override
	@Transactional
	public Perfil ver(int id) {
		return perfilDAO.ver(id);
	}

}
