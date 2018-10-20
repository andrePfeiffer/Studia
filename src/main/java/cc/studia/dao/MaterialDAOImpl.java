package cc.studia.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import cc.studia.entity.Aula;
import cc.studia.entity.Material;

public class MaterialDAOImpl implements MaterialDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Material> verTodos(Aula aula) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Material> query = currentSession.createQuery("from Material where ComponenteAula.idAula=:aulaId", Material.class);
		query.setParameter("aulaId", aula.getIdConteudo());
		List<Material> materiais = query.getResultList();
		return materiais;
	}

	@Override
	public int salvar(Material material) {
		Session currentSession = sessionFactory.getCurrentSession();
		int id = (Integer)currentSession.save(material);
		return id;
	}

	@Override
	public Material ver(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Material material = currentSession.get(Material.class, id);
		return material;
	}

	@Override
	public void editar(Material material) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(material);
	}

	@Override
	public void remover(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<?> theQuery = currentSession.createQuery("delete from Material where id=:materialId");
		theQuery.setParameter("materialId", id);
		theQuery.executeUpdate();
	}

}
