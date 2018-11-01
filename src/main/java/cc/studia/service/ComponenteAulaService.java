package cc.studia.service;

import java.util.List;

import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;

public interface ComponenteAulaService {
	List<ComponenteAula> verTodos(Aula aula);

	int salvar(ComponenteAula componenteAula);

	ComponenteAula ver(int id);

	void editar(ComponenteAula componenteAula);

	void remover(int id);

	void modificaOrdem(List<ComponenteAula> listaComponentes);
	
	String tipoComponente(int componenteId);

	int salvar(int aulaId, String titulo, String descricao, boolean publico);

	void editar(int componenteId, String titulo, String descricao, boolean componentePublico);
}
