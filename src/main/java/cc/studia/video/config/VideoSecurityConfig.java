package cc.studia.video.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class VideoSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource myDataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(myDataSource);
		/*
        UserBuilder users = User.withDefaultPasswordEncoder();
        auth.inMemoryAuthentication()
        .withUser(users.username("andre").password("test123").roles("EMPLOYEE", "MANAGER", "ADMIN"))
        .withUser(users.username("mary").password("test123").roles("EMPLOYEE", "MANAGER"))
        .withUser(users.username("susan").password("test123").roles("EMPLOYEE"));
        */
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/").hasRole("EMPLOYEE")
			.antMatchers("/admin/**").hasRole("ADMIN")
			
			.and().formLogin()
			.loginPage("/showMyLoginPage")
			.loginProcessingUrl("/autenticateTheUser")
			.permitAll()
			
			.and().logout().permitAll()
			
			.and().exceptionHandling()
			.accessDeniedPage("/showMyLoginPage?denied");
		/*
		http.authorizeRequests()
		.anyRequest()
		.authenticated()
		.and()
		.formLogin()
		.loginPage("/showMyLoginPage")
		.loginProcessingUrl("/autenticateTheUser")
		.permitAll()
		.and()
		.logout()
		.permitAll();
		*/
	}
	
	
}
