package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.model.Member;
import com.example.service.MemberService;

//인터셉터 이름
@Component("needToLoginInterceptor")
public class NeedToLoginInterceptor implements HandlerInterceptor {
	protected static Log log = LogFactory.getLog(BeforeActionInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("로그인상태여야 접근가능");
		// 이 인터셉터 실행 전에 beforeActionInterceptor 가 실행되고 거기서 isLogined 라는 속성 생성
		// 그래서 여기서 단순히 request.getAttribute("isLogined"); 이것만으로 로그인 여부 알 수 있음
		boolean isLogined = (boolean) request.getAttribute("isLogined");
		System.out.println(isLogined);
		if (isLogined == false) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().append("<script>");
			response.getWriter().append("alert('로그인 후 이용해주세요.');");
			response.getWriter().append("location.replace('/');");
			response.getWriter().append("</script>");
			// 리턴 false;를 이후에 실행될 인터셉터와 액션이 실행되지 않음
			return false;
		}

		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
} 
