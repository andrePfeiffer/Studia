package cc.studia.service;

import java.util.List;

import cc.studia.entity.Aula;

public interface AulaService {

	List<Aula> verTodos();

	void salvarAula(Aula curso);

	Aula ver(int id);

	void editaAula(Aula curso);

	List<Aula> busca(String busca);

	void removeAula(int id);

	void modificaOrdem(List<Aula> listaAulas);

	void salvar(int conteudoId, int cursoId);

}