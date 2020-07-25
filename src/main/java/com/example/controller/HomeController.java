package com.example.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping("/devlogview")
	public String devlogView() {
		
		return "study/devlog";
	}
	
	// Date 타입으로 넘어올때
	@ResponseBody
	@RequestMapping("/devlog")
	public String devLog(@RequestParam(required = false) 
						  @DateTimeFormat(pattern = "yyyy-MM-dd") Date date) {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyMMdd");
		String datee = transFormat.format(date);
		System.out.println("datee "+datee);
		String str = devlogService.devlog(datee);
		
		if(str == null) {
			return "파일이 없습니다.";
		}
		
		return str;
	}
	
	@RequestMapping("/devlogsearch")
	public String devLogSearch(String data, Model model) {
		
		long beforeTime = System.currentTimeMillis(); //코드 실행 전에 시간 받아오기
        
		//실험할 코드 추가
		List<Map<String, String>> devlogList = devlogService.devlogSearch(data);
		
		long afterTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기
		long secDiffTime = (afterTime - beforeTime); //두 시간에 차 계산
		System.out.println("시간차이(m) : "+secDiffTime);
		
		System.out.println(devlogList);
		System.out.println(devlogList.size());
		
		model.addAttribute("devlogList", devlogList);
		
		return "study/devlogList";
	}

	
}
