package cc.studia.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="aula")
public class Aula {
	@Id
	@Column(name="idconteudo")
	private int idConteudo;
	
	@Column(name="idcurso")
	private int idCurso;
	
	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idconteudo", nullable=false, insertable=false, updatable=false)
	private Conteudo conteudo;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idcurso", nullable=false, insertable=false, updatable=false)
	private Curso curso;

	@OneToMany(mappedBy="aula", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<ComponenteAula> componenteAulas;
	
	public int getIdConteudo() {
		return idConteudo;
	}

	public void setIdConteudo(int idConteudo) {
		this.idConteudo = idConteudo;
	}
	
	public int getIdCurso() {
		return idCurso;
	}

	public void setIdCurso(int idCurso) {
		this.idCurso = idCurso;
	}

	public Conteudo getConteudo() {
		return conteudo;
	}

	public void setConteudo(Conteudo conteudo) {
		this.conteudo = conteudo;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public List<ComponenteAula> getComponenteAulas() {
		return componenteAulas;
	}

	public void setComponenteAulas(List<ComponenteAula> componenteAulas) {
		this.componenteAulas = componenteAulas;
	}

	

	
}
