package com.timeking.repository.security;

import org.apache.ibatis.annotations.Mapper;

import com.timeking.annotation.DBBase;
import com.timeking.model.security.ConnectionUserMd;

/**
 * <pre>
 * [사용자 Mapper]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-15 / 김병철 / - / 최초작성   
 * </pre> 	
 */
@Mapper
@DBBase
public interface ConnectionMp {	
	/**
	 * <pre>
	 * [사용자 정보 Select]     
	 * </pre> 
	 * 
	 * @param username 사용자 ID
	 * 
	 * @return 사용자 정보  
	 */
    ConnectionUserMd getUserInfo(String username);    
}
