package cc.studia.service;

import java.util.List;

import cc.studia.entity.Curso;

public interface CursoService {

	List<Curso> verTodos();

	void salvarCurso(Curso curso);

	Curso ver(int id);

	void editaCurso(Curso curso);

	List<Curso> busca(String busca);

	void removeCurso(int id);

	void salvar(int conteudoId, int assuntoId);

}