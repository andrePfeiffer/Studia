package cc.studia.service;

import cc.studia.entity.Historico;

public interface HistoricoService {
	public boolean verificarHistorico(int usuarioId, String tipoConteudo, int conteudoId);
	public void gravarHistorico(Historico historico);
	public void gravarHistorico(String login, int componenteId, String tipoConteudo);
}
