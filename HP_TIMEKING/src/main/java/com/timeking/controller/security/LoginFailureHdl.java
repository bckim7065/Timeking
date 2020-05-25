package com.timeking.controller.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginFailureHdl implements AuthenticationFailureHandler {
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		//log.debug("[LoginFailureHdl.onAuthenticationFailure] exception : " + exception.getClass().getName() + " / " + exception.getMessage());
		
		if (exception instanceof SessionAuthenticationException) {
			redirectStrategy.sendRedirect(request, response, "/admin/loginError/duplication");
		} else {
			redirectStrategy.sendRedirect(request, response, "/admin/loginError/etc");
		}							
	}
}