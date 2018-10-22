package cc.studia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cc.studia.service.HistoricoService;

@RestController
@RequestMapping("/historico")
public class HistoricoController {
	
	@Autowired
	public HistoricoService historicoService;

	@PostMapping("/verifica")
	public String verifica(
			@RequestParam("conteudoId") int conteudoId, 
			@RequestParam("usuarioId") int usuarioId, 
			@RequestParam("tipoConteudo") String tipoConteudo, 
			Model model) {
		if(historicoService.verificarHistorico(usuarioId, tipoConteudo, conteudoId)) {
			return "true";
		}else {
			return "false";
		}
	}
}
