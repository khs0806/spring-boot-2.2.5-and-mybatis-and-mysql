<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="pageName" value="나의 포인트 현황" />
<%@ include file="../part/head.jspf"%>

<h3>${pageName}</h3>
<section class="con">
	<p>== 내가 가입한 스터디 정보==</p>
	<p>스터디 이름 : ${study.sname}</p>
	</span><br><br>
</section>
<section class="con">
	<span>==활동점수 내역==</span><br/><br/>
	<c:forEach items="${point}" var="list">
		<p>점수 사유 : ${list.reason}</p>
		<p>받은 점수 : ${list.score}</p>
		<span>등록 날짜 : ${list.gdate}</span><br><br>
	</c:forEach>
</section>
<br/><br/>

<%@ include file="../part/foot.jspf"%>
