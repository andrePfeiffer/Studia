package cc.studia.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="video")
public class Video {
	@Id
	@Column(name="idcomponente")
	private int idComponente;
	
	@Column(name="arquivo")
	private String arquivo;

	@Column(name="tipoArquivo")
	private String tipoArquivo;

	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idcomponente", nullable=false, insertable=false, updatable=false)
	private ComponenteAula componenteAula;

	public int getIdComponente() {
		return idComponente;
	}

	public void setIdComponente(int idComponente) {
		this.idComponente = idComponente;
	}

	public String getArquivo() {
		return arquivo;
	}

	public void setArquivo(String arquivo) {
		this.arquivo = arquivo;
	}

	public String getTipoArquivo() {
		return tipoArquivo;
	}

	public void setTipoArquivo(String tipoArquivo) {
		this.tipoArquivo = tipoArquivo;
	}

	public ComponenteAula getComponenteAula() {
		return componenteAula;
	}

	public void setComponenteAula(ComponenteAula componenteAula) {
		this.componenteAula = componenteAula;
	}

	@Override
	public String toString() {
		return "Video [idComponente=" + idComponente + ", arquivo=" + arquivo + ", tipoArquivo=" + tipoArquivo
				+ ", componenteAula=" + componenteAula + "]";
	}

	
}
