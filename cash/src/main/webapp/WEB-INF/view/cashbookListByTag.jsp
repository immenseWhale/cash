<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookListByTag.jsp</title>
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
		<h1>이 달의 태그</h1>
		<h5>${word}</h5>
	</div>	

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Date</th>
				<th>Price</th>
				<th>Memo</th>
				<th>Createdate</th>
				<th>Updatedate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${list}">
				<tr>	
					<td>${m.cashbookNo}</td>		
					<td>${m.cashbookDate}</td>		
					<td>
						<c:if test="${m.category == '수입'}"><span>+${m.price}</span></c:if>
						<c:if test="${m.category == '지출'}"><span>-${m.price}</span></c:if>                     
					</td>   	
					<td>${m.memo}</td>	
					<td>${m.createdate}</td>		
					<td>${m.updatedate}</td>		
				</tr>
			</c:forEach>
		</tbody>					
	</table>

<!-- 페이징 -->
<div>
	
	<c:if test="${minPage > 1}">
		<a href="${pageContext.request.contextPath}/cashbookListByTag?currentPage=${minPage-pagePerPage}&word=${word}">이전</a>
	</c:if>
	
	<c:forEach var="i" begin="${minPage}" end="${maxPage}" step="1">	
		<c:choose>
			<c:when test="${i == currentPage}">
				<span>${i}</span>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/cashbookListByTag?currentPage=${i}&word=${word}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	
	<c:if test="${maxPage != lastPage}">
		<c:set var="nextPage" value="${currentPage + 1}" />
		<a href="${pageContext.request.contextPath}/cashbookListByTag?currentPage=${minPage+pagePerPage}&word=${word}">다음</a>
	</c:if>
</div>

</body>
</html>