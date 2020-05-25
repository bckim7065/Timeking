package com.timeking.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.stereotype.Component;

/**
 * <pre>
 * [DBCI Annotation]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-15 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Target({ElementType.TYPE}) 
@Retention(RetentionPolicy.RUNTIME) 
@Documented 
@Component 
public @interface DBCI { 	
}