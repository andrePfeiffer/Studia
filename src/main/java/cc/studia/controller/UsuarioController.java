package cc.studia.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.studia.entity.Usuario;
import cc.studia.service.UsuarioService;

@Controller
public class UsuarioController {
	
	@Autowired
	UsuarioService usuarioService;
	
	@GetMapping("/")
	public String showHome() {
		return "home";
	}
	
	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage(HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	    	HttpSession session = request.getSession();
	    	Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
	    	if(usuarioLogado != null) {
		    	if(usuarioLogado.getNome().equals(auth.getName())) {
		    		String mensagem = "Usuario logado e verificado";
			    	model.addAttribute("mensagem", mensagem);
		    	}
	    	}

	    }
		return "plain-login";
	}
	
	@ResponseBody
	@PostMapping("/adicionarUsuario")
	public String adicionarUsuario(HttpServletRequest request, Model model) {
		String email = request.getParameter("emailCadastro");
		String login = request.getParameter("userCadastro");
		String senha = request.getParameter("senhaCadastro1");
		
		if(!senha.equals(request.getParameter("senhaCadastro2"))){
			return "false1";
		}
		if(usuarioService.existeEmail(email)) {
			return "false2";
		}
		if(usuarioService.existeLogin(login)) {
			return "false3";
		}
		if(senha.length() < 4) {
			return "false4";
		}
		usuarioService.save(email, login, senha);
		return "true";
	}
	
	@GetMapping("/admin")
	public String showMyAdminPage() {
		return "home";
	}
	@GetMapping("/logout")
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/showMyLoginPage?logout";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}
	
	@GetMapping("/reset-senha")
	public String recuperaSenhaForm() {
	    return "reset-senha";
	}

	@PostMapping("/reset-senha")
	public String recuperaSenha(@RequestParam("userLogin") String userLogin, Model model) {
		Usuario usuario = usuarioService.findByUserName(userLogin);
		if(usuario == null) {
    		String mensagem = "Usuario não encontrado";
	    	model.addAttribute("mensagem", mensagem);			
		}else {
			usuarioService.enviarEmailRecuperarSenha(usuario);
    		String mensagem = "Email enviado com link para redefinição de senha";
	    	model.addAttribute("mensagem", mensagem);			
		}
	    return "reset-senha";
	}
	
	@GetMapping("/nova-senha")
	public String novaSenhaForm(@RequestParam("code") String code, Model model) {
    	model.addAttribute("code", code);			
	    return "nova-senha";
	}
	
	@PostMapping("/nova-senha")
	public String novaSenha(
			@RequestParam("code") String code, 
			@RequestParam("userLogin") String userLogin, 
			@RequestParam("senha1") String senha1, 
			@RequestParam("senha2") String senha2, 
			Model model) {
		Usuario usuario = usuarioService.findByUserName(userLogin);
		String mensagem = null;
		if(usuario == null) {
    		mensagem = "Usuario não encontrado";
	    	model.addAttribute("mensagem", mensagem);			
		}else {
			String codigo = usuarioService.gerarCodigo(usuario.getNome());
			if(!codigo.equals(code)) {
				mensagem = "O seu link expirou";
		    	model.addAttribute("mensagem", mensagem);			
			}
		}
		if(senha1.length() < 4) {
			mensagem = "A senha não atende aos requisitos de segurança";
			model.addAttribute("mensagem", mensagem);
		}
		if(!senha1.equals(senha2)){
			mensagem = "As senhas devem ser idênticas";
			model.addAttribute("mensagem", mensagem);
		}
		if(mensagem == null){
			usuarioService.atualizaSenha(usuario, senha1);
    		mensagem = "Senha alterada com sucesso";
	    	model.addAttribute("mensagem", mensagem);			
		}
	    return "nova-senha";
	}
}
