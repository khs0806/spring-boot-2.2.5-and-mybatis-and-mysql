<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageName" value="회원가입" />
<%@ include file="../part/head.jspf"%>

<script>
		function submitJoinForm(form) {
			form.loginId.value = form.loginId.value.trim();
			if (form.loginId.value.length == 0) {
				alert('아이디를 입력해주세요.');
				form.loginId.focus();
				return false;
			}
			form.loginPw.value = form.loginPw.value.trim();
			if (form.loginPw.value.length == 0) {
				alert('패스워드를 입력해주세요.');
				form.loginPw.focus();
				return false;
			}
			form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
			if (form.loginPwConfirm.value.length == 0) {
				alert('패스워드 확인을  입력해주세요.');
				form.loginPwConfirm.focus();
				return false;
			}
			
			if (form.loginPw.value != form.loginPwConfirm.value) {
				alert('비밀번호가 서로 일치하지 않습니다.');
				form.loginPwConfirm.focus();
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
			<input name="loginId" type="text" 
				autofocus="autofocus" maxlength="30">
		</div>
	</div>

	<div>
		<span> 비밀번호 </span>
		<div>
			<input name="loginPw" type="password" 
			autofocus="autofocus" maxlength="30"></input>
		</div>
	</div>

	<div>
		<span> 비밀번호 확인 </span>
		<div>
			<input name="loginPwConfirm" type="password" 
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
