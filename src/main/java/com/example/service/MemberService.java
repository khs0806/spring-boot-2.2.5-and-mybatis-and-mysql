package com.example.service;

import java.util.Map;

public interface MemberService {

	public Map<String, Object> checkLoginIdDup(String loginId);
	
}
