package cc.studia.service;

import java.util.List;

import cc.studia.entity.Aula;
import cc.studia.entity.Material;

public interface MaterialService {
	List<Material> verTodos(Aula aula);

	int salvar(Material material);

	Material ver(int id);

	void editar(Material material);

	void remover(int id);

}
