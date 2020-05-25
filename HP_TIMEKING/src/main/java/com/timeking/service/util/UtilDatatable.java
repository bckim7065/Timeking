package com.timeking.service.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

/**
 * <pre>
 * [JQuery Plugin Datatables 처리지원]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-15 / 김병철 / - / 최초작성
 * </pre>
 * 
 * @version 1.0	
 */
@Component
@Slf4j
public class UtilDatatable {	
	/**
	 * <pre>
	 * [데이터 포맷 적용]
	 * 
	 * 포맷 적용할 대상 List에 SORT_NO, TOT_CN, FILTERED_CN은 반드시 포함되어야 함. 
	 * </pre>
	 * 
	 * @param alDat 포맷 적용할 대상 List<Map>
	 * @param asDraw Datatables Draw Value
	 * 
	 * @return 포맷 적용 데이터
	 * 
	 * @throws Exception
	 */
	public Map<String, Object> convertData(List<Map<String, Object>> alDat, String asDraw) throws Exception {		
		try {
			HashMap<String, Object> cvtDat = new HashMap<>();
			
			long nRecordsTotal = 0;		
			long nRecordFiltered = 0;
			if (alDat.size() > 0) {
				nRecordsTotal = (long) alDat.get(0).get("TOT_CN");
				nRecordFiltered = (long) alDat.get(0).get("FILTERED_CN");
			}
			
			cvtDat.put("draw", asDraw);
			cvtDat.put("recordsTotal", nRecordsTotal);
			cvtDat.put("recordsFiltered", nRecordFiltered);
			cvtDat.put("data", alDat);
	
			return cvtDat;
		} catch(Exception e) {
			log.error("UtilDatatable.convertData Error : " + e.getMessage());
			throw e;
		}
	}		
}