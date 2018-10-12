package cc.studia.service;

import cc.studia.entity.Conteudo;

public interface ConteudoService {

	int salvarConteudo(Conteudo conteudo);

	Conteudo ver(int id);

	void editaConteudo(Conteudo conteudo);

}