package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.service.MemberService;

@Component("needToLogoutInterceptor")
public class NeedToLogoutInterceptor implements HandlerInterceptor {
	protected static Log log = LogFactory.getLog(BeforeActionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("로그아웃상태여야접근가능");
		// 이 인터셉터 실행 전에 beforeActionInterceptor 가 실행되고 거기서 isLogined 라는 속성 생성
		// 그래서 여기서 단순히 request.getAttribute("isLogined"); 이것만으로 로그인 여부 알 수 있음
		boolean isLogined = (boolean) request.getAttribute("isLogined");

		if (isLogined) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().append("<script>");
			response.getWriter().append("history.back();");
			response.getWriter().append("</script>");
			return false;
		}

		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
} 