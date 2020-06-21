<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageName" value="게시물 상세페이지" />
<%@ include file="../part/head.jspf"%>

<section class="con">
	번호 : ${study.sno}<br> 
	제목 : ${study.sname}<br> 
	내용 : ${study.content}<br>
	스터디장 : ${study.mname}<br> 
	시작날짜 : ${study.totime}<br> 
	종료날짜 : ${study.fromtime}<br> 
	스터디 시작시간 : ${study.sdate}<br><br>
</section>

    <section class="con">
        <span>스터디 회원</span>
		<c:forEach items="${memberList}" var="list">
    		<p>${list.id }</p>
		</c:forEach>
	</section>

<div class="btns con">
	<a href="./list">게시물리스트</a> 
	<a href="./add">게시물 추가</a> 
	<a href="./modify?sno=${study.sno}">게시물 수정</a> 
	<a onclick="if (confirm('삭제 하시겠습니까?') == false) return false;"
		href="./doDelete?sno=${study.sno}">게시물 삭제</a>
</div>
<div class="btns con">
	<input type="hidden" id="sno" value="${study.sno}">
	<c:choose>
    	<c:when test="${isJoin eq 'true'}">
            <button class="btn">참여중</button>
        </c:when>
        <c:when test="${isJoin eq 'false' }">
            <button class="joinGroup btn" data="join">참가신청</button>
        </c:when>
    </c:choose>
</div>
<script>
$(document).ready(function(){
	joinGroup();
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
	                 code: joincode
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
</script>
<%@ include file="../part/foot.jspf"%>
