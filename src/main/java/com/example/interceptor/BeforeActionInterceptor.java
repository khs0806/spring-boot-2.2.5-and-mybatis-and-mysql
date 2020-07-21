package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.example.controller.MemberController;
import com.example.model.MemberVO;
import com.example.service.MemberService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component("beforeActionInterceptor") // 컴포넌트 이름 설정
public class BeforeActionInterceptor implements HandlerInterceptor {
	protected static Log log = LogFactory.getLog(BeforeActionInterceptor.class);

	@Autowired
	MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info(" Request URI :" + request.getRequestURI());
		
		boolean isLogined = false;
		String loginedMemberId = null;
		MemberVO loginedMember = null;
		
		HttpSession session = request.getSession();
		if ( session.getAttribute("loginedMemberId") != null ) {
			isLogined = true;
			loginedMemberId = (String) session.getAttribute("loginedMemberId");
			loginedMember = memberService.getOne(loginedMemberId);
		}
		
		request.setAttribute("isLogined", isLogined);
		request.setAttribute("loginedMemberId", loginedMemberId);
		request.setAttribute("loginedMember", loginedMember);
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
