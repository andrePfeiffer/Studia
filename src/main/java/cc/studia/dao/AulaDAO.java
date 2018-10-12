package cc.studia.dao;

import java.util.List;

import cc.studia.entity.Aula;

public interface AulaDAO {

	List<Aula> verTodos();

	void salvarAula(Aula aula);

	Aula ver(int id);

	void editaAula(Aula aula);

	List<Aula> busca(String busca);

	void removeAula(int id);

}