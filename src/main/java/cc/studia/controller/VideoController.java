package cc.studia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cc.studia.entity.Aula;
import cc.studia.service.AulaService;

@Controller
@RequestMapping("/video")
public class VideoController {
	
	@Autowired
	public AulaService aulaService;
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(@RequestParam("aulaId") int aulaId, Model model) {
		Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		return "video/adicionar-video";
	}

}
