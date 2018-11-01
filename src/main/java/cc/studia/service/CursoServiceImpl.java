package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.AssuntoDAO;
import cc.studia.dao.ConteudoDAO;
import cc.studia.dao.CursoDAO;
import cc.studia.entity.Curso;

@Service
public class CursoServiceImpl implements CursoService {
	@Autowired
	private CursoDAO cursoDAO;
	
	@Autowired
	private AssuntoDAO assuntoDAO;
	
	@Autowired
	private ConteudoDAO conteudoDAO;
	
	@Override
	@Transactional
	public List<Curso> verTodos() {
		return cursoDAO.verTodos();
	}

	@Override
	@Transactional
	public void salvarCurso(Curso curso) {
		cursoDAO.salvarCurso(curso);
	}
	
	@Override
	@Transactional
	public void salvar(int conteudoId, int assuntoId) {
		Curso curso = new Curso();
		curso.setIdConteudo(conteudoId);
		curso.setConteudo(conteudoDAO.ver(conteudoId));
		curso.setAssunto(assuntoDAO.ver(assuntoId));
		cursoDAO.salvarCurso(curso);
	}

	@Override
	@Transactional
	public Curso ver(int id) {
		return cursoDAO.ver(id);
	}

	@Override
	@Transactional
	public void editaCurso(Curso curso) {
		cursoDAO.editaCurso(curso);
		
	}
	
	@Override
	@Transactional
	public List<Curso> busca(String busca) {
		return cursoDAO.busca(busca);
	}

	@Override
	@Transactional
	public void removeCurso(int id) {
		cursoDAO.removeCurso(id);
	}

}
