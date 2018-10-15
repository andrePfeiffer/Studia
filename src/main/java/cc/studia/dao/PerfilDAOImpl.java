package cc.studia.dao;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Papel;
import cc.studia.entity.Perfil;

@Repository
public class PerfilDAOImpl implements PerfilDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Perfil ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Perfil perfil = currentSession.get(Perfil.class, id);
		return perfil;	
	}
	
	@Override
	public void salvar(Perfil perfil) {
		Session currentSession = sessionFactory.getCurrentSession();
		System.out.println(perfil.toString());
		currentSession.save(perfil);
	}
	
	@Override
	public Perfil buscar(Papel papel) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Perfil> theQuery = currentSession.createQuery("from Perfil where idPapel=:papelId", Perfil.class);
		theQuery.setParameter("papelId", papel.getId());
		Perfil perfil = null;
		try {
			perfil = theQuery.getSingleResult();
		}catch(NoResultException e) {
			e.printStackTrace();
		}
		System.out.println(perfil.toString());
		return perfil;
		
	}

}
