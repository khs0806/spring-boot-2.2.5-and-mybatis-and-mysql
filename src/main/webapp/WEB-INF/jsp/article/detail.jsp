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
<style>
.con {
	width: 500px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<h1 class="con">�Խù� �� ������</h1>
	
	<section class="con">
		��ȣ : ${article.getId()}<br>
		���� : ${article.title}<br>
		���� : ${article.body}
	</section>
	
	<div class="btns con">
		<a href="./list">�Խù�����Ʈ</a>
		<a href="./add">�Խù� �߰�</a>
		<a href="./modify?id=${article.id}">�Խù� ����</a>
		<a onclick="if (confirm('���� �Ͻðڽ��ϱ�?') == false) return false;" href="./doDelete?id=${article.id}">�Խù� ����</a>
	</div>

</body>
</html>