package cc.studia.dao;

import java.util.List;

import cc.studia.entity.Aula;
import cc.studia.entity.Exercicio;

public interface ExercicioDAO {
	List<Exercicio> verTodos(Aula aula);
	int salvar(Exercicio exercicio);
	Exercicio ver(int id);
	void editar(Exercicio exercicio);
	void remover(int id);
}
