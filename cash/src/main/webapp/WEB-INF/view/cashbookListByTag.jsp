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
	</div>	
	<c:forEach var="m" items="${mapList}">
	
	</c:forEach>
	
	<a href="${pageContext.request.contextPath}/cashbookListByTag?beginRow=${beginRow}&rowPerPage=${rowPerPage}">이전</a>
	<a href="${pageContext.request.contextPath}/cashbookListByTag?beginRow=${beginRow}&rowPerPage=${rowPerPage}">다음</a>
</div>

</body>
</html>