package cc.studia.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.studia.dao.HistoricoDAO;
import cc.studia.dao.UsuarioDAO;
import cc.studia.entity.Historico;
import cc.studia.entity.Usuario;

@Service
public class HistoricoServiceImpl implements HistoricoService {
	
	@Autowired
	private HistoricoDAO historicoDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;

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

	@Override
	@Transactional
	public void gravarHistorico(String login, int componenteId, String tipoConteudo) {
		Usuario usuario = usuarioDAO.findByUserName(login);
		Historico historico = new Historico();
		historico.setConteudoId(componenteId);
		historico.setTipoConteudo(tipoConteudo);
		historico.setUsuarioId(usuario.getId());
		historico.setUsuario(usuario);
		historicoDAO.gravarHistorico(historico);
	}

}
