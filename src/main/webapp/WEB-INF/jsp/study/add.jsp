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
		<h3>스터디 등록</h3><br>
	</div>
	<form action="./doAdd" class="joinForm con common-form" method="POST"
 		onsubmit="submitJoinForm(this); return false;"> 
 		<input type="hidden" id="id" name="id" value="${loginedMemberId}"/>
<!-- 		<div class="form-group"> -->
<!-- 			<label for="userId">아이디</label><input -->
<!-- 				type="text" class="form-control" id="userId" name="id" -->
<!-- 				aria-describedby="userId"> -->
<!-- 		</div> -->
		<div class="form-group">
			<label for="sname">스터디 제목</label> <input
				type="text" name="sname"
				class="form-control" id="sname">
		</div>
		<div class="form-group">
			<label for="content">스터디 내용</label> <textarea
				name="content" class="form-control" 
				id="content" aria-describedby="name"></textarea>
		</div>
		<div class="form-group">
			<label for="mname">스터디장 닉네임</label> <input
				type="text" name="mname"
				class="form-control" id="mname"
				aria-describedby="name">
		</div>
		<div class="form-group">
			<label for="location">스터디 지역</label> <input
				type="text" name="location"
				class="form-control" id="location"
				aria-describedby="name">
		</div>
		<div class="form-group">
			<label for="totime">시작 날짜</label>
			<p><input type="date" id="totime" name="totime"></p>
<!-- 			<input type="text" class="form-control" id="totime" name="totime" -->
<!-- 				aria-describedby="userId"> -->
		</div>
		<div class="form-group">
			<label for="fromtime">종료 날짜</label> 
			<p><input type="date"  id="fromtime" name="fromtime"></p>
<!-- 			<input type="text" name="fromtime" -->
<!-- 				class="form-control" id="fromtime"> -->
		</div>
		<div class="form-group">
			<label for="sdate">스터디 시간</label> 
			<input type="time" id="sdate" name="sdate">
<!-- 			<input type="text" name="sdate"  -->
<!-- 				class="form-control" id="sdate" -->
<!-- 				aria-describedby="name"> -->
		</div>
		<div class="form-group">
			<label for="joincode">가입코드</label> <input
				type="text" name="joincode"
				class="form-control" id="joincode"
				aria-describedby="name">
		</div>
		<input type="submit" value="등록하기" class="btn btn-primary button"/>
		<input type="reset" value="취소" class="btn btn-primary button" onclick="history.back();"/>
	</form>
	</div>
	<%@ include file="../part/foot.jspf"%>
