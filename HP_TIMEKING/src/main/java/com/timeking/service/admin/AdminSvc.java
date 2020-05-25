package com.timeking.service.admin;

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
}