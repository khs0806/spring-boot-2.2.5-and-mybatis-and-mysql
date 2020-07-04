package com.example.controller;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.MemberVO;
import com.example.model.ReplyVO;
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
	
	// (구)로그인 기능
//	@RequestMapping("/member/doLogin")
//	public String doLogin(@RequestParam Map<String, Object> param, Model model, HttpSession session) {
//		//로그인 아이디 비밀번호가 일치하는지 체크
//		MemberVO matchedMember = memberService.getMatchedOne((String) param.get("loginId"),
//				(String) param.get("loginPw"));
//		
//		if (matchedMember == null) {
//			model.addAttribute("alertMsg", "아이디나 비밀번호를 다시 확인해주세요들송!");
//			model.addAttribute("historyBack", true);
//			return "common/redirect";
//		}
//		session.setAttribute("loginedMemberId", matchedMember.getId());
//		
//		model.addAttribute("alertMsg", "로그인 되었습니다.");
//		model.addAttribute("redirectUrl", "/");
//		
//		return "common/redirect";
//	}
	
	// 로그인 기능, ajax방식으로 소통하여 아이디 비밀번호 틀리면 문자열 전달
	@ResponseBody
	@RequestMapping(value="/member/doLogin", method=RequestMethod.POST)
	public ResponseEntity<String> doTestLogin(@RequestBody Map<String, Object> param, Model model, HttpSession session) {
		//로그인 아이디 비밀번호가 일치하는지 체크
		ResponseEntity<String> entity = null;
		System.out.println((String) param.get("loginId") + "=========================== " + (String) param.get("loginPw"));
		MemberVO matchedMember = memberService.getMatchedOne((String) param.get("loginId"),
				(String) param.get("loginPw"));
		
		if (matchedMember == null) {
			try {
				entity = new ResponseEntity<>("아이디나 비밀번호를 틀렸습니다.",HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		session.setAttribute("loginedMemberId", matchedMember.getId());
		try {
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping("/member/join")
	public String showJoin() {
		
		return "member/join";
	}
	
	@RequestMapping("/member/doJoin")
	public String doJoin(@RequestParam Map<String,Object> param, Model model) {
		System.out.println("param"+param.toString());
//		Map<String,Object> checkLoginIdDupRs = memberService.checkLoginIdDup((String)param.get("id"));
		
		// 로그인 ID의 중복성 체크
//		if (((String)checkLoginIdDupRs.get("resultCode")).startsWith("F-")) {
//			model.addAttribute("alertMsg", checkLoginIdDupRs.get("msg"));
//			model.addAttribute("historyBack", true);
//			return "common/redirect";
//		}
		
		Map<String, Object> joinRs = memberService.join(param);
		
		// 회원가입이 정상적으로 됬는지 체크
		if ( ((String)joinRs.get("resultCode")).startsWith("F-") ) {
			model.addAttribute("alertMsg", joinRs.get("msg"));
			model.addAttribute("historyBack", true);
			
			return "common/redirect";
		}
		model.addAttribute("alertMsg", joinRs.get("msg"));
		model.addAttribute("redirectUrl", "/");
		
		return "common/redirect";
	}
	
	@RequestMapping(value="/member/idChk")
	public String idChk(String id, Model model) {
		Map<String,Object> checkLoginIdDupRs = memberService.checkLoginIdDup(id);
		
		// 로그인 ID의 중복성 체크
		int count = (int) checkLoginIdDupRs.get("count");
		model.addAttribute("count", count);
		model.addAttribute("id", id);
		
		return "member/idChk";
	}
}

