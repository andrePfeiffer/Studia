package cc.studia.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import cc.studia.entity.Usuario;
import cc.studia.service.UsuarioService;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UsuarioService usuarioService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		String userName = authentication.getName();
		Usuario usuario = usuarioService.findByUserName(userName);
		HttpSession session = request.getSession();
		session.setAttribute("usuario", usuario);
		response.sendRedirect(request.getContextPath() + "/");
	}

}
