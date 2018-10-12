package cc.studia.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import cc.studia.entity.Usuario;

@Controller
public class UsuarioController {
	
	@GetMapping("/")
	public String showHome() {
		return "home";
	}
	
	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage(HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	    	HttpSession session = request.getSession();
	    	Usuario usuarioLogado = (Usuario) session.getAttribute("user");
	    	if(usuarioLogado != null) {
		    	if(usuarioLogado.getNome().equals(auth.getName())) {
		    		String mensagem = "Usuario logado e verificado";
			    	model.addAttribute("mensagem", mensagem);
		    	}
	    	}

	    }
		return "plain-login";
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
}
