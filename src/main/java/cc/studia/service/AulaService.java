package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.AulaDAO;
import cc.studia.entity.Aula;

@Service
public class AulaService {
	@Autowired
	private AulaDAO aulaDAO;
	
	@Transactional
	public List<Aula> verTodos() {
		return aulaDAO.verTodos();
	}

	@Transactional
	public void salvarAula(Aula curso) {
		aulaDAO.salvarAula(curso);
	}

	@Transactional
	public Aula ver(int id) {
		return aulaDAO.ver(id);
	}

	@Transactional
	public void editaAula(Aula curso) {
		aulaDAO.editaAula(curso);
		
	}
	
	@Transactional
	public List<Aula> busca(String busca) {
		return aulaDAO.busca(busca);
	}

	@Transactional
	public void removeAula(int id) {
		aulaDAO.removeAula(id);
	}

}
