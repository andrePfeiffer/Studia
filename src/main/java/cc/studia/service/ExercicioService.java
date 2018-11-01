package cc.studia.service;

import java.util.List;

import cc.studia.entity.Aula;
import cc.studia.entity.Exercicio;

public interface ExercicioService {
	List<Exercicio> verTodos(Aula aula);

	int salvar(Exercicio exercicio);

	Exercicio ver(int id);

	void editar(Exercicio exercicio);

	void remover(int id);

	int salvar(int componenteAulaId);

}
