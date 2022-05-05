package com.timeking.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.timeking.controller.security.HttpBasicFailureHdl;
import com.timeking.controller.security.LoginFailureHdl;
import com.timeking.controller.security.LoginSuccessHdl;
import com.timeking.controller.security.LogoutSuccessHdl;
import com.timeking.service.security.ConnectionAuthenticationProvider;


/**
 * <pre>
 * [Security 설정]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-14 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {  
	@Autowired private ConnectionAuthenticationProvider connectionAuthenticationProvider;
	@Autowired private LoginSuccessHdl loginSuccessHdl;
	@Autowired private LoginFailureHdl loginFailureHdl;
	@Autowired private LogoutSuccessHdl logoutSuccessHdl;
	@Autowired private HttpBasicFailureHdl httpBasicFailureHdl;
	
    /**
     * <pre>
     * [Role 계층구조 설정]
     * </pre> 	
     */
    @Bean
    public RoleHierarchyImpl roleHierarchy() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("ROLE_ADMIN > ROLE_MANAGER > ROLE_USER");
        return roleHierarchy;
    }
    
    /**
     * <pre>
     * [패스워드 암호화]
     * </pre> 	
     */
    @Bean
    public PasswordEncoder getPasswordEncoder() {
    	return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }           
    
    /**
     * <pre>
     * [HttpSecurity 설정]
     * </pre> 	
     */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http				
			.csrf().disable()							
			.authorizeRequests()					
				.antMatchers("/", "/admin/login", "/service/**" , "/policy/**", "/admin/loginError/**", "/error/**").permitAll()
				.antMatchers("/admin/**").access("hasRole('ROLE_MANAGER')")	
				.and()
			.httpBasic()
				.authenticationEntryPoint(httpBasicFailureHdl)
				.and()
			.formLogin()
				.loginPage("/admin/login")
				.loginProcessingUrl("/admin/loginProcess")
				.usernameParameter("userId")
				.passwordParameter("userPwd")
				.successHandler(loginSuccessHdl)
				.failureHandler(loginFailureHdl)
				.and()
			.logout()
				.logoutUrl("/logout")				
				.invalidateHttpSession(true)
				.clearAuthentication(true)				
				.logoutSuccessHandler(logoutSuccessHdl);
	}
	
	/**
     * <pre>
     * [WebSecurity 설정]
     * </pre> 	
     */
	@Override
    public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**", "/img/**", "/js/**");
    }
	
	/**
     * <pre>
     * [AuthenticationManagerBuilder 설정]
     * </pre> 	
     */
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {		
		auth.authenticationProvider(connectionAuthenticationProvider);
			
		auth.inMemoryAuthentication()				
				.withUser("administrator")
					.password("{bcrypt}$2a$10$pn33ElwrTU7CdLbZUfvKH.i9muHI9uUi2bd5wUmxkTQYZGMSfBCxe")	
		            .authorities("ROLE_ADMIN")
		            .and()
		        .withUser("tester")
		        	.password("{bcrypt}$2a$10$pn33ElwrTU7CdLbZUfvKH.i9muHI9uUi2bd5wUmxkTQYZGMSfBCxe")		            		            
		            .authorities("ROLE_ADMIN");    
    }
}