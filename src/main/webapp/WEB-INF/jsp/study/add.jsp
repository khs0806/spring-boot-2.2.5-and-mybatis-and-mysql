<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resource/css/join.css">
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2992107a6cdd4a70cae5c448140c5fd1&libraries=services"></script>
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
<title>Hello, world!</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand joinnav" href="/">Study<span style="color:red;">M</span></a>
	</nav>
	<div class="container">
	<br>
	<div class="join-name">
		<h3>스터디 등록</h3><br>
	</div>
	<form action="./doAdd" class="joinForm con common-form" method="POST"
 		onsubmit="submitJoinForm(this); return false;"> 
 		<input type="hidden" id="id" name="id" value="${loginedMemberId}"/>
 		<input type="hidden" id="lat" name="lat"/>
 		<input type="hidden" id="lng" name="lng"/>
<!-- 		<div class="form-group"> -->
<!-- 			<label for="userId">아이디</label><input -->
<!-- 				type="text" class="form-control" id="userId" name="id" -->
<!-- 				aria-describedby="userId"> -->
<!-- 		</div> -->
		<div class="form-group">
			<label for="sname">스터디 제목</label> <input
				type="text" name="sname"
				class="form-control" id="sname">
		</div>
		<div class="form-group">
			<label for="content">스터디 내용</label> <textarea
				name="content" class="form-control" 
				id="content" aria-describedby="name"></textarea>
		</div>
		<div class="form-group">
			<label for="mname">스터디장 닉네임</label> <input
				type="text" name="mname"
				class="form-control" id="mname"
				aria-describedby="name">
		</div>
		<div class="form-group">
			<label for="location">스터디 지역</label>
			<input
				type="text" name="location"
				class="form-control" id="mapInput"
				placeholder="지역명 입력">
			<button type="button" id="mapSearch">검색</button>
			<div id="map" style="width:100%;height:350px;"></div>
		</div>
		<div class="form-group">
			<label for="totime">시작 날짜</label>
			<p><input type="date" id="totime" name="totime"></p>
<!-- 			<input type="text" class="form-control" id="totime" name="totime" -->
<!-- 				aria-describedby="userId"> -->
		</div>
		<div class="form-group">
			<label for="fromtime">종료 날짜</label> 
			<p><input type="date"  id="fromtime" name="fromtime"></p>
<!-- 			<input type="text" name="fromtime" -->
<!-- 				class="form-control" id="fromtime"> -->
		</div>
		<div class="form-group">
			<label for="sdate">스터디 시작시간</label> 
			<input type="time" id="sdate" name="sdate">
<!-- 			<input type="text" name="sdate"  -->
<!-- 				class="form-control" id="sdate" -->
<!-- 				aria-describedby="name"> -->
		</div>
		<input type="submit" value="등록하기" class="btn btn-primary button"/>
		<input type="reset" value="취소" class="btn btn-primary button" onclick="history.back();"/>
	</form>
	</div>
	
	<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
// ps.keywordSearch('효성풍림', placesSearchCB); 
mapSearch.onclick = function(){
	var mapSearch = document.getElementById('mapInput');
	ps.keywordSearch(mapSearch.value, placesSearchCB);
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
		
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
        mapSearch.innerHTML = "검색된 지역을 클릭하세요.";
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x)
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
        mapInput.value = place.place_name;
        mapSearch.innerHTML = "검색";
        lat.value = place.y;
        lng.value = place.x;
    });
}
</script>
	
	<%@ include file="../part/foot.jspf"%>
