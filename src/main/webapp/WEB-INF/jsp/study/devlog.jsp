<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script>
function devLogRead(){
	var date = $(".date").val();
	var params = "date="+date;
	var url = "/devlog?" + params;
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			$('#content').text(data);
		}
	});
}
function devLogSearch(){
	var url = "/devlogsearch?data=";
	var param = $("#search").val();
	window.open(url+param , "", "width=500, height=500, scrollbars=yes");
}
</script>

<div class="container">
	<section id="container">
		<div class="form-group">
			<input type="date" class="date"/>
			<input type="submit" onclick="devLogRead()" value="검색"/>
		</div>
		<div class="form-group">
			<input type="text" class="search" id="search"/>
			<input type="submit" onclick="devLogSearch()" value="검색"/>
		</div>
		<hr/>	
		<div class="form-group">
			<label for="content" class="col-sm-2 control-label">내용</label>
			<%-- <textarea rows="12" id="content" name="content" class="form-control"
				readonly="readonly"><c:out value="${str}"/></textarea> --%>
			<textarea rows="25" id="content" name="content" class="form-control"
				readonly="readonly"></textarea>
		</div>
	</section>
	<hr />
</div>
<%@ include file="../part/foot.jspf"%>