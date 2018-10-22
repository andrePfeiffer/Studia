package cc.studia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cc.studia.entity.Assunto;
import cc.studia.entity.Aula;
import cc.studia.entity.Conteudo;
import cc.studia.entity.Curso;
import cc.studia.entity.Historico;
import cc.studia.entity.Usuario;
import cc.studia.service.AssuntoService;
import cc.studia.service.AulaService;
import cc.studia.service.ConteudoService;
import cc.studia.service.CursoService;
import cc.studia.service.HistoricoService;
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
	
	@Autowired
	public HistoricoService historicoService;
	

	@GetMapping("/")
	public String home() {
		return "redirect:/aula/verTodos";
	}
	
	@GetMapping("/ver")
	public String listarAulas(@RequestParam("aulaId") int aulaId, Model model) {
		Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		return "aula/ver-aula";
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
			RedirectAttributes attributes,
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
		attributes.addFlashAttribute("mensagemFlash", "Aula criada com sucesso");
		return "redirect:/curso/ver?cursoId=" + cursoId;
	}
	
	@GetMapping("/edita")
	public String mostrarFormularioEdicao(@RequestParam("aulaId") int id, Model model) {
		Aula aula = aulaService.ver(id);
		model.addAttribute("aula", aula);
		return "aula/editar-aula";
	}
	
	@PostMapping("/edita")
	public String editaAula(
			RedirectAttributes attributes,
			@RequestParam("conteudoId") int conteudoId,
			@RequestParam("nome") String nome,
			@RequestParam("descricao") String descricao, 
			@RequestParam("cursoId") int cursoId,
			@RequestParam("conteudoPublico") boolean conteudoPublico){
		Conteudo conteudo = conteudoService.ver(conteudoId);
		conteudo.setPublico(conteudoPublico);
		conteudo.setDescricao(descricao);
		conteudo.setNome(nome);
		conteudoService.editaConteudo(conteudo);
		attributes.addFlashAttribute("mensagemFlash", "Aula salva com sucesso");
		return "redirect:/curso/ver?cursoId=" + cursoId;
	}

	@GetMapping("/remove")
	public String removeAula(RedirectAttributes attributes, @RequestParam("aulaId") int id) {
		aulaService.removeAula(id);
		attributes.addFlashAttribute("mensagemFlash", "Aula removida com sucesso");
		return "redirect:/aula/verTodos";
	}
	
	@PostMapping("/modifica-ordem")
	public String modificaOrdem(@RequestBody List<Aula> listaAulas) {
		aulaService.modificaOrdem(listaAulas);
		return "Nova ordenação salva";
	}
	
	@GetMapping("/concluir")
	public String concluirAula(
			RedirectAttributes attributes,
			Authentication authentication,
			@RequestParam("aulaId") int aulaId,
			@RequestParam("cursoId") int cursoId,
			Model model
			) {
		Usuario usuario = usuarioService.findByUserName(authentication.getName());
		String tipoConteudo = "aula";
		Historico historico = new Historico();
		historico.setConteudoId(aulaId);
		historico.setTipoConteudo(tipoConteudo);
		historico.setUsuarioId(usuario.getId());
		historico.setUsuario(usuario);
		historicoService.gravarHistorico(historico);
		attributes.addFlashAttribute("mensagemFlash", "Aula concluída");
		return "redirect:/curso/ver?cursoId="+cursoId;
	}
}
