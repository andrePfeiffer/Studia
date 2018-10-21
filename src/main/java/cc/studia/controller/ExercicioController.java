package cc.studia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;
import cc.studia.entity.Exercicio;
import cc.studia.service.AulaService;
import cc.studia.service.ComponenteAulaService;
import cc.studia.service.ExercicioService;

@Controller
@RequestMapping("/exercicio")
public class ExercicioController {
	
	@Autowired
	public AulaService aulaService;
	
	@Autowired
	public ComponenteAulaService componenteAulaService;
	
	@Autowired
	public ExercicioService exercicioService;
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(@RequestParam("aulaId") int aulaId, Model model) {
		Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		return "exercicio/adicionar-exercicio";
	}

	@PostMapping("/adiciona")
	public String adicionaExercicio(
			@RequestParam("aulaId") int aulaId,
			@RequestParam("descricao") String descricao,
			@RequestParam("exercicioPublico") boolean exercicioPublico,
			Model model) {
        ComponenteAula componenteAula = new ComponenteAula();
        componenteAula.setAula(aulaService.ver(aulaId));
        componenteAula.setIdAula(aulaId);
        componenteAula.setDescricao(descricao);
        componenteAula.setPublico(exercicioPublico);
        int componenteAulaId = componenteAulaService.salvar(componenteAula);
        Exercicio exercicio = new Exercicio();
        exercicio.setComponenteAula(componenteAula);
        exercicio.setIdComponente(componenteAulaId);
        exercicioService.salvar(exercicio);
		return "redirect:/aula/edita?aulaId=" + aulaId;
	}

}