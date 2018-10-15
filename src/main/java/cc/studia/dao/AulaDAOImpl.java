package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Aula;

@Repository
public class AulaDAOImpl implements AulaDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Aula> verTodos() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Aula> query = currentSession.createQuery("from Aula", Aula.class);
		List<Aula> aulas = query.getResultList();
		return aulas;
	}

	@Override
	public void salvarAula(Aula aula) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(aula);
	}

	@Override
	public Aula ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Aula aula = currentSession.get(Aula.class, id);
		return aula;
	}

	@Override
	public void editaAula(Aula aula) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(aula);
	}

	@Override
	public List<Aula> busca(String busca) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Aula> theQuery = null;
		if (busca != null && busca.trim().length() > 0) {
            theQuery = currentSession.createQuery("from Aula where lower(conteudo.nome) like :busca or lower(conteudo.descricao) like :busca", Aula.class);
            theQuery.setParameter("busca", "%" + busca.toLowerCase() + "%");
        }
        else {
            theQuery = currentSession.createQuery("from Aula", Aula.class);            
        }
		List<Aula> aulas = theQuery.getResultList();
		return aulas;
	}

	@Override
	public void removeAula(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<?> theQuery = currentSession.createQuery("delete from Aula where id=:aulaId");
		theQuery.setParameter("aulaId", id);
		theQuery.executeUpdate();
	}
}
