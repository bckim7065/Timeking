package com.timeking.exception;

import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UrlPathHelper;

import lombok.extern.slf4j.Slf4j;

/**
 * <pre>
 * [에러페이지 Controller]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-16 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Controller
@Slf4j
public class ExceptionCtrl implements ErrorController {		
    private static final String PATH = "/error";

    @RequestMapping(value = PATH + "/401")
    public String error_401(HttpServletRequest request, Model model) {
        return "error/401";
    }
    
    @RequestMapping(value = PATH + "/403")
    public String error_403(HttpServletRequest request, Model model) {
        return "error/403";
    }
    
    @RequestMapping(value = PATH + "/404")
    public String error_404(HttpServletRequest request, Model model) {
        return "error/404";
    }
    
    @RequestMapping(value = PATH + "/500")
    public ModelAndView error_500(HttpServletRequest request, ModelAndView mav) {    	    	
    	Exception exception = (Exception)request.getAttribute("javax.servlet.error.exception");
    	
    	mav.setViewName("error/serverUndefined");
		mav.addObject("exception", exception); 		
		
		return mav;    	        
    }    

    @Override
    public String getErrorPath() {
        return PATH;
    }
}