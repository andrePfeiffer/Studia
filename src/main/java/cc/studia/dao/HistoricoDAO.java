package cc.studia.dao;

import cc.studia.entity.Historico;

public interface HistoricoDAO {
	public boolean verificarHistorico(int usuarioId, String tipoConteudo, int conteudoId);
	public void gravarHistorico(Historico historico);
}
