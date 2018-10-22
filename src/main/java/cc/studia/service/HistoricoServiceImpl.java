package cc.studia.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.studia.dao.HistoricoDAO;
import cc.studia.entity.Historico;

@Service
public class HistoricoServiceImpl implements HistoricoService {
	
	@Autowired
	private HistoricoDAO historicoDAO;

	@Override
	@Transactional
	public boolean verificarHistorico(int usuarioId, String tipoConteudo, int conteudoId) {
		return historicoDAO.verificarHistorico(usuarioId, tipoConteudo, conteudoId);
	}

	@Override
	@Transactional
	public void gravarHistorico(Historico historico) {
		historicoDAO.gravarHistorico(historico);
	}

}
