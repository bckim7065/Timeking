package com.timeking.service.security;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ConnectionSvc {	
	public Map<String, Object> loginSuccess(String asUrlAfterLogin) {		
    	HashMap<String, Object> mRtnDat = new HashMap<>();
    	
    	mRtnDat.put("rstCd", 200);
    	mRtnDat.put("url", asUrlAfterLogin);
    	
    	return mRtnDat;
    }
	
	public Map<String, Object> loginError(String sErrorType) {
		String sErrMsg = "로그인에 실패했습니다.";
		
		if ("duplication".equals(sErrorType)) {
			sErrMsg = "해당 계정은 이미 로그인되어있습니다.";
		}
		
    	HashMap<String, Object> mRtnDat = new HashMap<>();
    	
    	mRtnDat.put("rstCd", 400);
    	mRtnDat.put("errMsg", sErrMsg);
    	
    	return mRtnDat;
    }		
	
	public Map<String, Object> logoutSuccess() {
    	HashMap<String, Object> mRtnDat = new HashMap<>();
    	
    	mRtnDat.put("rstCd", 200);
    	
    	return mRtnDat;
    }		
}