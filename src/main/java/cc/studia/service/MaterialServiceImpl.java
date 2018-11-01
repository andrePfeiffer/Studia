package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.ComponenteAulaDAO;
import cc.studia.dao.MaterialDAO;
import cc.studia.entity.Aula;
import cc.studia.entity.Material;

@Service
public class MaterialServiceImpl implements MaterialService {
	
	@Autowired
	private MaterialDAO materialDAO;
	
	@Autowired
	private ComponenteAulaDAO componenteAulaDAO;

	@Override
	@Transactional
	public List<Material> verTodos(Aula aula) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public int salvar(Material material) {
		return materialDAO.salvar(material);
	}

	@Override
	@Transactional
	public int salvar(String originalFilename, String contentType, int componenteAulaId) {
        Material material = new Material();
        material.setArquivo(originalFilename);
        material.setTipoArquivo(contentType);
        material.setComponenteAula(componenteAulaDAO.ver(componenteAulaId));
        material.setIdComponente(componenteAulaId);
		return materialDAO.salvar(material);
	}
	
	@Override
	@Transactional
	public Material ver(int id) {
		return materialDAO.ver(id);
	}

	@Override
	@Transactional
	public void editar(Material material) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public void remover(int id) {
		// TODO Auto-generated method stub

	}

}
