package cc.studia.video.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.video.dao.ConteudoDAO;
import cc.studia.video.entity.Conteudo;

@Service
public class ConteudoService {
	@Autowired
	private ConteudoDAO conteudoDAO;
	
	@Transactional
	public int salvarConteudo(Conteudo conteudo) {
		return conteudoDAO.salvarConteudo(conteudo);
	}
	
	@Transactional
	public Conteudo ver(int id) {
		return conteudoDAO.ver(id);
	}
	
	@Transactional
	public void editaConteudo(Conteudo conteudo) {
		conteudoDAO.editaConteudo(conteudo);
	}
}
