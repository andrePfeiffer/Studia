package cc.studia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.ConteudoDAO;
import cc.studia.entity.Conteudo;

@Service
public class ConteudoServiceImpl implements ConteudoService {
	@Autowired
	private ConteudoDAO conteudoDAO;
	
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
}
