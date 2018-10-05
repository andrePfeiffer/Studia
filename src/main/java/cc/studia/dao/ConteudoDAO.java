package cc.studia.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Conteudo;

@Repository
public class ConteudoDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public int salvarConteudo(Conteudo conteudo) {
		Session currentSession = sessionFactory.getCurrentSession();
		int id = (Integer) currentSession.save(conteudo);
		return id;
	}

	public Conteudo ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Conteudo conteudo = currentSession.get(Conteudo.class, id);
		return conteudo;
	}
	
	public void editaConteudo(Conteudo conteudo) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(conteudo);
	}

}
