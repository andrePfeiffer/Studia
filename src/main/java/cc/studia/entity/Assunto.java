package cc.studia.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="Assunto")
public class Assunto {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Size(min=3, max=50)
	@Column(name="nome")
	private String nome;
	
	public int getId() {
		System.out.println(this.toString());
		return id;
	}

	public void setId(int id) {
		System.out.println(this.toString());
		this.id = id;
	}

	public String getNome() {
		System.out.println(this.toString());
		return nome;
	}

	public void setNome(String nome) {
		System.out.println(this.toString());
		this.nome = nome;
	}
	
	public Assunto() {
		System.out.println(this.toString());
	}

	@Override
	public String toString() {
		return "Assunto [id=" + id + ", nome=" + nome + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
	
	
	
}
