package cc.studia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.ConteudoDAO;
import cc.studia.dao.UsuarioDAO;
import cc.studia.entity.Conteudo;

@Service
public class ConteudoServiceImpl implements ConteudoService {
	@Autowired
	private ConteudoDAO conteudoDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Override
	@Transactional
	public int salvarConteudo(Conteudo conteudo) {
		return conteudoDAO.salvarConteudo(conteudo);
	}
	
	@Override
	@Transactional
	public Conteudo ver(int id) {
		return conteudoDAO.ver(id);
	}
	
	@Override
	@Transactional
	public void editaConteudo(Conteudo conteudo) {
		conteudoDAO.editaConteudo(conteudo);
	}

	@Override
	@Transactional
	public void editar(int conteudoId, String nome, String descricao, boolean conteudoPublico) {
		Conteudo conteudo = conteudoDAO.ver(conteudoId);
		conteudo.setNome(nome);
		conteudo.setDescricao(descricao);
		conteudo.setPublico(conteudoPublico);
		conteudoDAO.editaConteudo(conteudo);
	}
	
	@Override
	@Transactional
	public int salvarConteudo(String login, String nome, String descricao, boolean conteudoPublico) {
		Conteudo conteudo = new Conteudo();
		conteudo.setAutor(usuarioDAO.findByUserName(login));
		conteudo.setNome(nome);
		conteudo.setDescricao(descricao);
		conteudo.setAprovado(false);
		conteudo.setPublico(conteudoPublico);
		return conteudoDAO.salvarConteudo(conteudo);
	}

}
