<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageName" value="게시물 리스트" />
<%@ include file="../part/head.jspf"%>

<h3 class="con">전체 게시물 수 : ${totalCount}</h3>

<div class="btns con">
	<a href="./add">게시물 추가</a>
</div>

<div class="con">
	<c:forEach items="${list}" var="article">
		<section>
			번호 : ${article.id}<br>
			<a href="./detail?id=${article.id}">
			제목 : ${article.title}</a>
			조회수 : ${article.hit}
		</section>
		<hr>
	</c:forEach>
</div>

<%@ include file="../part/foot.jspf"%>
