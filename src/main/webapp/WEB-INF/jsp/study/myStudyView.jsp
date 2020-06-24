<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="pageName" value="나의 스터디 현황" />
<%@ include file="../part/head.jspf"%>

<h3>${pageName}</h3>
<section class="con">
	<p>ID : ${loginedMemberId}</p><br> 
	<p>== 내가 가입한 스터디 ==</p>
	<c:forEach items="${myList}" var="list">
		<p>스터디 이름 : <a href="./mypoint?sno=${list.SNO}">${list.SNAME}</a></p>
		<span>가입한 날짜 : 
			<fmt:formatDate value="${list.GDATE}" pattern="yyyy.MM.dd"/>
		</span><br><br>
	</c:forEach>
</section>

<br/><br/>

<%@ include file="../part/foot.jspf"%>
