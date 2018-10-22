package cc.studia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cc.studia.entity.Assunto;
import cc.studia.service.AssuntoService;

@Controller
@RequestMapping("/assunto")
public class AssuntoController {
	
	@Autowired
	public AssuntoService assuntoService;
	
	@GetMapping("/")
	public String home() {
		return "redirect:/assunto/verTodos";
	}
	
	@GetMapping("/verTodos")
	public String listarAssuntos(Model model) {
		List<Assunto> assuntos = assuntoService.verTodos();
		model.addAttribute("assuntos", assuntos);
		return "assunto/listar-assuntos";
	}
	
	@ResponseBody
	@GetMapping("/verTodosAPI")
	public List<Assunto> listarAssuntosAPI(Model model) {
		List<Assunto> assuntos = assuntoService.verTodos();
		return assuntos;
	}

	@PostMapping("/busca")
	public String buscaAssunto(@RequestParam("busca") String busca, Model model) {
		List<Assunto> assuntos = assuntoService.busca(busca);
		model.addAttribute("assuntos", assuntos);
		return "assunto/listar-assuntos";
	}
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(Model model) {
		model.addAttribute("assunto", new Assunto());
		return "assunto/adicionar-assunto";
	}

	@PostMapping("/adiciona")
	public String adicionarAssunto(RedirectAttributes attributes, @RequestParam("nome") String nome) {
		if(nome != null) {
			Assunto assunto = new Assunto();
			assunto.setNome(nome);
			assuntoService.salvarAssunto(assunto);
			attributes.addFlashAttribute("mensagemFlash", "Assunto criado com sucesso");
		}
		return "redirect:/assunto/verTodos";
	}
	
	@GetMapping("/edita")
	public String mostrarFormularioEdicao(@RequestParam("assuntoId") int id, Model model) {
		Assunto assunto = assuntoService.ver(id);
		model.addAttribute("assunto", assunto);
		return "assunto/editar-assunto";
	}

	@PostMapping("/edita")
	public String editaAssunto(RedirectAttributes attributes, @ModelAttribute("assunto") Assunto assunto) {
		assuntoService.editaAssunto(assunto);;
		attributes.addFlashAttribute("mensagemFlash", "Assunto salvo com sucesso");
		return "redirect:/assunto/verTodos";
	}

	@GetMapping("/remove")
	public String removeAssunto(RedirectAttributes attributes, @RequestParam("assuntoId") int id) {
		assuntoService.removeAssunto(id);
		attributes.addFlashAttribute("mensagemFlash", "Assunto removido com sucesso");
		return "redirect:/assunto/verTodos";
	}
	
}
