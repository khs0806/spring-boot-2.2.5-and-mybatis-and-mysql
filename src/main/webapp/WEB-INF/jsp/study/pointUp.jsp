<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageName" value="회원 활동점수" />
<%@ include file="../part/head.jspf"%>

<section class="con">
	ID : ${member.id}<br> 
	현재점수 : ${point}<br> 
</section>

<form action="/study/pointup" class="con common-form" method="POST">
	<input type="hidden" id="id" name="id" value="${member.id}" /> 
	<input type="hidden" id="sno" name="sno" value="${sno}" /> 
	<select name="score">
		<option value="5">+5</option>
		<option value="7">+7</option>
		<option value="10">+10</option>
	</select> 
	<select name="reason">
		<option value="스터디에 이러쿵 기여">스터디에 이러쿵 기여</option>
		<option value="스터디에 저러쿵 기여">스터디에 저러쿵 기여</option>
		<option value="스터디에 아무튼 기여">스터디에 아무튼 기여</option>
	</select> 
	<input type="submit" value="점수주기" class="btn btn-primary button" /> 
</form>
<br/><br/>
<section class="con">
	<span>==활동점수 내역==</span><br/><br/>
	<c:forEach items="${pointList}" var="list">
		<p>점수 사유 : ${list.reason}</p>
		<p>받은 점수 : ${list.score}</p>
		<span>등록 날짜 : ${list.gdate}</span><br><br>
	</c:forEach>
</section>

<%@ include file="../part/foot.jspf"%>
