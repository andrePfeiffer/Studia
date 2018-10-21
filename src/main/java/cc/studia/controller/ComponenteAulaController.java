package cc.studia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;
import cc.studia.service.AulaService;
import cc.studia.service.ComponenteAulaService;

@Controller
@RequestMapping("/componente")
public class ComponenteAulaController {

	@Autowired
	private ComponenteAulaService componenteAulaService;
	
	@Autowired
	private AulaService aulaService;
	
	@GetMapping("/ver")
	public String verComponente(@RequestParam("componenteId") int componenteId, @RequestParam("aulaId") int aulaId, Model model) {
		ComponenteAula componente = componenteAulaService.ver(componenteId);
		model.addAttribute("componente", componente);
		return "componente/ver-componente";
	}
	
	@GetMapping("/editar")
	public String mostrarFormularioEdicao(
			@RequestParam("componenteId") int componenteId, 
			@RequestParam("aulaId") int aulaId, 
			Model model) {
		ComponenteAula componente = componenteAulaService.ver(componenteId);
		Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		model.addAttribute("componente", componente);
		return "componente/editar-componente";
	}
	
	@PostMapping("/editar")
	public String editaComponente(
			@RequestParam("aulaId") int aulaId,
			@RequestParam("componenteId") int componenteId,
			@RequestParam("descricao") String descricao,
			@RequestParam("componentePublico") boolean componentePublico) {
		ComponenteAula componente = componenteAulaService.ver(componenteId);
		componente.setDescricao(descricao);
		componente.setPublico(componentePublico);
		componenteAulaService.editar(componente);
		return "redirect:/componente/editar?componenteId=" + componenteId + "&aulaId=" + aulaId;
	}

	@GetMapping("/remover")
	public String removeComponente(@RequestParam("componenteId") int componenteId, @RequestParam("aulaId") int aulaId) {
		componenteAulaService.remover(componenteId);
		return "redirect:/aula/edita?aulaId=" + aulaId;
	}
	
	@PostMapping("/modifica-ordem")
	public String modificaOrdem(@RequestBody List<ComponenteAula> listaComponentes) {
		componenteAulaService.modificaOrdem(listaComponentes);
		return "Nova ordenação salva";
	}
}
