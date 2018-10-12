package cc.studia.dao;

import cc.studia.entity.Conteudo;

public interface ConteudoDAO {

	int salvarConteudo(Conteudo conteudo);

	Conteudo ver(int id);

	void editaConteudo(Conteudo conteudo);

}