<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#ckbtn").click(function() {
		//alert("버튼체크");
		let memberId = $("#memberId").val(); // 입력한 memberId 값 가져오기

		// AJAX 요청 보내기
		$.ajax({
			url: '${pageContext.request.contextPath}/SelectMemberId', // 중복 체크를 수행하는 서블릿 주소
			type: 'POST',
			data: { memberId: memberId }, // 서버로 보낼 데이터
			success: function(response) {
				// 중복 여부에 따라 처리
				if (response == '1') {
					alert('이미 사용 중인 아이디입니다.');
					$('#joinBtn').prop('disabled', true); // 수정 버튼 비활성화
				} else {
					alert('사용 가능한 아이디입니다.');
					$('#joinBtn').prop('disabled', false); // 수정 버튼 활성화
				}
			},
			error: function(response) {
				// 에러 처리
				console.log(param);
				alert('중복 체크 요청을 실패했습니다.');
			}
		});
	});
});
</script>

</head>
<body>
	<h1>회원가입</h1>
	<!-- 중복되도 상관없는 이유 : get으로 실행되면 컨트롤러에서 doGet으로 받고, post방식으로 오면 getPost로 받아서 이렇게 표현해도 괜찮다. -->
	<form action="${pageContext.request.contextPath}/addMember" method="post">
		<table border="1">
			<tr>
				<td>Member Id</td>
				<td>
					<input type ="text" name="memberId" id="memberId">
					<button type="button" id="ckbtn">중복체크</button>
				</td>
			</tr>
			<tr>
				<td>Member Pw</td>
				<td>	<input type ="password" name="memberPw"></td>
			</tr>
		</table>
		<button type="submit" id="joinBtn" disabled>회원가입</button>
	</form>
</body>
</html>