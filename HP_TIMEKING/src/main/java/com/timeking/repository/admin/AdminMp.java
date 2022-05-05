package com.timeking.repository.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.timeking.annotation.DBBase;

@Mapper
@DBBase
public interface AdminMp {
	/**
	 * <pre>
	 * [서비스신청 목록 Select]     
	 * </pre> 
	 * 
	 * @param cond Text 검색조건
	 * @param sortNoStart 페이지 시작 Index
	 * @param sortNoLength 페이지 데이터 갯수
	 * 	 
	 * @return 서비스신청 목록
	 */
	List<Map<String, Object>> getSvcReqList(String CondText, int SortNoStart, int SortNoLength);
	Integer deleteReq(int RS_SEQ);
	Integer updateReq(Map<String, Object> params);
}