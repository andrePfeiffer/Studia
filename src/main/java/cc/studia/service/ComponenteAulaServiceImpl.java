package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.ComponenteAulaDAO;
import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;

@Service
public class ComponenteAulaServiceImpl implements ComponenteAulaService {
	
	@Autowired
	ComponenteAulaDAO componenteAulaDAO;

	@Override
	@Transactional
	public List<ComponenteAula> verTodos(Aula aula) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public int salvar(ComponenteAula componenteAula) {
		return componenteAulaDAO.salvar(componenteAula);
	}

	@Override
	@Transactional
	public ComponenteAula ver(int id) {
		return componenteAulaDAO.ver(id);
	}

	@Override
	@Transactional
	public void editar(ComponenteAula componenteAula) {
		componenteAulaDAO.editar(componenteAula);
	}

	@Override
	@Transactional
	public void remover(int id) {
		componenteAulaDAO.remover(id);
	}

}
