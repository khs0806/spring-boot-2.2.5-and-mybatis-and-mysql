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
.replyMod {
	float: right;
}
#modDiv {
	width:300px;
	height:100px;
	background-color:gray;
	position:fixed;
	top:50%;
	left:50%;
	margin-top:-50px;
	margin-left:-150px;
	padding:10px;
	z-index:1000;
	display:none;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2992107a6cdd4a70cae5c448140c5fd1"></script>
<script>
// Kakao MAP API 이용하기
$(document).ready(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${study.lat}, ${study.lng}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${study.lat}, ${study.lng}); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">${study.location} <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
});
</script>
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
		<div class="form-group">
			<label for="regdate" class="col-sm-2 control-label">스터디 장소</label>
			<input type="text" id="mapp" name="writer" class="form-control"
				value="${study.location}" readonly="readonly" />
			<div id="map" style="width:100%;height:350px;"></div>
		</div>
		
		<!-- Ajax로 댓글처리 -->
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
							name="id" value="${loginedMemberId}" readonly="readonly">
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
		
		<!-- 댓글 수정하기 modal -->
		<div id="modDiv">
			<div class="modal-title"></div>
			<div>
				<input type="text" id="replytext">
			</div>
			<c:if test="">
				<div>
					<button type="button" id="replyModBtn">수정</button>
					<button type="button" id="closeBtn">닫기</button>
				</div>
			</c:if>
		</div>
	</section>
	<hr />
</div>
<script>
$(document).ready(function(){
	joinGroup();
	kickOut();
	groupOutFunc();
	getAllList();
	replyAdd();
	replyUpdate();
	replyDel();
	replyModalView();
	replyModalClose();
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
<!-- 댓글 자바스크립트 -->
//댓글 목록 가져오기 AJAX
function getAllList(){
	var str='';
	var sno=${study.sno};
	$.getJSON("/replies/all/" + sno, function(data){
		console.log(data.length);
		$(data).each(
			function(){
				str +="<li class='left clearfix' data-no='"+this.no+"'>";
		        str +="<div><div class='header'><strong class='primary-font' style='font-size:17px;'>"
		    	    +this.id+"</strong>"; 
		        str +="<small class='pull-right text-muted'>"
		            +this.regdate+"</small></div>";
		        str +="<p>"+this.content+"</p></div>";
		        if ('${loginedMemberId}' == this.id){
		       	str	+="<div class='replyMod'><button class='btn btn-primary' id='replyMod'>수정</button>"
		       		+"<button class='btn btn-primary' id='replyDelBtn'>삭제</button></div>";
		        }
		        str +="</li>";
			});
		$(".chat").html(str);
	});
}
/* 댓글 등록 */
function replyAdd(){
	$("#replyAddBtn").on("click", function(){
		
		var replyer = $("#newReplyWriter").val();
		var replytext = $("#newReplyText").val();
		var sno=${study.sno};
		
		$.ajax({
			type:'post',
			url:'/replies/',
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"
			},
			dataType:'text',
			data : JSON.stringify({
				sno:sno,
				id:replyer,
				content:replytext
			}),
			success:function(result){
				if (result=='SUCCESS'){
					getAllList();
				}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
	});
}
/* 댓글 수정 */
function replyUpdate(){
	$("#replyModBtn").on("click",function(){
		
		var no= $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type : 'put',
			url : '/replies/' + no,
			headers : {
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"
			},
			data : JSON.stringify( {content : replytext} ),
			dataType:'text',
			success:function(result){
				console.log("result: " + result)
				if (result=='SUCCESS'){
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});
}		
/* 댓글 삭제 */
function replyDel(){
	$(".chat").on("click",".replyMod #replyDelBtn", function(){
		
		var reply = $(this).parents("li");
		var no = reply.attr("data-no");
		
		$.ajax({
			type:'delete',
			url:'/replies/' + no,
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"DELETE"
			},
			dataType:'text',
			success:function(result){
				console.log("result: " + result)
				if (result=='SUCCESS'){
					alert("삭제 되었습니다.");
					getAllList();
				}
			}
		});
	});
}
//댓글 수정창 불러오기
function replyModalView(){
	$(".chat").on("click",".replyMod #replyMod", function(){
		var reply = $(this).parents("li");
		var no = reply.attr("data-no");
		var replytext = reply.find("p").text();
		
		$(".modal-title").html(no);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
	});
}
// 댓글 수정창 닫기
function replyModalClose(){
	$("#closeBtn").on("click",function(){
		$("#modDiv").hide("slow");
	});
}
</script>
<%@ include file="../part/foot.jspf"%>
