package cc.studia.service;

import cc.studia.entity.Conteudo;

public interface ConteudoService {

	int salvarConteudo(Conteudo conteudo);

	Conteudo ver(int id);

	void editaConteudo(Conteudo conteudo);

	int salvarConteudo(String login, String nome, String descricao, boolean conteudoPublico);

	void editar(int conteudoId, String nome, String descricao, boolean conteudoPublico);

}