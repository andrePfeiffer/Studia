package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Usuario;

@Repository
public class UsuarioDAOImpl implements UsuarioDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
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

	@Override
	public void save(Usuario theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theUser);
	}

	@Override
	public boolean existeEmail(String email) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Usuario> theQuery = currentSession.createQuery("from Usuario where email=:uEmail", Usuario.class);
		theQuery.setParameter("uEmail", email);
		List<Usuario> usuarios = theQuery.getResultList();
		if(usuarios.isEmpty()) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public boolean existeLogin(String login) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Usuario> theQuery = currentSession.createQuery("from Usuario where nome=:uNome", Usuario.class);
		theQuery.setParameter("uNome", login);
		List<Usuario> usuarios = theQuery.getResultList();
		if(usuarios.isEmpty()) {
			return false;
		}else {
			return true;
		}
	}
}
