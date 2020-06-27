<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resource/css/main.css">
<%@ include file="../part/head.jspf"%>

<header>
		<div id="title">
			<span> 당신에게 필요한 모임 - <span style="color:green;"><b>Study</b></span><span style="color: red;"><b>M</b></span>
		</div>
		<div id="menu">			
			<a href="/home/main"><span style="margin-left:50px; color:green;"><b>스터디</b></span><span style="color: red;"><b>엠</b></span></a>
			<ul>
				<li style="margin-left: 20px;"><a href="#">공지사항</a></li>
				<li><a href="/study/list">스터디게시판</a></li>
				<li><a href="/study/mystatus">나의 스터디 보기</a></li>
				<c:if test="${isLogined == false}">				
					<li style="float: right; margin-right: 30px;">
						<a href="/member/join">회원가입</a>
					</li>
					<li style="float: right;">
						<a href="#myModal" class="trigger-btn" data-toggle="modal" >로그인 하기</a>
					</li>
				</c:if>
				<c:if test="${isLogined}">
					<li style="float: right; margin-right: 20px;">
						<a href="/member/doLogout">로그아웃</a>
					</li>
				</c:if>	
				<c:if test="${loginedMember != null}">
					<li style="float: right;">
						<div class="con">${loginedMember.id}님 환영합니다.</div>
					</li>
				</c:if>	
			</ul>			
		</div>		
	</header>
	<section>
		<div id="content">
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fldb.phinf.naver.net%2F20190719_42%2F1563527498327ep72X_JPEG%2FXRE0BVqaCxDVC-5dIzVSi2vk.jpg&type=b400"/>
			<div class="real">
				<div>실시간 Best 게시글</div>
				<div>
					<img src="/resource/img/rank1.jpg" style="width:20px; height: 20px;"/>
					<span>(서울 신촌,강남)롯데 인적성 스터디 모집합니다!</span>				
				</div>	
			</div>
			<div class="real">
				<div>공지사항</div>
				<div>
					<img src="/resource/img/rank1.jpg" style="width:20px; height: 20px;"/>
					<span>(서울 신촌,강남)롯데 인적성 스터디 모집합니다!</span>				
				</div>
			</div>
			<div class="real">
				<div>현 접속인원 : 0</div>
				<div>
					<img src="/resource/img/rank1.jpg" style="width:20px; height: 20px;"/>
					<span>(서울 신촌,강남)롯데 인적성 스터디 모집합니다!</span>				
				</div>
			</div>
			<div class="real">
				<div>스터디 그룹 현황</div>
				<div>
					<img src="/resource/img/rank1.jpg" style="width:20px; height: 20px;"/>
					<span>(서울 신촌,강남)롯데 인적성 스터디 모집합니다!</span>				
				</div>
			</div>
		</div>	
	</section>

<%@ include file="../part/foot.jspf"%>