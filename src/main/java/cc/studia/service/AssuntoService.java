package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.AssuntoDAO;
import cc.studia.entity.Assunto;

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
	
	@Transactional
	public void editaAssunto(Assunto assunto) {
		assuntoDAO.editaAssunto(assunto);
	}

	@Transactional
	public Assunto ver(int id) {
		return assuntoDAO.ver(id);
	}

	@Transactional
	public void removeAssunto(int id) {
		assuntoDAO.removeAssunto(id);
		
	}

	@Transactional
	public List<Assunto> busca(String busca) {
		return assuntoDAO.buscar(busca);
	}

}