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
import cc.studia.video.service.AssuntoService;

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
	
	@GetMapping("/adicionar")
	public String mostrarFormulario(Model model) {
		Assunto assunto = new Assunto();
		model.addAttribute("assunto", assunto);
		return "assunto/adicionar-assunto";
	}
	
	@PostMapping("/adicionarAssunto")
	public String adicionarAssunto(@ModelAttribute("assunto") Assunto assunto) {
		assuntoService.salvarAssunto(assunto);
		return "redirect:/assunto/verTodos";
	}
	
	@GetMapping("/editaAssunto")
	public String mostrarFormularioEdicao(@RequestParam("assuntoId") int id, Model model) {
		Assunto assunto = assuntoService.ver(id);
		model.addAttribute("assunto", assunto);
		return "assunto/editar-assunto";
	}
	
	@GetMapping("/delete")
	public String removeAssunto(@RequestParam("assuntoId") int id) {
		assuntoService.removeAssunto(id);
		return "redirect:/assunto/verTodos";
	}
	
	@PostMapping("/buscaAssuntos")
	public String buscaAssunto(@RequestParam("busca") String busca, Model model) {
		List<Assunto> assuntos = assuntoService.busca(busca);
		model.addAttribute("assuntos", assuntos);
		return "assunto/listar-assuntos";
	}
}
