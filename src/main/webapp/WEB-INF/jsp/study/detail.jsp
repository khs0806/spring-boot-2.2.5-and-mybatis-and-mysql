<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageName" value="게시물 상세페이지" />
<%@ include file="../part/head.jspf"%>

<section class="con">
	번호 : ${study.sno}<br> 
	제목 : ${study.sname}<br> 
	내용 : ${study.content}<br>
	스터디장 : ${study.mname}<br> 
	시작날짜 : ${study.totime}<br> 
	종료날짜 : ${study.fromtime}<br> 
	스터디 시간 : ${study.sdate}<br> 
</section>

<div class="btns con">
	<a href="./list">게시물리스트</a> <a href="./add">게시물 추가</a> <a
		href="./modify?sno=${study.sno}">게시물 수정</a> <a
		onclick="if (confirm('삭제 하시겠습니까?') == false) return false;"
		href="./doDelete?sno=${study.sno}">게시물 삭제</a>
</div>

<%@ include file="../part/foot.jspf"%>
