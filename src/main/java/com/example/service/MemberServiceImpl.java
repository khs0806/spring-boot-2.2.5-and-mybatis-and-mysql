package com.example.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.MemberDao;
import com.example.model.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public Map<String, Object> checkLoginIdDup(String loginId){
		int count = memberDao.getLoginIdDupCount(loginId);
		
		String resultCode = "";
		String msg = "";
		
		if (count == 0) {
			resultCode = "S-1";
			msg = "사용가능한 ID 입니다.";
		}
		else {
			resultCode = "F-1";
			msg = "이미 사용중인 ID 입니다.";
		}
		
		Map<String, Object> rs = new HashMap<String, Object>();
		rs.put("resultCode", resultCode);
		rs.put("msg", msg);
		rs.put("count", count);
		
		return rs;
	}

	@Override
	public Map<String, Object> join(Map<String, Object> param) {
		memberDao.join(param);

		System.out.println(param.toString());
//		long newId = CUtil.getAsLong(param.get("id"));
		long newId = 1;
		String resultCode = "";
		String msg = "";

		if ( newId == 0 ) {
			resultCode = "F-1";
			msg = "회원가입에 실패했습니다.";
		}
		else {
			resultCode = "S-1";
			msg = "회원가입 되었습니다.";
		}

		Map<String, Object> rs = new HashMap<String, Object>();
		rs.put("resultCode", resultCode);
		rs.put("msg", msg);
		rs.put("newId", newId);

		return rs;
	}

	@Override
	public MemberVO getMatchedOne(String loginId, String loginPw) {
		
		return memberDao.getMatchedOne(loginId, loginPw);
	}
	
	@Override
	public MemberVO getOne(String loginedMemberId) {
		
		return memberDao.getOne(loginedMemberId);
	}
}
