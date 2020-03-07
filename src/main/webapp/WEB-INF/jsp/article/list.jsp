<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.example.model.Article"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스프링 부트 게시판</title>
</head>
<body>
	<h1>게시물 리스트</h1>
	<h3>전체 게시물 수 : ${totalCount}</h3>
	<a href="./add">게시물 추가</a>
	<c:forEach items="${list}" var="article">
		<section>
			번호 : ${article.getId()},
			제목 : ${article.title}
		</section>
		<hr>
	</c:forEach>

</body>
</html>