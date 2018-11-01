package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.ComponenteAulaDAO;
import cc.studia.dao.ExercicioDAO;
import cc.studia.entity.Aula;
import cc.studia.entity.Exercicio;

@Service
public class ExercicioServiceImpl implements ExercicioService {
	
	@Autowired
	private ExercicioDAO exercicioDAO;
	
	@Autowired
	private ComponenteAulaDAO componenteAulaDAO;

	@Override
	@Transactional
	public List<Exercicio> verTodos(Aula aula) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public int salvar(Exercicio exercicio) {
		return exercicioDAO.salvar(exercicio);
	}

	@Override
	@Transactional
	public int salvar(int componenteAulaId) {
        Exercicio exercicio = new Exercicio();
        exercicio.setComponenteAula(componenteAulaDAO.ver(componenteAulaId));
        exercicio.setIdComponente(componenteAulaId);
		return exercicioDAO.salvar(exercicio);
	}
	
	@Override
	@Transactional
	public Exercicio ver(int id) {
		return exercicioDAO.ver(id);
	}

	@Override
	@Transactional
	public void editar(Exercicio video) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public void remover(int id) {
		// TODO Auto-generated method stub

	}

}
