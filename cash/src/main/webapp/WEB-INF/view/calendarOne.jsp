<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendarOne.jsp</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">	
	<div align="center">
		<h1>가계부 상세</h1>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>cashbookNo</th>
				<th>cashbookDate</th>
				<th>price</th>
				<th>word</th>
				<th>createdate</th>
				<th>updatedate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="mapList">
				<tr>	
					<td>${m.cashbookNo}</td>		
					<td>${m.cashbookDate}</td>		
					<td>
						<c:if test="${m.categoy =='수입'}"><span>+${m.price}</span></c:if>
						<c:if test="${m.categoy =='지출'}"><span>-${m.price}</span></c:if>											
					</td>		
					<td>${m.word}</td>		
					<td>${m.createdate}</td>		
					<td>${m.updatedate}</td>		
				</tr>
			</c:forEach>
		</tbody>					
	</table>
</div>
</body>
</html>