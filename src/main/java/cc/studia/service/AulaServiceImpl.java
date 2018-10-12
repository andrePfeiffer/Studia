package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.AulaDAO;
import cc.studia.entity.Aula;

@Service
public class AulaServiceImpl implements AulaService {
	@Autowired
	private AulaDAO aulaDAO;
	
	@Override
	@Transactional
	public List<Aula> verTodos() {
		return aulaDAO.verTodos();
	}

	@Override
	@Transactional
	public void salvarAula(Aula curso) {
		aulaDAO.salvarAula(curso);
	}

	@Override
	@Transactional
	public Aula ver(int id) {
		return aulaDAO.ver(id);
	}

	@Override
	@Transactional
	public void editaAula(Aula curso) {
		aulaDAO.editaAula(curso);
		
	}
	
	@Override
	@Transactional
	public List<Aula> busca(String busca) {
		return aulaDAO.busca(busca);
	}

	@Override
	@Transactional
	public void removeAula(int id) {
		aulaDAO.removeAula(id);
	}

}
