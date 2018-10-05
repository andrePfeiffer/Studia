package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Curso;

@Repository
public class CursoDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public List<Curso> verTodos() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Curso> query = currentSession.createQuery("from Curso", Curso.class);
		List<Curso> cursos = query.getResultList();
		return cursos;
	}

	public void salvarCurso(Curso curso) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(curso);
	}

	public Curso ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Curso curso = currentSession.get(Curso.class, id);
		return curso;
	}

	public void editaCurso(Curso curso) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(curso);
	}

	public List<Curso> busca(String busca) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = null;
		if (busca != null && busca.trim().length() > 0) {
            theQuery = currentSession.createQuery("from Curso where lower(conteudo.nome) like :busca or lower(conteudo.descricao) like :busca", Curso.class);
            theQuery.setParameter("busca", "%" + busca.toLowerCase() + "%");
        }
        else {
            theQuery = currentSession.createQuery("from Curso", Curso.class);            
        }
		List<Curso> cursos = theQuery.getResultList();
		return cursos;
	}

	public void removeCurso(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Curso where id=:cursoId");
		theQuery.setParameter("cursoId", id);
		theQuery.executeUpdate();
	}
}
