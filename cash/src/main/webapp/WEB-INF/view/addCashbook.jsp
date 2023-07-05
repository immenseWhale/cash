<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook.jsp</title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div>
    <c:import url="/mainmenu"></c:import>
</div>

	<h1>가계부 작성</h1>
	<h5>${targetYear}년 ${targetMonth}월 ${targetDay}일</h5>
	<form action="${pageContext.request.contextPath}/addCashbook" method="post">
		<p>			
			<span>
				수입<input type="radio" name="category" value="수입">
			</span>
			<span>
				지출<input type="radio" name="category" value="지출">			
			</span>
		</p>
		<p>금액 : <input type="number"  name="price" min="0" step="10">원</p>
		<p>날짜 : <input type="date" name="cashbookDate"></p>
		<p>메모 #를 이용하여 등록시 태그로 입력됩니다.<br>
			<textarea rows="2" cols="50" name="memo"></textarea>
		</p>	
		<input type="hidden" name="targetYear" value="${targetYear}">
		<input type="hidden" name="targetMonth" value="${targetMonth}">
		<input type="hidden" name="targetDay" value="${targetDay}">
		<button type="submit">등록</button>
	</form>
</body>
</html>