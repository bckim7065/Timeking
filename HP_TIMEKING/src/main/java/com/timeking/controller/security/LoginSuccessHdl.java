package com.timeking.controller.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import com.timeking.service.util.UtilString;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginSuccessHdl implements AuthenticationSuccessHandler {
	private RequestCache reqCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) 
			throws IOException, ServletException {						
		clearAuthenticationAttributes(request);

		loginSuccessRedirect(request, response, authentication);		
	}
	
	/**
	 * <pre>
	 * [로그인 세션 에러속성 삭제]
	 * </pre>
	 * 
	 * @param request
	 */
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        if(session != null) {
        	session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        }        
    }
	
	/**
	 * <pre>
	 * [로그인 성공 후 화면 이동]
	 * </pre>
	 * 
	 * @param request
	 */
	protected void loginSuccessRedirect(HttpServletRequest request, HttpServletResponse response, Authentication authentication) 
			throws IOException, ServletException {
		/* 나중에 메뉴가 많아지는경우 추가 로직 
		String sTargetUrl = "";
		
		SavedRequest savedRequest = reqCache.getRequest(request, response);        
		
		if(savedRequest != null) {
			sTargetUrl = savedRequest.getRedirectUrl();
	        log.debug("[LoginSuccessHdl.loginSuccessRedirect] sTargetUrl : " + sTargetUrl);
	        
	        if(!UtilString.isBlank(sTargetUrl)) {
	        	HttpSession session = request.getSession(false);
	        	session.setAttribute("urlAfterLogin", sTargetUrl);
	        }
		}        
        
        redirectStrategy.sendRedirect(request, response, "/admin/loginSuccess");
	 	*/   
        
        redirectStrategy.sendRedirect(request, response, "/admin/loginSuccess");
    }
}