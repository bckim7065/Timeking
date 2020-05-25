package com.timeking.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.timeking.aop.AutoDIInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired private AutoDIInterceptor autoDIInterceptor;
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations(new String[] {"classpath:/static/"});
    }	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(autoDIInterceptor)
			.excludePathPatterns("/admin/login")
			.addPathPatterns("/admin/**");
	}	
}