package com.timeking.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.timeking.model.security.ConnectionUserMd;

import lombok.extern.slf4j.Slf4j;

/**
 * <pre>
 * [View 공통객체 주입 Interceptor]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-23 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Component
@Slf4j
public class AutoDIInterceptor extends HandlerInterceptorAdapter {
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		try { 
			if (modelAndView != null) {
				// connectionUserMd 				
				if (!modelAndView.getModel().containsKey("connectionUserMd")) {								
					if (SecurityContextHolder.getContext().getAuthentication() != null 
							&& !"anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getName())) {					
						UserDetails uds = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
						
						ConnectionUserMd connectionUserMd = null;
						
						if (uds instanceof ConnectionUserMd) {
							connectionUserMd = (ConnectionUserMd)uds;		
						} else {
							connectionUserMd = new ConnectionUserMd();
							connectionUserMd.setUsername(uds.getUsername());
							connectionUserMd.setPassword(uds.getPassword());
							connectionUserMd.setAuthorities(uds.getAuthorities());
							connectionUserMd.setEnabled(uds.isEnabled());
							connectionUserMd.setFullname(uds.getUsername().toUpperCase());	
						}
						
						modelAndView.getModel().put("connectionUserMd", connectionUserMd);					
					}								
				} 	
			} 
		} catch(Exception e) {
			log.error("[AutoDIInterceptor.postHandle Error] : " + e.getMessage());
			throw e;
		}
	}	
}