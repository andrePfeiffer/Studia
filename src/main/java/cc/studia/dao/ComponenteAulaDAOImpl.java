package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;

@Repository
public class ComponenteAulaDAOImpl implements ComponenteAulaDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<ComponenteAula> verTodos(Aula aula) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<ComponenteAula> query = currentSession.createQuery("from ComponenteAula where idAula=:aulaId", ComponenteAula.class);
		query.setParameter("aulaId", aula.getIdConteudo());
		List<ComponenteAula> componenteAulas = query.getResultList();
		return componenteAulas;
	}

	@Override
	public int salvar(ComponenteAula componenteAula) {
		Session currentSession = sessionFactory.getCurrentSession();
		int id = (Integer)currentSession.save(componenteAula);
		return id;
	}

	@Override
	public ComponenteAula ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		ComponenteAula componenteAula = currentSession.get(ComponenteAula.class, id);
		return componenteAula;
	}

	@Override
	public void editar(ComponenteAula componenteAula) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(componenteAula);
	}

	@Override
	public void remover(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<?> theQuery = currentSession.createQuery("delete from ComponenteAula where id=:componenteAulaId");
		theQuery.setParameter("componenteAulaId", id);
		theQuery.executeUpdate();
	}

}
