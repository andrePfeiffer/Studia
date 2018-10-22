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

import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;
import cc.studia.entity.Exercicio;
import cc.studia.entity.Historico;
import cc.studia.entity.Material;
import cc.studia.entity.Usuario;
import cc.studia.entity.Video;
import cc.studia.service.AulaService;
import cc.studia.service.ComponenteAulaService;
import cc.studia.service.ExercicioService;
import cc.studia.service.HistoricoService;
import cc.studia.service.MaterialService;
import cc.studia.service.UsuarioService;
import cc.studia.service.VideoService;

@Controller
@RequestMapping("/componente")
public class ComponenteAulaController {

	@Autowired
	private ComponenteAulaService componenteAulaService;
	
	@Autowired
	private AulaService aulaService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private MaterialService materialService;
	
	@Autowired
	private ExercicioService exercicioService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private HistoricoService historicoService;
	
	@GetMapping("/ver")
	public String verComponente(
			Authentication authentication,
			@RequestParam("componenteId") int componenteId, 
			@RequestParam("aulaId") int aulaId, 
			Model model) {
		Usuario usuario = usuarioService.findByUserName(authentication.getName());
		String tipoConteudo = "componente";
		Historico historico = new Historico();
		historico.setConteudoId(componenteId);
		historico.setTipoConteudo(tipoConteudo);
		historico.setUsuarioId(usuario.getId());
		historico.setUsuario(usuario);
		historicoService.gravarHistorico(historico);
		ComponenteAula componente = componenteAulaService.ver(componenteId);
		Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		model.addAttribute("componente", componente);
		String tipoComponente = componenteAulaService.tipoComponente(componenteId);
		if(tipoComponente == "video") {
			Video video = videoService.ver(componenteId);
			model.addAttribute("video", video);
		}
		if(tipoComponente == "material") {
			Material material = materialService.ver(componenteId);
			model.addAttribute("material", material);
		}
		if(tipoComponente == "exercicio") {
			Exercicio exercicio = exercicioService.ver(componenteId);
			model.addAttribute("exercicio", exercicio);
		}
		model.addAttribute("tipoComponente", tipoComponente);
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
			RedirectAttributes attributes,
			@RequestParam("aulaId") int aulaId,
			@RequestParam("componenteId") int componenteId,
			@RequestParam("titulo") String titulo,
			@RequestParam("descricao") String descricao,
			@RequestParam("componentePublico") boolean componentePublico) {
		ComponenteAula componente = componenteAulaService.ver(componenteId);
		componente.setTitulo(titulo);
		componente.setDescricao(descricao);
		componente.setPublico(componentePublico);
		componenteAulaService.editar(componente);
		attributes.addFlashAttribute("mensagemFlash", "Conteúdo salvo com sucesso");
		return "redirect:/componente/editar?componenteId=" + componenteId + "&aulaId=" + aulaId;
	}

	@GetMapping("/remover")
	public String removeComponente(RedirectAttributes attributes, @RequestParam("componenteId") int componenteId, @RequestParam("aulaId") int aulaId) {
		componenteAulaService.remover(componenteId);
		attributes.addFlashAttribute("mensagemFlash", "Conteúdo removido com sucesso");
		return "redirect:/aula/edita?aulaId=" + aulaId;
	}
	
	@PostMapping("/modifica-ordem")
	public String modificaOrdem(@RequestBody List<ComponenteAula> listaComponentes) {
		componenteAulaService.modificaOrdem(listaComponentes);
		return "Nova ordenação salva";
	}
}
