<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.example.model.Article"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ��Ʈ �Խ���</title>
</head>
<body>
	<h1>�Խù� ����Ʈ</h1>
	<c:forEach items="${list}" var="article">
		<section>
			��ȣ : ${article.getId()},
			���� : ${article.title}
		</section>
		<hr>
	</c:forEach>
</body>
</html>