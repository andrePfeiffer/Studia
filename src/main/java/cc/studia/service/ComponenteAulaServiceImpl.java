package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.AulaDAO;
import cc.studia.dao.ComponenteAulaDAO;
import cc.studia.dao.ExercicioDAO;
import cc.studia.dao.MaterialDAO;
import cc.studia.dao.VideoDAO;
import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;
import cc.studia.entity.Exercicio;
import cc.studia.entity.Material;
import cc.studia.entity.Video;

@Service
public class ComponenteAulaServiceImpl implements ComponenteAulaService {
	
	@Autowired
	ComponenteAulaDAO componenteAulaDAO;

	@Autowired
	private VideoDAO videoDAO;
	
	@Autowired
	private ExercicioDAO exercicioDAO;
	
	@Autowired
	private MaterialDAO materialDAO;
	
	@Autowired
	private AulaDAO aulaDAO;
	
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
	public int salvar(int aulaId, String titulo, String descricao, boolean publico) {
	    ComponenteAula componenteAula = new ComponenteAula();
	    componenteAula.setAula(aulaDAO.ver(aulaId));
	    componenteAula.setIdAula(aulaId);
	    componenteAula.setTitulo(titulo);
	    componenteAula.setDescricao(descricao);
	    componenteAula.setPublico(publico);
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
	public void editar(int componenteId, String titulo, String descricao, boolean componentePublico) {
		ComponenteAula componente = componenteAulaDAO.ver(componenteId);
		componente.setTitulo(titulo);
		componente.setDescricao(descricao);
		componente.setPublico(componentePublico);
		componenteAulaDAO.editar(componente);
	}
	
	@Override
	@Transactional
	public void remover(int id) {
		componenteAulaDAO.remover(id);
	}

	@Override
	@Transactional
	public void modificaOrdem(List<ComponenteAula> listaComponentes) {
		for (ComponenteAula componenteAula : listaComponentes) {
			ComponenteAula componenteAulaFinal = componenteAulaDAO.ver(componenteAula.getId());
			componenteAulaFinal.setOrdem(componenteAula.getOrdem());
			componenteAulaDAO.editar(componenteAulaFinal);
		}
	}

	@Override
	@Transactional
	public String tipoComponente(int componenteId) {
		Video video = videoDAO.ver(componenteId);
		Exercicio exercicio = exercicioDAO.ver(componenteId);
		Material material = materialDAO.ver(componenteId);
		if(video != null) {
			return "video";
		}
		if(exercicio != null) {
			return "exercicio";
		}
		if(material != null) {
			return "material";
		}
		return null;
	}

}
