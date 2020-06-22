<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resource/css/join.css">
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<style>
	.joinnav{
		margin:0 auto;
	}
</style>
<script>
		function submitJoinForm(form) {
			form.id.value = form.id.value.trim();
			if (form.id.value.length == 0) {
				alert('아이디를 입력해주세요.');
				form.id.focus();
				return false;
			}
			form.pass.value = form.pass.value.trim();
			if (form.pass.value.length == 0) {
				alert('패스워드를 입력해주세요.');
				form.pass.focus();
				return false;
			}
			form.passConfirm.value = form.passConfirm.value.trim();
			if (form.passConfirm.value.length == 0) {
				alert('패스워드 확인을  입력해주세요.');
				form.passConfirm.focus();
				return false;
			}
			
			if (form.pass.value != form.passConfirm.value) {
				alert('비밀번호가 서로 일치하지 않습니다.');
				form.passConfirm.focus();
				return false;
			}
			form.submit();
		}
	</script>
<title>Hello, world!</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand joinnav" href="/">Study<span style="color:red;">M</span></a>
	</nav>
	<div class="container">
	<br>
	<div class="join-name">
		<h3>회원가입</h3><br>
	</div>
	<form action="./doJoin" class="joinForm con common-form" method="POST"
		onsubmit="submitJoinForm(this); return false;">
		<div class="form-group">
			<label for="userId">아이디</label><input
				type="text" class="form-control" id="userId" name="id"
				aria-describedby="userId">
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label> <input
				type="password" name="pass"
				class="form-control" id="password">
		</div>
		<div class="form-group">
			<label for="name">비밀번호 확인</label> <input
				type="password" name="passConfirm" 
				class="form-control" id="password"
				aria-describedby="name">
		</div>
		<div class="form-group">
			<label for="name">이메일 입력</label> <input
				type="email" name="email"
				class="form-control" id="name"
				aria-describedby="name">
		</div>
		<input type="submit" value="가입하기" class="btn btn-primary button"/>
		<input type="reset" value="취소" class="btn btn-primary button" onclick="history.back();"/>
	</form>
	</div>
	<%@ include file="../part/foot.jspf"%>
