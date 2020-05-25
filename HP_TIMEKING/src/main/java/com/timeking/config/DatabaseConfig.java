package com.timeking.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import com.timeking.annotation.DBBase;
import com.timeking.annotation.DBCI;
import com.zaxxer.hikari.HikariDataSource;

/**
 * <pre>
 * [데이터베이스 공통 설정]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-15 / 김병철 / - / 최초작성
 * </pre> 	
 */
public abstract class DatabaseConfig {
	public static final String BASE_PACKAGE = "com.timeking.repository";
	public static final String TYPE_ALIASES_PACKAGE = "com.timeking.model";
	public static final String MAPPER_LOCATIONS_PATH = "classpath*:**/repository/**/*.xml";
	public static final String CONFIG_PATH = "classpath:mybatis-config.xml";
	
	protected void configureSqlSessionFactory(SqlSessionFactoryBean sessionFactoryBean, ApplicationContext applicationContext, DataSource dataSource) throws IOException {		
		sessionFactoryBean.setDataSource(dataSource);		
		sessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();		
		sessionFactoryBean.setMapperLocations(resolver.getResources(MAPPER_LOCATIONS_PATH));
		sessionFactoryBean.setConfigLocation(applicationContext.getResource(CONFIG_PATH));		
	}
}

/**
 * <pre>
 * [데이터베이스 DBBase 설정]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-15 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Configuration
@MapperScan(basePackages=DatabaseConfig.BASE_PACKAGE, annotationClass=DBBase.class, sqlSessionFactoryRef="sqlSessionFactoryDBBase")
class DbBaseDatabaseConfig extends DatabaseConfig {	
	@Bean(name="dataSourceDBBase", destroyMethod="close")
	@Primary
	@ConfigurationProperties(prefix="spring.datasource.hikari.base")
	public DataSource dataSourceDBBase() {
		return DataSourceBuilder.create().type(HikariDataSource.class).build();	    
	}
	
	@Bean(name="sqlSessionFactoryDBBase")
	@Primary
	public SqlSessionFactory sqlSessionFactoryDBBase(@Qualifier("dataSourceDBBase") DataSource dataSourceDBBase, ApplicationContext applicationContext) throws Exception {		
		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();		
		configureSqlSessionFactory(sessionFactoryBean, applicationContext, dataSourceDBBase);
	    return sessionFactoryBean.getObject();
	} 	
	
	@Bean(name="sqlSessionTemplateDBBase") 
	@Primary 
	public SqlSessionTemplate sqlSessionTemplateDBBase(SqlSessionFactory sqlSessionFactoryDBBase) throws Exception { 
		return new SqlSessionTemplate(sqlSessionFactoryDBBase); 
	} 
}

/**
 * <pre>
 * [데이터베이스 DBCI 설정]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-15 / 김병철 / - / 최초작성
 * </pre> 	
 */
@Configuration
@MapperScan(basePackages=DatabaseConfig.BASE_PACKAGE, annotationClass=DBCI.class, sqlSessionFactoryRef="sqlSessionFactoryDBCI")
class DbCIDatabaseConfig extends DatabaseConfig {	
	@Bean(name="dataSourceDBCI", destroyMethod="close")	
	@ConfigurationProperties(prefix="spring.datasource.hikari.ci")
	public DataSource dataSourceDBCI() {
		return DataSourceBuilder.create().type(HikariDataSource.class).build();	    
	}
	
	@Bean(name="sqlSessionFactoryDBCI")	
	public SqlSessionFactory sqlSessionFactoryDBCI(@Qualifier("dataSourceDBCI") DataSource dataSourceDBCI, ApplicationContext applicationContext) throws Exception {		
		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();		
		configureSqlSessionFactory(sessionFactoryBean, applicationContext, dataSourceDBCI);
	    return sessionFactoryBean.getObject();
	} 	
	
	@Bean(name="sqlSessionTemplateDBCI") 	
	public SqlSessionTemplate sqlSessionTemplateDBCI(SqlSessionFactory sqlSessionFactoryDBCI) throws Exception { 
		return new SqlSessionTemplate(sqlSessionFactoryDBCI); 
	} 
}