package com.timeking.controller.security;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeking.service.security.ConnectionSvc;

/**
 * <pre>
 * [사용자 Controller]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-19 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Controller
public class ConnectionCtrl {			
	@Autowired private ConnectionSvc connectionSvc;
	
	/**
	 * <pre>
	 * [로그인 View]     
	 * </pre>  
	 * 
	 * @return common/login
	 */
	@RequestMapping("/admin/login")
	public String login(HttpServletRequest aRequest, Model aModel) {
		return "common/login";  
	}	
	
	@RequestMapping("/admin/admin")
	public String admin(HttpServletRequest aRequest, Model aModel) {
		return "admin/admin";  
	}	
	
	/**
	 * <pre>
	 * [로그인 성공시 처리]     
	 * </pre>  
	 * 
	 * @return 결과
	 */
	@RequestMapping("/admin/loginSuccess")
	@ResponseBody
	public Map<String, Object> loginSuccess(HttpSession session) {	
		String sUrlAfterLogin = (String)session.getAttribute("urlAfterLogin");	
		
		return connectionSvc.loginSuccess(sUrlAfterLogin);  
	}	
	
	/**
	 * <pre>
	 * [로그인 실패시 처리]     
	 * </pre>  
	 * 
	 * @param errorType 에러타입 (duplication: 중복로그인, etc: 기타)
	 * 
	 * @return 결과
	 */
	@RequestMapping("/admin/loginError/{errorType}")
	@ResponseBody
	public Map<String, Object> loginError(@PathVariable String errorType) {	
		return connectionSvc.loginError(errorType);  
	}		
}