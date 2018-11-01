package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.AulaDAO;
import cc.studia.dao.ConteudoDAO;
import cc.studia.dao.CursoDAO;
import cc.studia.entity.Aula;

@Service
public class AulaServiceImpl implements AulaService {
	@Autowired
	private AulaDAO aulaDAO;
	
	@Autowired
	private CursoDAO cursoDAO;
	
	@Autowired
	private ConteudoDAO conteudoDAO;
	
	@Override
	@Transactional
	public List<Aula> verTodos() {
		return aulaDAO.verTodos();
	}

	@Override
	@Transactional
	public void salvarAula(Aula aula) {
		aulaDAO.salvarAula(aula);
	}

	@Override
	@Transactional
	public void salvar(int conteudoId, int cursoId) {
		Aula aula = new Aula();
		aula.setIdConteudo(conteudoId);
		aula.setIdCurso(cursoId);
		aula.setConteudo(conteudoDAO.ver(conteudoId));
		aula.setCurso(cursoDAO.ver(cursoId));
		aulaDAO.salvarAula(aula);
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

	@Override
	@Transactional
	public void modificaOrdem(List<Aula> listaAulas) {
		for (Aula aula : listaAulas) {
			aulaDAO.editaAula(aula);
		}
	}

}
