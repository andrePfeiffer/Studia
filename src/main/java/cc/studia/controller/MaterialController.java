package cc.studia.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cc.studia.entity.Aula;
import cc.studia.entity.ComponenteAula;
import cc.studia.entity.Material;
import cc.studia.service.AulaService;
import cc.studia.service.ComponenteAulaService;
import cc.studia.service.MaterialService;

@Controller
@RequestMapping("/material")
public class MaterialController {
	
	@Autowired
	public AulaService aulaService;
	
	@Autowired
	public ComponenteAulaService componenteAulaService;
	
	@Autowired
	public MaterialService materialService;
	
	private static String UPLOADED_FOLDER = "C:\\Users\\andre\\eclipse-workspace\\video\\src\\main\\webapp\\material\\";
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(@RequestParam("aulaId") int aulaId, Model model) {
		Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		return "material/adicionar-material";
	}

	@PostMapping("/adiciona")
	public String adicionaVideo(
			@RequestParam("material") MultipartFile file,
			@RequestParam("aulaId") int aulaId,
			@RequestParam("titulo") String titulo,
			@RequestParam("descricao") String descricao,
			@RequestParam("materialPublico") boolean materialPublico,
			Model model) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                Files.write(path, bytes);
                ComponenteAula componenteAula = new ComponenteAula();
                componenteAula.setAula(aulaService.ver(aulaId));
                componenteAula.setIdAula(aulaId);
                componenteAula.setTitulo(titulo);
                componenteAula.setDescricao(descricao);
                componenteAula.setPublico(materialPublico);
                int componenteAulaId = componenteAulaService.salvar(componenteAula);
                Material material = new Material();
                material.setArquivo(file.getOriginalFilename());
                material.setTipoArquivo(file.getContentType());
                material.setComponenteAula(componenteAula);
                material.setIdComponente(componenteAulaId);
                materialService.salvar(material);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		return "redirect:/aula/edita?aulaId=" + aulaId;
	}

}
