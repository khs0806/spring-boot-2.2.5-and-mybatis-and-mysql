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
<title>������ ��Ʈ �Խ���</title>
</head>
<body>
	<h1 class="con">�Խù� ����Ʈ</h1>
	<h3 class="con">��ü �Խù� �� : ${totalCount}</h3>
	
	<div class="btns con">
	<a href="./add">�Խù� �߰�</a>
	</div>
	
	<div class="con">
	<c:forEach items="${list}" var="article">
		<section>
				<a href="./detail?id=${article.id}">��ȣ : ${article.id}, ���� : ${article.title}</a>
		</section>
		<hr>
	</c:forEach>
	</div>

</body>
</html>