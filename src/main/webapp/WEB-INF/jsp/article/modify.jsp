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
	<h1 class="con">�Խù� ����</h1>

	<script>
		function submitModifyForm(form) {
			form.title.value = form.title.value.trim();
			if (form.title.value.length == 0) {
				alert('������ �Է����ּ���.');
				form.title.focus();
				return false;
			}
			form.body.value = form.body.value.trim();
			if (form.body.value.length == 0) {
				alert('������ �Է����ּ���.');
				form.body.focus();
				return false;
			}
			form.submit();
		}
	</script>
	
	<form class="con common-form" action="./doModify" method="POST"
		onsubmit="submitModifyForm(this); return false;">
		<input type="hidden" name="id" value="${article.id}">
		<div>
			<span> ���� </span>
			<div>
				<input name="title" type="text" placeholder="����"
					autofocus="autofocus" value="${article.title}">
			</div>
		</div>

		<div>
			<span> ���� </span>
			<div>
				<textarea name="body" placeholder="����">${article.body}</textarea>
			</div>
		</div>

		<div>
			<span> ���� </span>
			<div>
				<input type="submit" value="����"> <input type="reset"
					value="���" onclick="history.back();">
			</div>
		</div>
	</form>
	
	<div class="btns con">
		<a href="./list">�Խù� ����Ʈ</a> <a href="./add">�Խù� �߰�</a> <a
			onclick="if ( confirm('�����Ͻðڽ��ϱ�?') == false ) return false;"
			href="./doDelete?id=${article.id}">�Խù� ����</a>
	</div>

</body>
</html>