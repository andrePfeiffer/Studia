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
import cc.studia.entity.Video;
import cc.studia.service.AulaService;
import cc.studia.service.ComponenteAulaService;
import cc.studia.service.VideoService;

@Controller
@RequestMapping("/video")
public class VideoController {
	
	@Autowired
	public AulaService aulaService;
	
	@Autowired
	public ComponenteAulaService componenteAulaService;
	
	@Autowired
	public VideoService videoService;
	
	private static String UPLOADED_FOLDER = "C:\\Users\\andre\\eclipse-workspace\\video\\src\\main\\webapp\\videos\\";
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(@RequestParam("aulaId") int aulaId, Model model) {
		Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		return "video/adicionar-video";
	}

	@PostMapping("/adiciona")
	public String adicionaVideo(
			@RequestParam("video") MultipartFile file,
			@RequestParam("aulaId") int aulaId,
			@RequestParam("descricao") String descricao,
			@RequestParam("videoPublico") boolean videoPublico,
			Model model) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                Files.write(path, bytes);
                ComponenteAula componenteAula = new ComponenteAula();
                System.out.println(aulaId);
                componenteAula.setAula(aulaService.ver(aulaId));
                componenteAula.setIdAula(aulaId);
                componenteAula.setDescricao(descricao);
                componenteAula.setPublico(videoPublico);
                int componenteAulaId = componenteAulaService.salvar(componenteAula);
                Video video = new Video();
                video.setArquivo(file.getOriginalFilename());
                video.setTipoArquivo(file.getContentType());
                video.setComponenteAula(componenteAula);
                video.setIdComponente(componenteAulaId);
                videoService.salvar(video);
                
                
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		return "video/adicionar-video";
	}

}
