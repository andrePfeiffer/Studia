package cc.studia.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="exercicio")
public class Exercicio {
	@Id
	@Column(name="idcomponente")
	private int idComponente;
	
	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idcomponente", nullable=false, insertable=false, updatable=false)
	private ComponenteAula componenteAula;

	public int getIdComponente() {
		return idComponente;
	}

	public void setIdComponente(int idComponente) {
		this.idComponente = idComponente;
	}

	public ComponenteAula getComponenteAula() {
		return componenteAula;
	}

	public void setComponenteAula(ComponenteAula componenteAula) {
		this.componenteAula = componenteAula;
	}

	@Override
	public String toString() {
		return "Video [idComponente=" + idComponente + ", componenteAula=" + componenteAula + "]";
	}

	
}
