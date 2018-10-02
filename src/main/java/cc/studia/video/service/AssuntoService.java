package cc.studia.video.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.video.dao.AssuntoDAO;
import cc.studia.video.entity.Assunto;

@Service
public class AssuntoService {

	@Autowired
	private AssuntoDAO assuntoDAO;
	
	@Transactional
	public List<Assunto> verTodos() {
		return assuntoDAO.verTodos();
	}
	
	@Transactional
	public void salvarAssunto(Assunto assunto) {
		assuntoDAO.salvarAssunto(assunto);
	}

	public Assunto ver(int id) {
		return assuntoDAO.ver(id);
	}

	public void removeAssunto(int id) {
		assuntoDAO.removeAssunto(id);
		
	}

	public List<Assunto> busca(String busca) {
		return assuntoDAO.buscar(busca);
	}
}
