package cc.studia.dao;

import java.util.List;

import cc.studia.entity.Curso;

public interface CursoDAO {

	List<Curso> verTodos();

	void salvarCurso(Curso curso);

	Curso ver(int id);

	void editaCurso(Curso curso);

	List<Curso> busca(String busca);

	void removeCurso(int id);

}