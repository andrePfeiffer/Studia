package cc.studia.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Usuario;

@Repository
public class UsuarioDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public Usuario findByUserName(String theUserName) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Usuario> theQuery = currentSession.createQuery("from Usuario where nome=:uName", Usuario.class);
		theQuery.setParameter("uName", theUserName);
		Usuario theUser = null;
		try {
			theUser = theQuery.getSingleResult();
		} catch (Exception e) {
			theUser = null;
		}

		return theUser;
	}

	public void save(Usuario theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theUser);
	}

}
