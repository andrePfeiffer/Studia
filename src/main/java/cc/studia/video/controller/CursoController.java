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
import cc.studia.video.entity.Conteudo;
import cc.studia.video.entity.Curso;
import cc.studia.video.service.AssuntoService;
import cc.studia.video.service.ConteudoService;
import cc.studia.video.service.CursoService;

@Controller
@RequestMapping("/curso")
public class CursoController {
	
	@Autowired
	public CursoService cursoService;
	
	@Autowired
	public ConteudoService conteudoService;

	@Autowired
	public AssuntoService assuntoService;

	@GetMapping("/")
	public String home() {
		return "redirect:/curso/verTodos";
	}
	
	@GetMapping("/verTodos")
	public String listarCursos(Model model) {
		List<Curso> cursos = cursoService.verTodos();
		model.addAttribute("cursos", cursos);
		return "curso/listar-cursos";
	}
	
	@PostMapping("/busca")
	public String buscaCurso(@RequestParam("busca") String busca, Model model) {
		List<Curso> cursos = cursoService.busca(busca);
		model.addAttribute("cursos", cursos);
		return "curso/listar-cursos";
	}
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(Model model) {
		Curso curso = new Curso();
		model.addAttribute("curso", curso);
		List<Assunto> assuntos = assuntoService.verTodos();
		model.addAttribute("assuntos", assuntos);
		return "curso/adicionar-curso";
	}
	
	@PostMapping("/adiciona")
	public String adicionarCurso(@ModelAttribute("curso") Curso curso, @RequestParam("assuntoId") int assuntoId) {
		Assunto assunto = assuntoService.ver(assuntoId);
		Conteudo conteudo = curso.getConteudo();
		conteudo.setAssunto(assunto);
		int conteudoId = conteudoService.salvarConteudo(conteudo);
		curso.setIdConteudo(conteudoId);
		cursoService.salvarCurso(curso);
		return "redirect:/curso/verTodos";
	}
	
	@GetMapping("/edita")
	public String mostrarFormularioEdicao(@RequestParam("cursoId") int id, Model model) {
		Curso curso = cursoService.ver(id);
		model.addAttribute("curso", curso);
		return "curso/editar-curso";
	}
	
	@PostMapping("/edita")
	public String editaAssunto(@ModelAttribute("curso") Curso curso) {
		conteudoService.editaConteudo(curso.getConteudo());
		cursoService.editaCurso(curso);
		return "redirect:/curso/verTodos";
	}

	@GetMapping("/remove")
	public String removeCurso(@RequestParam("cursoId") int id) {
		cursoService.removeCurso(id);
		return "redirect:/curso/verTodos";
	}
	
}
