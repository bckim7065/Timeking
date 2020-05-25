package com.timeking.service.util;

import org.springframework.stereotype.Component;

/**
 * <pre>
 * [String 처리지원]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-15 / 김병철 / - / 최초작성     
 * </pre> 	
 * 
 * @version 1.0
 */
@Component
public class UtilString {
	/**
	 * <pre>
	 * [Null, Blank 동시 검증]    
	 * </pre>
	 * 
	 * @param asStr 대상 문자열
	 * 
	 * @return true, false	
	 */
	public static boolean isBlank(String asStr) {
		boolean bChkBlank = false;
		
		if (asStr.equals("")) {
			bChkBlank = true;
		} else {
			bChkBlank = false;
		}
		
		return asStr == null || bChkBlank ? true : false;  
	}
	
	/**
	 * <pre>
	 * [대상 문자열이 Null, Blank인 경우 기본 문자열을 반환하고 아니면 Blank 문자열 반환]    
	 * </pre>
	 * 
	 * @param asStr 대상 문자열
	 * @param asDftStr 기본 문자열
	 * 
	 * @return true, false	
	 */
	public static String nvl(String asStr) {
		return isBlank(asStr) ? "" : asStr;  
	}
	
	/**
	 * <pre>
	 * [대상 문자열이 Null, Blank인 경우 기본 문자열을 반환하고 아니면 대상 문자열을 그대로 반환]    
	 * </pre>
	 * 
	 * @param asStr 대상 문자열
	 * @param asDftStr 기본 문자열
	 * 
	 * @return true, false	
	 */
	public static String nvl(String asStr, String asDftStr) {
		return isBlank(asStr) ? asDftStr : asStr;  
	}
	
	/**
	 * <pre>
	 * [Oracle DB 에러 문자열 중 개발자정의 메시지 추출]     
	 * </pre> 
	 * 
	 * @param asErrMsg DB 에러 메시지 
	 * 	 
	 * @return 메시지
	 */
	public static String getOracleMsg(String asErrMsg) {
		String sRtnMsg = "";
		
		if (asErrMsg.indexOf("ORA-20009") > -1) {
			int nStIdx = asErrMsg.indexOf("ORA-20009") + "ORA-20009".length() + 2;
			int nEdIdx = asErrMsg.indexOf("ORA-", nStIdx) < 0 ? asErrMsg.length() : asErrMsg.indexOf("ORA-", nStIdx);								
			
			sRtnMsg = asErrMsg.substring(nStIdx, nEdIdx).trim();		
		}		 
		
		return sRtnMsg; 
	}
}