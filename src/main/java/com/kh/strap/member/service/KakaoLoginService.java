package com.kh.strap.member.service;

import java.util.Map;

public interface KakaoLoginService {

	public String getToken(String code);
	
	public Map<String, Object> getUserInfo(String access_token);

	public void logout(String token);
	
}
