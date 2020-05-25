package com.timeking.service.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.timeking.model.security.ConnectionUserMd;


/**
 * <pre>
 * [사용자 인증]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-29 / 김병철 / - / 최초작성     
 * </pre> 	
 */
@Component
public class ConnectionAuthenticationProvider implements AuthenticationProvider {
	@Autowired private PasswordEncoder passwordEncoder;
	@Autowired private ConnectionUserDetailsService connectionUserDetailsService;		

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {		
		String username = authentication.getPrincipal().toString();
		String password = authentication.getCredentials().toString();		
		
		ConnectionUserMd connectionUserMd = (ConnectionUserMd)connectionUserDetailsService.loadUserByUsername(username);								
		
		if(!connectionUserMd.isEnabled()) {
			throw new DisabledException(username);
		} else if(!passwordEncoder.matches(password, connectionUserMd.getPassword())) {
			throw new BadCredentialsException(username);
		}				 		
		
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(connectionUserMd, password, connectionUserMd.getAuthorities());
		result.setDetails(connectionUserMd);				
		
		return result;		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}