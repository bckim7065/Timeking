package com.timeking.service.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.timeking.model.security.ConnectionUserMd;
import com.timeking.repository.security.ConnectionMp;
import com.timeking.service.util.UtilString;
 
@Service
public class ConnectionUserDetailsService implements UserDetailsService {
	@Autowired private ConnectionMp connectionMp;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {	
		ConnectionUserMd connectionUserMd = connectionMp.getUserInfo(username);
				
		if(connectionUserMd == null || UtilString.isBlank(connectionUserMd.getUsername())) {
			throw new UsernameNotFoundException(username);
		}		
		
		return connectionUserMd;
	}	
}