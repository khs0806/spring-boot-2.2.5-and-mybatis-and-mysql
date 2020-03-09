package com.example.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/member/join")
	public String showJoin() {
		
		return "member/join";
	}
	@RequestMapping("/member/doJoin")
	@ResponseBody
	public Map<String,Object> doJoin(@RequestParam Map<String,Object> param) {
		// 로그인 ID의 중복성 체크
		Map<String,Object> checkLoginIdDupRs = memberService.checkLoginIdDup((String)param.get("loginId"));
		
		return checkLoginIdDupRs;
	}
}

