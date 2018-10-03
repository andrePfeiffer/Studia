package cc.studia.video.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.video.entity.Assunto;

@Repository
public class AssuntoDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Assunto> verTodos() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Assunto> query = currentSession.createQuery("from Assunto", Assunto.class);
		List<Assunto> assuntos = query.getResultList();
		return assuntos;
	}

	public void salvarAssunto(Assunto assunto) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(assunto);
	}

	public void editaAssunto(Assunto assunto) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(assunto);
	}
	
	public Assunto ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Assunto assunto = currentSession.get(Assunto.class, id);
		return assunto;
	}

	public void removeAssunto(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Assunto where id=:assuntoId");
		theQuery.setParameter("assuntoId", id);
		theQuery.executeUpdate();
	}

	public List<Assunto> buscar(String busca) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = null;
		if (busca != null && busca.trim().length() > 0) {
            theQuery = currentSession.createQuery("from Assunto where lower(nome) like :busca", Assunto.class);
            theQuery.setParameter("busca", "%" + busca.toLowerCase() + "%");
        }
        else {
            theQuery = currentSession.createQuery("from Assunto", Assunto.class);            
        }
		List<Assunto> assuntos = theQuery.getResultList();
		return assuntos;
	}

}
