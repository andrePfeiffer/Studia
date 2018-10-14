package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Assunto;

@Repository
public class AssuntoDAOImpl implements AssuntoDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Assunto> verTodos() {
		System.out.println(">>> DAO VERTODOS <<<");
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Assunto> query = currentSession.createQuery("from Assunto", Assunto.class);
		List<Assunto> assuntos = query.getResultList();
		return assuntos;
	}

	@Override
	public void salvarAssunto(Assunto assunto) {
		System.out.println(">>> DAO SALVAR <<<");
		System.out.println(assunto.toString());
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(assunto);
	}

	@Override
	public void editaAssunto(Assunto assunto) {
		System.out.println(">>> DAO EDITA <<<");
		System.out.println(assunto.toString());
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(assunto);
	}
	
	@Override
	public Assunto ver(int id) {
		System.out.println(">>> DAO VER <<<");
		Session currentSession = sessionFactory.getCurrentSession();
		Assunto assunto = currentSession.get(Assunto.class, id);
		return assunto;
	}

	@Override
	public void removeAssunto(int id) {
		System.out.println(">>> DAO REMOVE <<<");
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("delete from Assunto where id=:assuntoId");
		query.setParameter("assuntoId", id);
		query.executeUpdate();
	}

	@Override
	public List<Assunto> buscar(String busca) {
		System.out.println(">>> DAO BUSCA <<<");
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = null;
		if (busca != null && busca.trim().length() > 0) {
			query = currentSession.createQuery("from Assunto where lower(nome) like :busca", Assunto.class);
			query.setParameter("busca", "%" + busca.toLowerCase() + "%");
        }
        else {
        	query = currentSession.createQuery("from Assunto", Assunto.class);            
        }
		List<Assunto> assuntos = query.getResultList();
		return assuntos;
	}

}
