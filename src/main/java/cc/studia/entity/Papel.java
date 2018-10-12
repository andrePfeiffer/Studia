package cc.studia.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="papel")
public class Papel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="nome")
	private String nome;
	
	@Type(type="true_false")
	@Column(name="mantemconteudo")
	private boolean mantemConteudo;

	@Type(type="true_false")
	@Column(name="aprovaconteudo")
	private boolean aprovaConteudo;

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

	public boolean isMantemConteudo() {
		return mantemConteudo;
	}

	public void setMantemConteudo(boolean mantemConteudo) {
		this.mantemConteudo = mantemConteudo;
	}

	public boolean isAprovaConteudo() {
		return aprovaConteudo;
	}

	public void setAprovaConteudo(boolean aprovaConteudo) {
		this.aprovaConteudo = aprovaConteudo;
	}

	@Override
	public String toString() {
		return "Papel [id=" + id + ", nome=" + nome + ", mantemConteudo=" + mantemConteudo + ", aprovaConteudo="
				+ aprovaConteudo + "]";
	}
	
	
	
}
