<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

function devLogRead(param){
	$.ajax({
		url:"/devlog?date=" + param,
		type:"get",
		dataType:"text",
		success:function(data){
// 			$('#content').text(data);
			$(opener.document).find("#content").text(data);
			close();
		}
	});
}
</script>
</head>
<body>
	<div align="center">
		<table>
			<c:choose>
				<c:when test="${devlogList.size() == 0}">
					<tr>
						<td>검색된 결과가 없습니다.</td>					
					</tr>
				</c:when>
				
				<c:when test="${devlogList.size() > 0}">
					<tr>
						<td>총 ${devlogList.size()}이 검색되었슴돠</td>					
					</tr>
					<c:forEach var="devlog" items="${devlogList}">
						<tr>
							<td>
								<button onclick="devLogRead('${devlog.devlog}')" >
									${devlog.date}
								</button>
							</td>						
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>	
		</table>
	</div>
</body>
</html>