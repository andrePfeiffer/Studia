package cc.studia.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Papel;

@Repository
public class PapelDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public Papel findRoleByName(String theRoleName) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Papel> theQuery = currentSession.createQuery("from Papel where name=:roleName", Papel.class);
		theQuery.setParameter("roleName", theRoleName);
		
		Papel theRole = null;
		
		try {
			theRole = theQuery.getSingleResult();
		} catch (Exception e) {
			theRole = null;
		}
		
		return theRole;
	}

}
