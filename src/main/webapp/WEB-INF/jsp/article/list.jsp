<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.example.model.Article"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resource/common.css">
<meta charset="EUC-KR">
<title>스프링 부트 게시판</title>
</head>
<body>
	<h1 class="con">게시물 리스트</h1>
	<h3 class="con">전체 게시물 수 : ${totalCount}</h3>
	
	<div class="btns con">
	<a href="./add">게시물 추가</a>
	</div>
	
	<div class="con">
	<c:forEach items="${list}" var="article">
		<section>
				<a href="./detail?id=${article.id}">번호 : ${article.id}, 제목 : ${article.title}</a>
		</section>
		<hr>
	</c:forEach>
	</div>

</body>
</html>