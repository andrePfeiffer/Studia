package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int salvar(ComponenteAula componenteAula) {
		Session currentSession = sessionFactory.getCurrentSession();
		int id = (Integer)currentSession.save(componenteAula);
		return id;
	}

	@Override
	public ComponenteAula ver(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void editar(ComponenteAula componenteAula) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remover(int id) {
		// TODO Auto-generated method stub

	}

}
