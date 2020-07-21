package com.example.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.example.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/")
	public String showMain2() {
		return "redirect:/home/main";
	}

	@RequestMapping("/home/main")
	public String showMain(Model model) {
		
		// 접속자 아이피 확인.
		HttpServletRequest req = 
				((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getRemoteAddr();
		System.out.println(ip);
		return "home/main";
	}
	
	@RequestMapping("/temp")
	public String listTemp() {
		return "home/temp";
	}

}
