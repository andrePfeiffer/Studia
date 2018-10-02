package cc.studia.video.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="conteudo")
public class Conteudo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="nome")
	private String nome;
	
	@Column(name="descricao")
	private String descricao;
	
	@Column(name="publico")
	private int publico;
	
	@Column(name="aprovado")
	private int aprovado;
	
	@Column(name="datacriado")
	private String dataCriado;
	
	@Column(name="dataatualizado")
	private String dataAtualizado;
	
	@OneToMany(mappedBy="conteudo", cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	private List<Comentario> comentarios;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idassunto")
	private Assunto assunto;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idautor")
	private Usuario autor;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idaprovador")
	private Usuario aprovador;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getPublico() {
		return publico;
	}

	public void setPublico(int publico) {
		this.publico = publico;
	}

	public int getAprovado() {
		return aprovado;
	}

	public void setAprovado(int aprovado) {
		this.aprovado = aprovado;
	}

	public String getDataCriado() {
		return dataCriado;
	}

	public void setDataCriado(String dataCriado) {
		this.dataCriado = dataCriado;
	}

	public String getDataAtualizado() {
		return dataAtualizado;
	}

	public void setDataAtualizado(String dataAtualizado) {
		this.dataAtualizado = dataAtualizado;
	}

	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}

	public Assunto getAssunto() {
		return assunto;
	}

	public void setAssunto(Assunto assunto) {
		this.assunto = assunto;
	}

	public Usuario getAutor() {
		return autor;
	}

	public void setAutor(Usuario autor) {
		this.autor = autor;
	}

	public Usuario getAprovador() {
		return aprovador;
	}

	public void setAprovador(Usuario aprovador) {
		this.aprovador = aprovador;
	}
	
	
}
