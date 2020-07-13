package com.example.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.MemberVO;

@Mapper
public interface MemberDao {
	// ID 중복가입 체크
	public int getLoginIdDupCount(String loginId);
	// 회원가입
	public int join(Map<String, Object> param);
	// 로그인
	public MemberVO getMatchedOne(String loginId, String loginPw);
	// 회원정보 가져오기
	public MemberVO getOne(String loginedMemberId);

}
