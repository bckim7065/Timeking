package com.timeking.model.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
 
/**
 * <pre>
 * [사용자 Model]
 * 
 * 관리책임 : 김병철
 * 변경이력 (작성일자 / 작성자 / 요청자 / 내용) : 
 *     1. 2020-03-14 / 김병철 / - / 최초작성     
 * </pre> 	
 */
@Data
public class ConnectionUserMd implements UserDetails {		
	private static final long serialVersionUID = 4998177012957090751L;
	
	private String username;  // ID	
	private String password;  // PASSWORD	
	private boolean enabled;  // 계정활성화여부	
	private Collection<? extends GrantedAuthority> authorities;  // 권한
		
	private String fullname;  // 성명
	private String authority;  // 권한	
	
	/**
	 * <pre>
	 * [계정만료여부 반환]
	 * </pre>
	 */
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	/**
	 * <pre>
	 * [패스워드만료여부 반환]
	 * </pre>
	 */
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	/**
	 * <pre>
	 * [계정잠김여부 반환]
	 * </pre>
	 */
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	public void setAuthority(String sAuthority) {
		this.authorities = AuthorityUtils.createAuthorityList(sAuthority);		
	}
}