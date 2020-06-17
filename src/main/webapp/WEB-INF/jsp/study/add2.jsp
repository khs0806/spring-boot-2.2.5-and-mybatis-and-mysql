<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageName" value="게시물 추가" />
<%@ include file="../part/head.jspf"%>
<script>
		function submitAddForm(form) {
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

<form class="con common-form" action="./doAdd" method="POST">
<!-- 	onsubmit="submitAddForm(this); return false;"--> 
	<div>
		<span> 아이디 </span>
		<div>
			<input name="id" type="text" placeholder="아이디"
				autofocus="autofocus">
		</div>
	</div>

	<div>
		<span> 스터디 제목 </span>
		<div>
			<input name="sname" type="text" placeholder="스터디 제목"></textarea>
		</div>
	</div>
	<div>
		<span> 스터디 내용 </span>
		<div>
			<textarea name="content" placeholder="스터디장 내용"></textarea>
		</div>
	</div>
	<div>
		<span> 스터디 닉네임 </span>
		<div>
			<input name="mname" type="text" placeholder="스터디 닉네임"
				autofocus="autofocus">
		</div>
	</div>

	<div>
		<span> 스터디 지역 </span>
		<div>
			<input name="location" type="text" placeholder="스터디 지역"
				autofocus="autofocus">
		</div>
	</div>

	<div>
		<span> 시작 날짜 </span>
		<div>
			<input name="totime" type="text" placeholder="시작 날짜"></textarea>
		</div>
	</div>
	<div>
		<span> 종료 날짜 </span>
		<div>
			<input name="fromtime" type="text" placeholder="종료 날짜"
				autofocus="autofocus">
		</div>
	</div>

	<div>
		<span> 스터디 시간 </span>
		<div>
			<input name="sdate" type="text" placeholder="스터디 시간"></textarea>
		</div>
	</div>
	<div>
		<span> 가입코드 </span>
		<div>
			<input name="joincode" type="text" placeholder="가입코드"
				autofocus="autofocus">
		</div>
	</div>

	<div>
		<span> 작성 </span>
		<div>
			<input type="submit" value="작성"> <input type="reset"
				value="취소" onclick="history.back();">
		</div>
	</div>
</form>
<%@ include file="../part/foot.jspf"%>
