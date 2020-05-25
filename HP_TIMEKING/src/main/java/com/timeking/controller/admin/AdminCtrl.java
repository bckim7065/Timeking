package com.timeking.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeking.service.admin.AdminSvc;

/**
 * <pre>
 * [어드민페이지 Controller]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-19 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Controller
public class AdminCtrl {
	@Autowired
	private AdminSvc adminSvc;
	
	/**
	 * <pre>
	 * [서비스신청리스트 View]     
	 * </pre>  
	 * 
	 * @return common/login
	 */
	@RequestMapping("/admin/getSvcReqList")
	@ResponseBody
	public Map<String, Object> getSvcReqList(
				@RequestParam("condText") String asCondText,
				@RequestParam("start") int aiStart,
				@RequestParam("length") int aiLength,
				@RequestParam("draw") String asDraw
			) throws Exception {
		return adminSvc.getSvcReqList(asCondText, aiStart, aiLength, asDraw);
	}	

}