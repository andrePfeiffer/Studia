package cc.studia.service;

import java.util.List;

import cc.studia.entity.Aula;
import cc.studia.entity.Video;

public interface VideoService {
	List<Video> verTodos(Aula aula);

	int salvar(Video video);

	Video ver(int id);

	void editar(Video video);

	void remover(int id);

	int salvar(String originalFilename, String contentType, int componenteAulaId);

}
