package cc.studia.video.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cc.studia.video.entity.Assunto;
import cc.studia.video.entity.Aula;
import cc.studia.video.entity.Conteudo;
import cc.studia.video.entity.Curso;
import cc.studia.video.service.AssuntoService;
import cc.studia.video.service.AulaService;
import cc.studia.video.service.ConteudoService;
import cc.studia.video.service.CursoService;

@Controller
@RequestMapping("/aula")
public class AulaController {
	
	@Autowired
	public AulaService aulaService;
	
	@Autowired
	public ConteudoService conteudoService;

	@Autowired
	public CursoService cursoService;

	@Autowired
	public AssuntoService assuntoService;

	@GetMapping("/")
	public String home() {
		return "redirect:/aula/verTodos";
	}
	
	@GetMapping("/verTodos")
	public String listarAulas(Model model) {
		List<Aula> aulas = aulaService.verTodos();
		model.addAttribute("aulas", aulas);
		return "aula/listar-aulas";
	}
	
	@PostMapping("/busca")
	public String buscaAula(@RequestParam("busca") String busca, Model model) {
		List<Aula> aulas = aulaService.busca(busca);
		model.addAttribute("aulas", aulas);
		return "aula/listar-aulas";
	}
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(Model model) {
		Aula aula = new Aula();
		model.addAttribute("aula", aula);
		List<Assunto> assuntos = assuntoService.verTodos();
		model.addAttribute("assuntos", assuntos);
		List<Curso> cursos = cursoService.verTodos();
		model.addAttribute("cursos", cursos);
		return "aula/adicionar-aula";
	}
	
	@PostMapping("/adiciona")
	public String adicionarAula(@ModelAttribute("aula") Aula aula, @RequestParam("assuntoId") int assuntoId, @RequestParam("cursoId") int cursoId) {
		Assunto assunto = assuntoService.ver(assuntoId);
		Curso curso = cursoService.ver(cursoId);
		Conteudo conteudo = aula.getConteudo();
		conteudo.setAssunto(assunto);
		int conteudoId = conteudoService.salvarConteudo(conteudo);
		aula.setIdConteudo(conteudoId);
		aula.setIdCurso(cursoId);
		aula.setCurso(curso);
		aulaService.salvarAula(aula);
		return "redirect:/aula/verTodos";
	}
	
	@GetMapping("/edita")
	public String mostrarFormularioEdicao(@RequestParam("aulaId") int id, Model model) {
		Aula aula = aulaService.ver(id);
		model.addAttribute("aula", aula);
		return "aula/editar-aula";
	}
	
	@PostMapping("/edita")
	public String editaAula(@ModelAttribute("aula") Aula aula) {
		conteudoService.editaConteudo(aula.getConteudo());
		return "redirect:/aula/verTodos";
	}

	@GetMapping("/remove")
	public String removeAula(@RequestParam("aulaId") int id) {
		aulaService.removeAula(id);
		return "redirect:/aula/verTodos";
	}
	
}
