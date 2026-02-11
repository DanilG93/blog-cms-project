package cubes.main.dao.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource myDataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().dataSource(myDataSource).passwordEncoder(passwordEncoder());
		;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers(
				"/",
				"/login",
				"/admin-theme/**",
				"/front-theme/**",
				"/uploads/**").permitAll()
		
				.antMatchers("/administration/**").hasAnyRole("BLOGGER", "ADMIN")
				
				.and().formLogin()
				.loginPage("/login")
	            .loginProcessingUrl("/authenticateTheUser")
	            .defaultSuccessUrl("/administration/", true)
	            .permitAll()

	            .and()
	            .logout()
	                .logoutUrl("/logout") // URL koji trigera logout
	                .logoutSuccessUrl("/") // <--- Gde te šalje posle logout-a (NA GLAVNU)
	                .invalidateHttpSession(true) // Briše sesiju
	                .deleteCookies("JSESSIONID") // Briše kolačić
	                .permitAll();
	            
		
		http.headers().cacheControl();
		
		http.cors().and().csrf().disable();

	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

}
