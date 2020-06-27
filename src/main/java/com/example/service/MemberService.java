package com.example.service;

import java.util.Map;

import com.example.model.MemberVO;

public interface MemberService {

	public Map<String, Object> checkLoginIdDup(String loginId);

	public Map<String, Object> join(Map<String, Object> param);

	public MemberVO getMatchedOne(String loginId, String loginPw);

	public MemberVO getOne(String loginedMemberId);

	
}
