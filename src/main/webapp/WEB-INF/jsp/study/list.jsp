<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="pageName" value="게시물 리스트" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디엠에 오신 걸 환영합니다</title>
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
nav {
	margin:100px;
	margin-bottom:0px;
	background-color: #60c7c1;
	border-radius: 20px 20px 0px 0px;
}
	

.nav-link {
   	color: red;
	font-family: 맑은 고딕;
}

.pagination a.active {
	cursor: default;
	color: #ffffff;
}

.pagination a:active {
	outline: none;
}

.navbar .nav-link {
	font-family: 맑은 고딕;
	color: rgb(255, 255, 255);
	font-weight: bold;
}

.navbar .nav-link:hover {
	color: yellow;
}

div[id="container"] {
	margin: 0 100px;
}

div .search {
	padding: 15px;
}
</style>



</head>

<body>
<nav class="navbar navbar-expand-lg">
  <a class="navbar-brand" href="/"><span style="color:green;"><b>Study</b></span><span style="color: red;"><b>M</b></span></a>
   <div class="navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav">
      <li class="nav-item">
     	 <a class="nav-link" href="/study/mystatus">나의 스터디</a>
      </li>
      <li class="nav-item">
     	 <a class="nav-link" href="/study/add">스터디 등록</a>
      </li>
      <li class="nav-item">
      	<c:if test="${loginedMemberId == null}"><a class="nav-link trigger-btn" href="#myModal" data-toggle="modal">로그인</a></c:if>
      </li>
      <li class="nav-item">
      	<c:if test="${loginedMemberId != null}">
      		<span class="nav-link" style="pointer-events: none;"><span style="color:#fbfb98;">${loginedMemberId}</span>님 안녕하세요</span>
      	</c:if>
      </li>
    </ul>
  </div>
  <div>
  	<c:if test="${loginedMemberId != null}"><a class="nav-link" href="/member/doLogout">로그아웃</a></c:if>
  </div>
</nav>
<div id="container">
	<section id="container">
		<form role="form" method="get">
			<table class="table table-striped" style="margin: 0 auto;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>스터디 기간</th>
					<th>장소</th>
				</tr>

				<c:forEach items="${list}" var="study">
					<tr>
						<td><c:out value="${study.sno}" /></td>
						<td><a href="./detail?sno=${study.sno}">
							<c:out value="${study.sname}" /></a></td>
						<td><c:out value="${study.id}" /></td>
						<td> 
							<fmt:parseDate value='${study.totime}' var='totime' pattern='yy-MM-dd'/>
							<fmt:formatDate value="${totime}" pattern="yy-MM-dd" /> 
						     ~ <fmt:parseDate value='${study.fromtime}' var='fromtime' pattern='yy-MM-dd'/>
						     <fmt:formatDate value="${fromtime}" pattern="yy-MM-dd" />
						</td>
						<td><c:out value="${study.location}" /></td>
					</tr>
				</c:forEach>
			</table>
			<div class="search row form-group">
				<div>
					<a class="create btn btn-success float-right"
						href="/study/add">스터디 등록하기</a>
				</div>
				<div class="col-xs-2 col-sm-2" style="text-align: center">
					<select name="searchType" style="vertical-align: middle"
						class="custom-select">
						<option value="t"
							<c:out value="${scri.searchType eq \"t\" ? 'selected=\"selected\"' : ''}"/>>제목</option>
						<option value="c"
							<c:out value="${scri.searchType eq \"c\" ? 'selected=\"selected\"' : ''}"/>>내용</option>
						<option value="w"
							<c:out value="${scri.searchType eq \"w\" ? 'selected=\"selected\"' : ''}"/>>작성자</option>
						<option value="tc"
							<c:out value="${scri.searchType eq \"tc\" ? 'selected=\"selected\"' : ''}"/>>제목+내용</option>
					</select>
				</div>
				<!-- 글 검색 -->
				<div class="input-group" style="flex: 1; float: right;">
					<input class="col-sm-4" placeholder="Search"
						type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" /> <span class="input-group-btn"
						style="margin-left: 10px;">
						<button id="searchBtn" class="btn btn-secondary my-2 my-sm-0"
							type="button">검색</button>
					</span>
				</div>
				<script>
			      $(function(){
			        $('#searchBtn').click(function() {
			          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			        });
			      });   
			    </script>
			</div>
			<hr>
			<!-- 페이징 -->
			<div>
				<ul class="pagination" style="justify-content: center;">
					<li class="page-item"><a class="page-link"
						href="list${pageMaker.makeQuery(1)}">처음</a></li>
					<c:if test="${pageMaker.prev}">
						<li class="page-item"><a class="page-link"
							href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li class="page-item"><a class="page-link"
							href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</form>
	</section>
	<hr />
</div>
</body>
</html>