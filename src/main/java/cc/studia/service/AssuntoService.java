package cc.studia.service;

import java.util.List;

import cc.studia.entity.Assunto;

public interface AssuntoService {

	List<Assunto> verTodos();

	void salvarAssunto(Assunto assunto);

	void editaAssunto(Assunto assunto);

	Assunto ver(int id);

	void removeAssunto(int id);

	List<Assunto> busca(String busca);

}