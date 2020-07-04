
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
	
	form.email.value = form.email.value.trim();
	if (form.email.value == 0){
		alert('이메일을 입력하세요.');
		form.email.focus();
		return false;
	}
	
	idChk = form.idChkCount.value;
	if (idChk != 0) {
		alert('아이디 중복확인을 해주세요.');
		form.idChk.focus();
		return false;
	}
	form.submit();
}

function idCheck(obj) {
	
	if(obj.id.value == ""){
		alert("아이디를 입력하세요");
		obj.id.focus();
		return false;
	}
	var url = "/member/idChk?id=" + obj.id.value;
	window.open(url, "", "width=400, height=200");
}