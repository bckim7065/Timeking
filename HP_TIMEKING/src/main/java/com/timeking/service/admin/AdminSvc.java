package com.timeking.service.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.timeking.repository.admin.AdminMp;
import com.timeking.service.util.UtilDatatable;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class AdminSvc {
	@Autowired
	private AdminMp adminMp;
	@Autowired
	private UtilDatatable utilDatatable;
	
	public Map<String, Object> getSvcReqList(String asCondText, int aiSortNoStart, int aiSortNoLength, String asDraw) throws Exception {
		 Map<String, Object> mCvtDat = null;
		 
		 try {
			 mCvtDat = utilDatatable.convertData(adminMp.getSvcReqList(asCondText, aiSortNoStart, aiSortNoLength), asDraw);
		 } catch(Exception e) {
			 log.error("AdminSvc.getSvcReqList() Error : " + e.getMessage());
			 throw e;
		 }
		 
		 return mCvtDat;
	}

	public Map<String, Object> deleteReq(int RS_SEQ) {
		Map<String, Object> result = new HashMap<String, Object>();
		 
		try {
			 int dbResult = adminMp.deleteReq(RS_SEQ);
			 
			 result.put("rstCd", "200");
			 result.put("msg", "success");
		} catch(Exception e) {
			 result.put("rstCd", "500");
			 result.put("msg", "delete req fail");
			 e.printStackTrace();
		}
		 
		 return result;
	}

	public Map<String, Object> updateReq(Map<String, Object> params) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			 int dbResult = adminMp.updateReq(params);
			 
			 result.put("rstCd", "200");
			 result.put("msg", "success");
		} catch(Exception e) {
			 result.put("rstCd", "500");
			 result.put("msg", "updateReq req fail");
			 e.printStackTrace();
		}
		
		return result;
	}
}