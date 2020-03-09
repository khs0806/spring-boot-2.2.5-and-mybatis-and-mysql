package com.example.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.Member;
import com.example.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j // 이걸 해야 log.info(..) 가 가능, 디버깅 용도
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/member/login")
	public String showLogin() {
		return "member/login";
	}

	@RequestMapping("/member/doLogout")
	public String doLogout(HttpSession session) {
		session.removeAttribute("loginedMemberId");

		return "redirect:/";
	}
	
	@RequestMapping("/member/doLogin")
	public String doLogin(@RequestParam Map<String, Object> param, Model model, HttpSession session) {

		Member matchedMember = memberService.getMatchedOne((String) param.get("loginId"),
				(String) param.get("loginPw"));
		
		if (matchedMember == null) {
			model.addAttribute("alertMsg", "아이디나 비밀번호를 다시 확인해주세요들송!");
			model.addAttribute("historyBack", true);
			return "common/redirect";
		}
		session.setAttribute("loginedMemberId", matchedMember.getId());
		
		model.addAttribute("alertMsg", "로그인 되었습니다.");
		model.addAttribute("redirectUrl", "/");
		
		return "common/redirect";
	}
	
	@RequestMapping("/member/join")
	public String showJoin() {
		
		return "member/join";
	}
	
	@RequestMapping("/member/doJoin")
	public String doJoin(@RequestParam Map<String,Object> param, Model model) {
		
		Map<String,Object> checkLoginIdDupRs = memberService.checkLoginIdDup((String)param.get("loginId"));
		
		// 로그인 ID의 중복성 체크
		if (((String)checkLoginIdDupRs.get("resultCode")).startsWith("F-")) {
			model.addAttribute("alertMsg", checkLoginIdDupRs.get("msg"));
			model.addAttribute("historyBack", true);
			return "common/redirect";
		}
		
		Map<String, Object> joinRs = memberService.join(param);
		
		// 회원가입이 정상적으로 됬는지 체크
		if ( ((String)joinRs.get("resultCode")).startsWith("F-") ) {
			model.addAttribute("alertMsg", joinRs.get("msg"));
			model.addAttribute("historyBack", true);
			
			return "common/redirect";
		}
		model.addAttribute("alertMsg", joinRs.get("msg"));
		model.addAttribute("redirectUrl", "/member/login");
		
		return "common/redirect";
	}
}

