<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageName" value="회원가입" />
<%@ include file="../part/head.jspf"%>

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

<form class="con common-form" action="./doJoin" method="POST"
	onsubmit="submitJoinForm(this); return false;">
	<div>
		<span> 아이디 </span>
		<div>
			<input name="id" type="text" 
				autofocus="autofocus" maxlength="30">
		</div>
	</div>

	<div>
		<span> 비밀번호 </span>
		<div>
			<input name="pass" type="password" 
			autofocus="autofocus" maxlength="30"></input>
		</div>
	</div>

	<div>
		<span> 비밀번호 확인 </span>
		<div>
			<input name="passConfirm" type="password" 
			autofocus="autofocus" maxlength="30"></input>
		</div>
	</div>
	
	<div>
		<span> 닉네임 입력 </span>
		<div>
			<input name="name" type="text" 
			autofocus="autofocus" maxlength="30"></input>
		</div>
	</div>
	
	<div>
		<span> 이메일 입력 </span>
		<div>
			<input name="email" type="text" 
			autofocus="autofocus" maxlength="30"></input>
		</div>
	</div>
	<div>
		<div>
			<input type="submit" value="가입하기"><input type="reset"
				value="취소" onclick="history.back();">
		</div>
	</div>
</form>

<%@ include file="../part/foot.jspf"%>
