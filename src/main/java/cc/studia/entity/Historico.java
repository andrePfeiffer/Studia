package cc.studia.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="historico")
public class Historico {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="tipoConteudo")
	private String tipoConteudo;
	
	@Column(name="conteudoId")
	private int conteudoId;
	
	@Column(name="usuarioId")
	private int usuarioId;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="usuarioId", nullable=false, insertable=false, updatable=false)
	private Usuario usuario;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipoConteudo() {
		return tipoConteudo;
	}

	public void setTipoConteudo(String tipoConteudo) {
		this.tipoConteudo = tipoConteudo;
	}

	public int getConteudoId() {
		return conteudoId;
	}

	public void setConteudoId(int conteudoId) {
		this.conteudoId = conteudoId;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public int getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(int usuarioId) {
		this.usuarioId = usuarioId;
	}

	@Override
	public String toString() {
		return "Historico [id=" + id + ", tipoConteudo=" + tipoConteudo + ", conteudoId=" + conteudoId + ", usuario="
				+ usuario + "]";
	}
	
}
