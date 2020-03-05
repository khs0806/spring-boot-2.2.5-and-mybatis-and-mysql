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
<title>������ ��Ʈ �Խ���</title>
</head>
<body>
	<h1>�Խù� ����Ʈ</h1>
	
	<h2>v1 �ڹٹ���</h2>
	<%
		for (int i = 0; i < list.size(); i++) {
	%>
	<%
		Article article = list.get(i);
	%>
	<section>
		��ȣ :
		<%=article.getId()%>, ���� :
		<%=article.getTitle()%>
	</section>
	<hr>
	<%
		}
	%>
	
	<h2>v2 EL,JSTL �̿�</h2>
	<c:forEach items="${list}" var="article">
		<section>
			��ȣ : ${article.getId()},
			���� : ${article.title}
		</section>
		<hr>
	</c:forEach>
</body>
</html>