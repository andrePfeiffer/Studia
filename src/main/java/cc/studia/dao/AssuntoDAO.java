package cc.studia.dao;

import java.util.List;

import cc.studia.entity.Assunto;

public interface AssuntoDAO {

	List<Assunto> verTodos();

	void salvarAssunto(Assunto assunto);

	void editaAssunto(Assunto assunto);

	Assunto ver(int id);

	void removeAssunto(int id);

	List<Assunto> buscar(String busca);

}