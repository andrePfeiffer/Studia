package cc.studia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cc.studia.entity.Assunto;
import cc.studia.entity.Curso;
import cc.studia.service.AssuntoService;
import cc.studia.service.ConteudoService;
import cc.studia.service.CursoService;
import cc.studia.service.UsuarioService;

@Controller
@RequestMapping("/curso")
public class CursoController {
	
	@Autowired
	public CursoService cursoService;
	
	@Autowired
	public ConteudoService conteudoService;

	@Autowired
	public AssuntoService assuntoService;
	
	@Autowired
	public UsuarioService usuarioService;

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

	@GetMapping("/ver")
	public String listarCursos(@RequestParam("cursoId") int cursoId, Model model) {
		Curso curso = cursoService.ver(cursoId);
		model.addAttribute("curso", curso);
		return "curso/ver-curso";
	}

	@PostMapping("/busca")
	public String buscaCurso(@RequestParam("busca") String busca, Model model) {
		List<Curso> cursos = cursoService.busca(busca);
		model.addAttribute("cursos", cursos);
		return "curso/listar-cursos";
	}
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(Model model) {
		List<Assunto> assuntos = assuntoService.verTodos();
		model.addAttribute("assuntos", assuntos);
		return "curso/adicionar-curso";
	}
	
	@PostMapping("/adiciona")
	public String adicionarCurso(
			RedirectAttributes attributes,
			Authentication authentication,
			@RequestParam("conteudoPublico") boolean conteudoPublico,
			@RequestParam("assuntoId") int assuntoId,
			@RequestParam("nome") String nome,
			@RequestParam("descricao") String descricao) {
		String login = authentication.getName();
		int conteudoId = conteudoService.salvarConteudo(login, nome, descricao, conteudoPublico);
		cursoService.salvar(conteudoId, assuntoId);
		attributes.addFlashAttribute("mensagemFlash", "Curso criado com sucesso");
		return "redirect:/curso/verTodos";
	}
	
	@GetMapping("/edita")
	public String mostrarFormularioEdicao(@RequestParam("cursoId") int id, Model model) {
		Curso curso = cursoService.ver(id);
		model.addAttribute("curso", curso);
		return "curso/editar-curso";
	}
	
	@PostMapping("/edita")
	public String editaCurso(
			RedirectAttributes attributes,
			@RequestParam("conteudoId") int conteudoId,
			@RequestParam("nome") String nome,
			@RequestParam("descricao") String descricao,
			@RequestParam("conteudoPublico") boolean conteudoPublico) {
		conteudoService.editar(conteudoId, nome, descricao, conteudoPublico);
		attributes.addFlashAttribute("mensagemFlash", "Curso salvo com sucesso");
		return "redirect:/curso/verTodos";
	}

	@GetMapping("/remove")
	public String removeCurso(RedirectAttributes attributes, @RequestParam("cursoId") int id) {
		cursoService.removeCurso(id);
		attributes.addFlashAttribute("mensagemFlash", "Curso removido com sucesso");
		return "redirect:/curso/verTodos";
	}
	
}
