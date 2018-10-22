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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	private static String UPLOADED_FOLDER = "/home/andre/eclipse-workspace/Studia/src/main/webapp/video/";
	
	@GetMapping("/adiciona")
	public String mostrarFormulario(@RequestParam("aulaId") int aulaId, Model model) {
		Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		return "video/adicionar-video";
	}

	@PostMapping("/adiciona")
	public String adicionaVideo(
			RedirectAttributes attributes,
			@RequestParam("video") MultipartFile file,
			@RequestParam("aulaId") int aulaId,
			@RequestParam("titulo") String titulo,
			@RequestParam("descricao") String descricao,
			@RequestParam("videoPublico") boolean videoPublico,
			Model model) {
		String mensagem = "";
        if (file.isEmpty()) {
			mensagem = mensagem + "O campo arquivo é obrigatório<br>";
        }else {
        	if(!file.getContentType().equals("video/mp4")) {
    			mensagem = mensagem + "O video deve ser no formato MP4 e utilizado o codec H.264<br>";
        	}else {
                try {
                    byte[] bytes = file.getBytes();
                    Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                    Files.write(path, bytes);
                    ComponenteAula componenteAula = new ComponenteAula();
                    System.out.println(aulaId);
                    componenteAula.setAula(aulaService.ver(aulaId));
                    componenteAula.setIdAula(aulaId);
                    componenteAula.setTitulo(titulo);
                    componenteAula.setDescricao(descricao);
                    componenteAula.setPublico(videoPublico);
                    int componenteAulaId = componenteAulaService.salvar(componenteAula);
                    Video video = new Video();
                    video.setArquivo(file.getOriginalFilename());
                    video.setTipoArquivo(file.getContentType());
                    video.setComponenteAula(componenteAula);
                    video.setIdComponente(componenteAulaId);
                    videoService.salvar(video);
                    attributes.addFlashAttribute("mensagemFlash", "Video cadastrado com sucesso");
            		return "redirect:/aula/edita?aulaId=" + aulaId;
                } catch (IOException e) {
                    e.printStackTrace();
                }
        	}
        }
        Aula aula = aulaService.ver(aulaId);
		model.addAttribute("aula", aula);
		model.addAttribute("mensagem", mensagem);
        return "video/adicionar-video";
	}

}
