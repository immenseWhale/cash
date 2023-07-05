<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div>
        <a href="${pageContext.request.contextPath}/calendar">달력</a>
    </div>
    <div>
        <c:if test="${empty sessionScope.loginMember}">
            <a href="${pageContext.request.contextPath}/login">로그인</a>
        </c:if>
        <c:if test="${not empty sessionScope.loginMember}">
            <span>${loginMember}님 </span>
            <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
        </c:if>
    </div>
    <script>
		// 디버깅을 위한 코드
		console.log("showPopup: ${showPopup}");
        // showPopup 변수가 true인 경우에만 팝업 창을 표시합니다.
		<c:if test="${showPopup}">
            alert("환영합니다 ${loginMember}님!");
        </c:if>
    </script>
</body>