package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.studia.entity.Historico;

@Repository
public class HistoricoDAOImpl implements HistoricoDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean verificarHistorico(int usuarioId, String tipoConteudo, int conteudoId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Historico> query = currentSession.createQuery("from Historico where usuarioId=:usuarioId and conteudoId=:conteudoId and tipoConteudo=:tipoConteudo", Historico.class);
		query.setParameter("usuarioId", usuarioId);
		query.setParameter("conteudoId", conteudoId);
		query.setParameter("tipoConteudo", tipoConteudo);
		List<Historico> historicos = query.getResultList();
		if(historicos.isEmpty()) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void gravarHistorico(Historico historico) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(historico);
	}

}
