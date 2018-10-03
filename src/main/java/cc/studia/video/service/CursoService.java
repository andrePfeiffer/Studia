package cc.studia.video.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.video.dao.CursoDAO;
import cc.studia.video.entity.Curso;

@Service
public class CursoService {
	@Autowired
	private CursoDAO cursoDAO;
	
	@Transactional
	public List<Curso> verTodos() {
		return cursoDAO.verTodos();
	}

	@Transactional
	public void salvarCurso(Curso curso) {
		cursoDAO.salvarCurso(curso);
	}

	@Transactional
	public Curso ver(int id) {
		return cursoDAO.ver(id);
	}

	@Transactional
	public void editaCurso(Curso curso) {
		cursoDAO.editaCurso(curso);
		
	}
	
	@Transactional
	public List<Curso> busca(String busca) {
		return cursoDAO.busca(busca);
	}

	@Transactional
	public void removeCurso(int id) {
		cursoDAO.removeCurso(id);
	}

}
