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
		System.out.println(">>> CONTROLLER VERTODOS <<<");
		List<Assunto> assuntos = assuntoService.verTodos();
		model.addAttribute("assuntos", assuntos);
		return "assunto/listar-assuntos";
	}
	
	@ResponseBody
	@GetMapping("/verTodosAPI")
	public List<Assunto> listarAssuntosAPI(Model model) {
		System.out.println(">>> CONTROLLER VERTODOS <<<");
		List<Assunto> assuntos = assuntoService.verTodos();
		return assuntos;
	}

	@PostMapping("/busca")
	public String buscaAssunto(@RequestParam("busca") String busca, Model model) {
		System.out.println(">>> CONTROLLER BUSCA <<<");
		List<Assunto> assuntos = assuntoService.busca(busca);
		model.addAttribute("assuntos", assuntos);
		return "assunto/listar-assuntos";
	}
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(Model model) {
		System.out.println(">>> CONTROLLER ADICIONA GET <<<");
		model.addAttribute("assunto", new Assunto());
		return "assunto/adicionar-assunto";
	}
	/*
	@PostMapping("/adiciona")
	public String adicionarAssunto(@ModelAttribute("assunto") @Valid Assunto assunto, BindingResult result) {
		System.out.println(">>> CONTROLLER ADICIONA POST <<<");
		if(result.hasErrors()) {
			return "assunto/adicionar-assunto";
		}else {
			assuntoService.salvarAssunto(assunto);
			return "redirect:/assunto/verTodos";
		}
	}
	*/
	@PostMapping("/adiciona")
	public String adicionarAssunto(@RequestParam("nome") String nome) {
		System.out.println(">>> CONTROLLER ADICIONA POST <<<");
		if(nome != null) {
			Assunto assunto = new Assunto();
			assunto.setNome(nome);
			assuntoService.salvarAssunto(assunto);
		}
		return "redirect:/assunto/verTodos";
	}
	
	@GetMapping("/edita")
	public String mostrarFormularioEdicao(@RequestParam("assuntoId") int id, Model model) {
		System.out.println(">>> CONTROLLER EDITA GET <<<");
		Assunto assunto = assuntoService.ver(id);
		model.addAttribute("assunto", assunto);
		return "assunto/editar-assunto";
	}

	@PostMapping("/edita")
	public String editaAssunto(@ModelAttribute("assunto") Assunto assunto) {
		System.out.println(">>> CONTROLLER EDITA POST <<<");
		assuntoService.editaAssunto(assunto);;
		return "redirect:/assunto/verTodos";
	}

	@GetMapping("/remove")
	public String removeAssunto(@RequestParam("assuntoId") int id) {
		System.out.println(">>> CONTROLLER REMOVE <<<");
		assuntoService.removeAssunto(id);
		return "redirect:/assunto/verTodos";
	}
	
}
