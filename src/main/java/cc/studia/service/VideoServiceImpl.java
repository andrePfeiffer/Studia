package cc.studia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.VideoDAO;
import cc.studia.entity.Aula;
import cc.studia.entity.Video;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	private VideoDAO videoDAO; 

	@Override
	@Transactional
	public List<Video> verTodos(Aula aula) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public int salvar(Video video) {
		return videoDAO.salvar(video);
	}

	@Override
	@Transactional
	public Video ver(int id) {
		return videoDAO.ver(id);
	}

	@Override
	@Transactional
	public void editar(Video video) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public void remover(int id) {
		// TODO Auto-generated method stub

	}

}
