package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import cc.studia.entity.Aula;
import cc.studia.entity.Exercicio;

public class ExercicioDAOImpl implements ExercicioDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Exercicio> verTodos(Aula aula) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Exercicio> query = currentSession.createQuery("from Exercicio where ComponenteAula.idAula=:aulaId", Exercicio.class);
		query.setParameter("aulaId", aula.getIdConteudo());
		List<Exercicio> exercicios = query.getResultList();
		return exercicios;
	}

	@Override
	public int salvar(Exercicio exercicio) {
		Session currentSession = sessionFactory.getCurrentSession();
		int id = (Integer)currentSession.save(exercicio);
		return id;
	}

	@Override
	public Exercicio ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Exercicio exercicio = currentSession.get(Exercicio.class, id);
		return exercicio;
	}

	@Override
	public void editar(Exercicio exercicio) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(exercicio);
	}

	@Override
	public void remover(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<?> theQuery = currentSession.createQuery("delete from Exercicio where id=:exercicioId");
		theQuery.setParameter("exercicioId", id);
		theQuery.executeUpdate();
	}

}
