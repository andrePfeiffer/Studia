package cc.studia.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="assunto")
public class Assunto {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Size(min=3, max=50)
	@Column(name="nome")
	private String nome;
	
	public int getId() {
		System.out.println(">>> GETTER ID DO ASSUNTO <<<");
		return id;
	}

	public void setId(int id) {
		System.out.println(">>> SETTER ID DO ASSUNTO <<<");
		this.id = id;
	}

	public String getNome() {
		System.out.println(">>> GETTER NOME DO ASSUNTO <<<");
		return nome;
	}

	public void setNome(String nome) {
		System.out.println(">>> SETTER NOME DO ASSUNTO <<<");
		this.nome = nome;
	}
	
	public Assunto() {
		System.out.println(">>> OBJETO ASSUNTO CRIADO <<<");
	}
	
}
