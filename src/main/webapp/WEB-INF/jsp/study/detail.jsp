<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageName" value="게시물 상세페이지" />
<%@ include file="../part/head.jspf"%>

<section class="con">
	번호 : ${study.sno}<br> 
	제목 : ${study.sname}<br> 
	내용 : ${study.content}<br>
	시작날짜 : ${study.totime}<br> 
	종료날짜 : ${study.fromtime}<br> 
	스터디 시작시간 : ${study.sdate}<br><br>
</section>

<c:if test="${loginedMemberId eq study.id}">
	<div class="con">
		<span>가입코드</span>
		<p>${study.joincode}</p>
	</div>
</c:if>

<section class="con">
       <span>스터디 장</span>
  		<p>${study.id}</p>
</section>

<c:if test="${loginedMemberId ne study.id}">
<section class="con">
	<span>스터디 회원</span>
	<c:forEach items="${memberList}" var="list">
		<c:if test="${list.id ne study.id}">
			<p>${list.id}</p>
		</c:if>
	</c:forEach>
</section>
</c:if>

<c:if test="${loginedMemberId eq study.id}">
<section class="con">
	<span>스터디 회원</span>
	<c:forEach items="${memberList}" var="list">
		<c:if test="${list.id ne study.id}">
			<p><a href="./pointview?sno=${study.sno}&id=${list.id}">${list.id}</a></p>
		</c:if>
	</c:forEach>
</section>
</c:if>

<div class="btns con">
	<button class="btn">
		<a href="./list">목록으로</a>
	</button>
	<c:if test="${loginedMemberId eq study.id}">
		<button class="btn"><a href="./modify?sno=${study.sno}">수정</a></button>
		<button class="kickOut btn" data="join">스터디원 추방</button>
		<button class="btn">
			<a onclick="if (confirm('삭제 하시겠습니까?') == false) return false;"
				href="./doDelete?sno=${study.sno}">스터디 삭제</a>
		</button> 
	</c:if> 
</div>
<div class="btns con">
	<input type="hidden" id="sno" value="${study.sno}">
	<c:choose>
    	<c:when test="${isJoin eq 'true'}">
            <button class="btn">참여중</button>
            <button class="groupOut btn" data-sno="${study.sno}">탈퇴하기</button>
        </c:when>
        <c:when test="${isJoin eq 'false' }">
            <button class="joinGroup btn" data="join">참가신청</button>
        </c:when>
    </c:choose>
</div>
<script>
$(document).ready(function(){
	joinGroup();
	kickOut();
	groupOutFunc();
});
function joinGroup() {
    $('.joinGroup').on('click', function () {
    	 var joincode = prompt('가입코드를 입력하세요.');
    	 if (joincode != null){
	         var no = $('#sno').val();
	         $.ajax({
	             type: 'POST',
	             url: '/study/join',
	             data: {
	                 sno: no,
	                 code: $.trim(joincode)
	             },
	             dataType: 'text',
	             success: function(result){
	             	if (result == 'SUCCESS')
	                 alert('가입되었습니다.');
	             	 location.reload();
	             },
	             error: function(request){
			        alert(request.responseText);
			     }
	         });
    	 }
    });
}
function kickOut() {
    $('.kickOut').on('click', function () {
    	 var kickedId = prompt('추방시킬 ID를 입력하세요');
    	 if (kickedId != null && kickedId != '${study.id}'){
	         var sno = ${study.sno}
	         console.log(kickedId,sno)
	         $.ajax({
	             type: 'POST',
	             url: '/study/kickout',
	             data: {
	                 sno: sno,
	                 kickedId: $.trim(kickedId)
	             },
	             dataType: 'text',
	             success: function(result){
	            	if (result == 'success') {
			            alert('해당 회원이 탈퇴되었습니다.');
	            	} else {
	            		alert('회원의 ID가 맞는지 확인하세요.');
	            	}
	            	location.reload();
	             },
	             error: function(request){
			        alert(request.responseText);
			     }
	         });
    	 }
    	 if (kickedId == '${study.id}'){
    		 alert('스터디장은 탈퇴시킬 수 없습니다.');
    	 }
    });
}
function groupOutFunc(){
	var check = false;
	$('.groupOut').on('click', function () {
	    $.ajax({
	        type: 'POST',
	        url: '/study/groupout',
	        data: {
	            sno: $('.groupOut').data('sno')
	        },
	        dataType: 'text',
	        success: function (result) {
	            if (result == '1') {
	                check = true;
	            }
	        },
	        error: function () {
	            check = false;
	        },
	        complete: function () {
	            if (check == true) {
	                alert('해당 스터디를 탈퇴 했습니다.');
	                location.reload();
	            } else {
	                alert('탈퇴에 실패 했습니다. 다시 한번 확인해주세요.');
	                location.reload();
	            }
	        }
	    });
	});
}
</script>
<%@ include file="../part/foot.jspf"%>
