package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Video> query = currentSession.createQuery("from Video where ComponenteAula.idAula=:aulaId", Video.class);
		query.setParameter("aulaId", aula.getIdConteudo());
		List<Video> videos = query.getResultList();
		return videos;
	}

	@Override
	public int salvar(Video video) {
		Session currentSession = sessionFactory.getCurrentSession();
		int id = (Integer)currentSession.save(video);
		return id;
	}

	@Override
	public Video ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Video video = currentSession.get(Video.class, id);
		return video;
	}

	@Override
	public void editar(Video video) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(video);
	}

	@Override
	public void remover(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<?> theQuery = currentSession.createQuery("delete from Video where id=:videoId");
		theQuery.setParameter("videoId", id);
		theQuery.executeUpdate();
	}

}
