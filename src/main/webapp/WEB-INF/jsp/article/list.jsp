<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.example.model.Article"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	List<Article> list = (List<Article>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스프링 부트 게시판</title>
</head>
<body>
	<h1>게시물 리스트</h1>
	
	<h2>v1 자바버전</h2>
	<%
		for (int i = 0; i < list.size(); i++) {
	%>
	<%
		Article article = list.get(i);
	%>
	<section>
		번호 :
		<%=article.getId()%>, 제목 :
		<%=article.getTitle()%>
	</section>
	<hr>
	<%
		}
	%>
	
	<h2>v2 EL,JSTL 이용</h2>
	<c:forEach items="${list}" var="article">
		<section>
			번호 : ${article.getId()},
			제목 : ${article.title}
		</section>
		<hr>
	</c:forEach>
</body>
</html>