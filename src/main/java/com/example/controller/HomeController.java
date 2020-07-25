package com.example.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.example.service.DevlogService;
import com.example.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	DevlogService devlogService;
	
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
	
	@ResponseBody
	@RequestMapping("/devlog")
	public String listTemp(@RequestParam(required = false) 
						  @DateTimeFormat(pattern = "yyyy-MM-dd") Date date) {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyMMdd");
		String datee = transFormat.format(date);
		
		String str = devlogService.devlog(datee); 
		
		return str;
	}

	@RequestMapping("/devlogview")
	public String devlogView() {
		
		return "study/devlog";
	}
}
