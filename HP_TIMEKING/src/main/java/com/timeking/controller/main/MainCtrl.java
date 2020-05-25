package com.timeking.controller.main;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeking.service.main.SubscrptSvc;

/**
 * <pre>
 * [메인 Controller]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-12 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Controller
public class MainCtrl {
	@Autowired
	private SubscrptSvc subScrptSvc;
	
	/**
	 * <pre>
	 * [메인 View]     
	 * </pre>  
	 * 
	 * @return common/main
	 */
	
	@RequestMapping("/")
	public String main(Model aModel) {
		return "main/main";  
	}	
	
	
	/**
	 * <pre>
	 * [서비스신청 팝업]     
	 * </pre>  
	 * 
	 * @return main/subScribe
	 */
	@RequestMapping("/service/subScribe")
	public String subScribe(Model aModel) {
		return "service/subScribe";  
	}
	
	/**
	 * <pre>
	 * [서비스신청완료 View]     
	 * </pre>  
	 * 
	 * @return main/subScrptSuccess
	 */
	@RequestMapping("/service/subScrptSuccess")
	public String subScrptSuccess(Model aModel) {
		return "service/subScrptSuccess";  
	}
	
	
	/**
	 * <pre>
	 * [서비스신청 Insert]     
	 * </pre>  
	 * 
	 * @return 결과
	 */
	@RequestMapping("/service/setSubScrt")
	@ResponseBody
	public Map<String, Object> setSubScrt(@RequestParam Map<String, Object> amSubScrtInfo) throws Exception {
		return subScrptSvc.setSubScrt(amSubScrtInfo);  
	}	
	
	
	/**
	 * <pre>
	 * [개인정보취급방침 View]     
	 * </pre>  
	 * 
	 * @return policy/policy
	 */
	@RequestMapping("/policy/policy")
	public String policy(Model aModel) {
		return "policy/policy";  
	}
	
	/**
	 * <pre>
	 * [이용약관 View]     
	 * </pre>  
	 * 
	 * @return policy/terms
	 */
	@RequestMapping("/policy/terms")
	public String terms(Model aModel) {
		return "policy/terms";  
	}
}