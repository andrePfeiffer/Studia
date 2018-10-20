package cc.studia.dao;

import java.util.List;

import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;

public interface ComponenteAulaDAO {
	List<ComponenteAula> verTodos(Aula aula);

	int salvar(ComponenteAula componenteAula);

	ComponenteAula ver(int id);

	void editar(ComponenteAula componenteAula);

	void remover(int id);
}
