package cc.studia.dao;

import java.util.List;

import cc.studia.entity.Aula;
import cc.studia.entity.Video;

public interface VideoDAO {
	List<Video> verTodos(Aula aula);
	int salvar(Video video);
	Video ver(int id);
	void editar(Video video);
	void remover(int id);
}
