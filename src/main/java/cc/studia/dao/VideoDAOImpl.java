package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Aula;
import cc.studia.entity.Video;

@Repository
public class VideoDAOImpl implements VideoDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Video> verTodos(Aula aula) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int salvar(Video video) {
		Session currentSession = sessionFactory.getCurrentSession();
		int id = (Integer)currentSession.save(video);
		return id;
	}

	@Override
	public Video ver(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void editar(Video video) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remover(int id) {
		// TODO Auto-generated method stub

	}

}
