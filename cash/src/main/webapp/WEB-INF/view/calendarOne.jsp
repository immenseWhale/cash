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
<div>
    <c:import url="/mainmenu"></c:import>
</div>

<div class="container">	
	<div align="center">
		<h1>가계부 상세</h1>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th> </th>
				<th>No</th>
				<th>Date</th>
				<th>Price</th>
				<th>Memo</th>
				<th>Hash Tag</th>
				<th>Createdate</th>
				<th>Updatedate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${mapList}">
				<tr>	
					<td>
						<form action="${pageContext.request.contextPath}/removeCashOne" method="post">
							<input type="hidden" name="cashbookNo" value="${m.cashbookNo}">
							<button type="submit">삭제</button>
						</form>
					</td>		
					<td>${m.cashbookNo}</td>		
					<td>${m.cashbookDate}</td>		
					<td>
						<c:if test="${m.category == '수입'}"><span>+${m.price}</span></c:if>
						<c:if test="${m.category == '지출'}"><span>-${m.price}</span></c:if>                     
					</td>   	
					<td>${m.memo}</td>	
					<td>${m.word}</td>		
					<td>${m.createdate}</td>		
					<td>${m.updatedate}</td>		
				</tr>
			</c:forEach>
		</tbody>					
	</table>
	<a href="${pageContext.request.contextPath}/addCashbook?targetYear=${targetYear}&targetMonth=${targetMonth+1}&targetDay=${targetDay} ">쓰기</a>
</div>
</body>
</html>