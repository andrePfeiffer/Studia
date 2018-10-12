package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.AssuntoDAO;
import cc.studia.entity.Assunto;

@Service
public class AssuntoServiceImpl implements AssuntoService {

	@Autowired
	private AssuntoDAO assuntoDAO;
	
	@Override
	@Transactional
	public List<Assunto> verTodos() {
		return assuntoDAO.verTodos();
	}
	
	@Override
	@Transactional
	public void salvarAssunto(Assunto assunto) {
		assuntoDAO.salvarAssunto(assunto);
	}
	
	@Override
	@Transactional
	public void editaAssunto(Assunto assunto) {
		assuntoDAO.editaAssunto(assunto);
	}

	@Override
	@Transactional
	public Assunto ver(int id) {
		return assuntoDAO.ver(id);
	}

	@Override
	@Transactional
	public void removeAssunto(int id) {
		assuntoDAO.removeAssunto(id);
		
	}

	@Override
	@Transactional
	public List<Assunto> busca(String busca) {
		return assuntoDAO.buscar(busca);
	}

}
