package com.example.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

		return "home/main";
	}

}
