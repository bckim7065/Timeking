package com.timeking.service.main;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.timeking.repository.main.SubscrptMp;
import com.timeking.service.util.UtilString;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class SubscrptSvc {
	@Autowired
	private SubscrptMp subscrptMp;
	
	/**
	 * <pre>
	 * [서비스신청 Insert]     
	 * </pre> 	
	 * 
	 * @param amSubScrtInfo 서비스신청 정보
	 * 
	 * @return 결과
	 */
    public Map<String, Object> setSubScrt(Map<String, Object> amSubScrtInfo) {
    	HashMap<String, Object> mRtnDat = new HashMap<>();
    	
    	try {
    		subscrptMp.setSubScrt(amSubScrtInfo);
    	} catch(Exception e) {
    		String sUDEMsg = UtilString.getOracleMsg(e.getMessage());
    		
    		if (UtilString.isBlank(sUDEMsg)) {
    			mRtnDat.put("rstCd", 400);
    		} else {
    			mRtnDat.put("rstCd", 500);
    			mRtnDat.put("msg", sUDEMsg);
    		}   
    		
    		log.error("SubscrptMp.setSubScrt() Error : " + e.getMessage());
    	}
    	
    	if (!mRtnDat.containsKey("rstCd")) {
    		mRtnDat.put("rstCd", 200);
    	}
    	
    	return mRtnDat;   
    }   
}