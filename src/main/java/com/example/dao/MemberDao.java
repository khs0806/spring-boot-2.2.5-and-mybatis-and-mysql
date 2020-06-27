package com.example.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.MemberVO;

@Mapper
public interface MemberDao {

	public int getLoginIdDupCount(String loginId);

	public void join(Map<String, Object> param);

	public MemberVO getMatchedOne(String loginId, String loginPw);

	 public MemberVO getOne(String loginedMemberId);

}
