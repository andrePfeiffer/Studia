package cc.studia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cc.studia.entity.Assunto;
import cc.studia.entity.Conteudo;
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
			Authentication authentication,
			@RequestParam("conteudoPublico") boolean conteudoPublico,
			@RequestParam("assuntoId") int assuntoId,
			@RequestParam("nome") String nome,
			@RequestParam("descricao") String descricao) {
		Assunto assunto = assuntoService.ver(assuntoId);
		Conteudo conteudo = new Conteudo();
		conteudo.setAutor(usuarioService.findByUserName(authentication.getName()));
		conteudo.setNome(nome);
		conteudo.setDescricao(descricao);
		conteudo.setAprovado(false);
		conteudo.setPublico(conteudoPublico);
		int conteudoId = conteudoService.salvarConteudo(conteudo);
		Curso curso = new Curso();
		curso.setConteudo(conteudo);
		curso.setAssunto(assunto);
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
	public String editaCurso(@ModelAttribute("curso") Curso curso) {
		conteudoService.editaConteudo(curso.getConteudo());
		return "redirect:/curso/verTodos";
	}

	@GetMapping("/remove")
	public String removeCurso(@RequestParam("cursoId") int id) {
		cursoService.removeCurso(id);
		return "redirect:/curso/verTodos";
	}
	
}
