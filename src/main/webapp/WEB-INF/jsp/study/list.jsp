<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageName" value="게시물 리스트" />
<%@ include file="../part/head.jspf"%>

<h3 class="con">전체 게시물 수 : ${totalCount}</h3>

<div class="btns con">
	<a href="./add">스터디 등록</a>
	<a href="/">홈으로</a>
</div>

<div class="con">
	<c:forEach items="${list}" var="study">
		<section>
			스터디장 : ${study.id}<br>
			<a href="./detail?sno=${study.sno}">
			스터디 이름 : ${study.sname}</a>
			스터디 장소 : ${study.location}
			스터디 시간 : ${study.sdate}
		</section>
		<hr>
	</c:forEach>
</div>

<%@ include file="../part/foot.jspf"%>
