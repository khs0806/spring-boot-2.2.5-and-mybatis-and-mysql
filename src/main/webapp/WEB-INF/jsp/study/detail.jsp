<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="pageName" value="스터디 상세페이지" />
<%@ include file="../part/head.jspf"%>
<style>
body {
	background-color:beige;
}
.btn-primary {
	background-color:#60c7c1;
	border-color: #ffffff;
	color: #0000009c;
	font-weight: 600;
}
</style>
<div class="container">
	<hr />
	<section id="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="bno" name="bno" value="${read.bno}" /> 
			<input type="hidden" id="page" name="page" value="${scri.page}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
		</form>
		<div class="form-group">
			<label for="title" class="col-sm-2 control-label">스터디 제목</label>
			<input type="text" id="title" name="title" class="form-control"
				value="${study.sname}" readonly="readonly" />
		</div>
		<div class="form-group">
			<label for="content" class="col-sm-2 control-label">내용</label>
			<textarea rows="12" id="content" name="content" class="form-control"
				readonly="readonly"><c:out value="${study.content}" /></textarea>
		</div>
		<div class="form-group">
			<label for="writer" class="col-sm-2 control-label">스터디장</label> 
			<input type="text" id="writer" name="writer" class="form-control"
				value="${study.id}" readonly="readonly" />
		</div>
		<div class="form-group">
			<label for="writer" class="col-sm-2 control-label">스터디원</label> 
			<input type="text" id="writer" name="writer" class="form-control"
				value="<c:forEach items="${memberList}" var="list"><c:if test="${list.id ne study.id}">${list.id},  </c:if></c:forEach>" readonly="readonly" />
		</div>
		<div class="form-group">
			<label for="regdate" class="col-sm-2 control-label">스터디 기간</label>
			<input type="text" id="writer" name="writer" class="form-control"
				value=" ${study.totime} ~ ${study.fromtime}" readonly="readonly" />
		</div>
		<div class="form-group">
			<label for="regdate" class="col-sm-2 control-label">스터디 시작시간</label>
			<input type="text" id="writer" name="writer" class="form-control"
				value=" ${study.sdate}" readonly="readonly" />
		</div>
		<c:if test="${loginedMemberId eq study.id}">
			<div class="form-group">
				<label for="regdate" class="col-sm-2 control-label">스터디 가입코드</label>
				<input type="text" id="writer" name="writer" class="form-control"
					value=" ${study.joincode}" readonly="readonly" />
			</div>
		</c:if>
		<ul id="replies">
		</ul>
		<hr>
		<div class="boardlist mb-4">
			<a href="./list"><button class="list_btn btn btn-primary btn-xl">목록</button></a>
			<c:if test="${loginedMemberId eq study.id}">
				<div class="pull-right">
					<a href="./modify?sno=${study.sno}"><button class="btn delete_btn btn btn-primary btn-xl">수정</button></a>
					<button class="kickOut btn delete_btn btn btn-primary btn-xl" data="join">스터디원 추방</button>
					<a onclick="if (confirm('삭제 하시겠습니까?') == false) return false;" href="./doDelete?sno=${study.sno}">
						<button class="btn btn-primary btn-xl">
						스터디 삭제
						</button>
					</a> 
				</div>
			</c:if>
			<div class="btns pull-right">
				<input type="hidden" id="sno" value="${study.sno}">
				<c:choose>
			    	<c:when test="${isJoin eq 'true' && loginedMemberId ne study.id}">
			            <button class="groupOut btn btn-primary btn-xl" data-sno="${study.sno}">탈퇴하기</button>
			        </c:when>
			        <c:when test="${isJoin eq 'false' }">
			            <button class="joinGroup btn btn-primary btn-xl" data="join">참가신청</button>
			        </c:when>
			    </c:choose>
			</div>
		</div>
		<!-- 댓글 리스트 -->
		<div class="row">
			<div class="col-lg-12">
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i> 댓글
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<ul class="chat">

						</ul>
						<!-- ./ end ul -->
					</div>
					<!-- /.panel .chat-panel -->
					<div class="panel-footer">by Kim-hyunsoo</div>
				</div>
			</div>
			<!-- ./ end row -->
		</div>

		<!-- 댓글작성 -->
		<hr>
		<div name="replyForm" class="form-horizontal">
			<div>
				<span><strong>Comments</strong></span> <span id="cCnt"></span>
			</div>
			<div class="reply">
				<div class="replyName">
					<div class="input-group">
						<input type="text" class="form-control" id="newReplyWriter"
							name="writer" placeholder="이름을 입력하세요.">
					</div>
				</div>
				<div class="replyComment">
					<div class="input-group">
						<textarea rows="3" cols="30" placeholder="댓글을 입력하세요"
							class="form-control" id="newReplyText" name="content"></textarea>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 mt-2">
					<button type="submit" class="btn btn-primary" id="replyAddBtn">
						댓글 작성</button>
				</div>
			</div>
		</div>
	</section>
	<hr />
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
