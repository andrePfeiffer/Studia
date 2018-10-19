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
import cc.studia.entity.Aula;
import cc.studia.entity.Conteudo;
import cc.studia.entity.Curso;
import cc.studia.service.AssuntoService;
import cc.studia.service.AulaService;
import cc.studia.service.ConteudoService;
import cc.studia.service.CursoService;
import cc.studia.service.UsuarioService;

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
	
	@Autowired
	public UsuarioService usuarioService;

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
	public String adicionarAula(
			Authentication authentication,
			@RequestParam("tituloAula") String tituloAula,
			@RequestParam("descricaoAula") String descricaoAula, 
			@RequestParam("aulaPublica") boolean aulaPublica, 
			@RequestParam("cursoId") int cursoId) {
		Curso curso = cursoService.ver(cursoId);
		Conteudo conteudo = new Conteudo();
		conteudo.setAutor(usuarioService.findByUserName(authentication.getName()));
		conteudo.setNome(tituloAula);
		conteudo.setDescricao(descricaoAula);
		conteudo.setPublico(aulaPublica);
		int conteudoId = conteudoService.salvarConteudo(conteudo);
		Aula aula = new Aula();
		aula.setIdConteudo(conteudoId);
		aula.setConteudo(conteudo);
		aula.setIdCurso(cursoId);
		aula.setCurso(curso);
		aulaService.salvarAula(aula);
		return "redirect:/curso/ver?cursoId=" + cursoId;
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
