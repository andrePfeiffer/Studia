package cc.studia.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import cc.studia.service.UsuarioService;

@Configuration
@EnableWebSecurity
public class CustomSecurityConfig extends WebSecurityConfigurerAdapter {
	
    @Autowired
    private UsuarioService usuarioService;
	
    @Autowired
    private CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
    
    @Autowired
    private CustomAuthenticationFailureHandler customAuthenticationFailureHandler;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter,CsrfFilter.class);
			
		http.csrf().disable()
		.authorizeRequests()
		.antMatchers("/").permitAll()
		.antMatchers("/adicionarUsuario").permitAll()
		.antMatchers("/logout").permitAll()
		.antMatchers("/reset-senha").permitAll()
		.antMatchers("/edita-usuario").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/admin").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/nova-senha").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/assunto/").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/assunto/verTodos").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/assunto/verTodosAPI").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/assunto/busca").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/assunto/adiciona").hasAnyAuthority("Administrador", "Coordenador Acadêmico")
		.antMatchers("/assunto/edita").hasAnyAuthority("Administrador", "Coordenador Acadêmico")
		.antMatchers("/assunto/remove").hasAnyAuthority("Administrador", "Coordenador Acadêmico")
		.antMatchers("/aula/").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/aula/ver").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/aula/verTodos").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/aula/busca").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/aula/ver").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/aula/adiciona").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/aula/edita").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/aula/remove").hasAnyAuthority("Administrador", "Coordenador Acadêmico")
		.antMatchers("/aula/modifica-ordem").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/aula/concluir").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/componente/ver").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/componente/editar").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/componente/remover").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/componente/modifica-ordem").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/curso/").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/curso/verTodos").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/curso/ver").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/curso/busca").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/curso/adiciona").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/curso/edita").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/curso/remove").hasAnyAuthority("Administrador", "Coordenador Acadêmico")
		.antMatchers("/exercicio/adiciona").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/historico/verifica").hasAnyAuthority("Administrador", "Aluno", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/material/adiciona").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")
		.antMatchers("/video/adiciona").hasAnyAuthority("Administrador", "Instrutor", "Coordenador Acadêmico")

		.and().formLogin()
		.failureHandler(customAuthenticationFailureHandler)
		.loginPage("/showMyLoginPage")
		.loginProcessingUrl("/autenticateTheUser")
		.successHandler(customAuthenticationSuccessHandler)
		.permitAll()
		
		.and().logout().permitAll()
		
		.and().exceptionHandling()
		.accessDeniedPage("/showMyLoginPage?denied");
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		auth.setUserDetailsService(usuarioService); //set the custom user details service
		auth.setPasswordEncoder(passwordEncoder()); //set the password encoder - bcrypt
		return auth;
	}
	
}
