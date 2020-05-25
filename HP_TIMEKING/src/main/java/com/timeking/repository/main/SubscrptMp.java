package com.timeking.repository.main;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.timeking.annotation.DBBase;

/**
 * <pre>
 * [서비스신청  Mapper]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-16 / 김병철 / - / 최초작성     
 * </pre> 	
 */
@Mapper
@DBBase
public interface SubscrptMp {
	/**
	 * <pre>
	 * [서비스신청 Insert]     
	 * </pre> 	
	 * 
	 * @param subScrtInfo 서비스신청 정보
	 */
	void setSubScrt(Map<String, Object> subScrtInfo);
}