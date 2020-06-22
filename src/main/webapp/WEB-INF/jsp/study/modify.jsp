<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resource/css/join.css">
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<script>
		function submitModifyForm(form) {
			form.title.value = form.title.value.trim();
			if (form.title.value.length == 0) {
				alert('제목을 입력해주세요.');
				form.title.focus();
				return false;
			}
			form.body.value = form.body.value.trim();
			if (form.body.value.length == 0) {
				alert('내용을 입력해주세요.');
				form.body.focus();
				return false;
			}
			form.submit();
		}
	</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand joinnav" href="/">Study<span style="color:red;">M</span></a>
	</nav>
	<div class="container">
	<br>
	<div class="join-name">
		<h3>스터디 수정</h3><br>
	</div>
	<form action="./doModify" class="joinForm con common-form" method="POST"
 		onsubmit="submitJoinForm(this); return false;"> 
 		<input type="hidden" id="id" name="id" value="${loginedMemberId}"/>
 		<input type="hidden" id="joincode" name="joincode" value="${study.joincode}"/>
 		<input type="hidden" id="sno" name="sno" value="${study.sno}"/>
		<div class="form-group">
			<label for="sname">스터디 제목</label> 
			<input type="text" name="sname"
				class="form-control" id="sname" value="${study.sname}">
		</div>
		<div class="form-group">
			<label for="content">스터디 내용</label> <textarea
				name="content" class="form-control" 
				id="content" aria-describedby="name" value="${study.content}"></textarea>
		</div>
		<div class="form-group">
			<label for="location">스터디 지역</label> 
			<input type="text" name="location"
				class="form-control" id="location" aria-describedby="name"
				value="${study.location}">
		</div>
		<div class="form-group">
			<label for="totime">시작 날짜</label>
			<p><input type="date" id="totime" name="totime" value="${study.totime}"></p>
		</div>
		<div class="form-group">
			<label for="fromtime">종료 날짜</label> 
			<p><input type="date"  id="fromtime" name="fromtime" value="${study.fromtime}"></p>
		</div>
		<div class="form-group">
			<label for="sdate">스터디 시작시간</label> 
			<input type="time" id="sdate" name="sdate" value="${study.sdate}">
		</div>
		<input type="submit" value="수정하기" class="btn btn-primary button"/>
		<input type="reset" value="취소" class="btn btn-primary button" onclick="history.back();"/>
	</form>
	</div>
<%@ include file="../part/foot.jspf"%>
