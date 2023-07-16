<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			url: '${pageContext.request.contextPath}/selectMemberId', // 중복 체크를 수행하는 서블릿 주소
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

 <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="${pageContext.request.contextPath}/assets/css/colors/default.css" rel="stylesheet">
  </head>

  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
<div>
    <c:import url="/mainmenu"></c:import>
</div>


    <main>               
      <div class="main">
        <section class="module bg-dark-30 about-page-header" data-background="${pageContext.request.contextPath}/assets/images/about_bg.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt mb-0">Join us</h1>
              </div>
            </div>
          </div>
        </section>


<section class="module">
  <div class="container">
    <div class="row">
      <div class="col-sm-8 col-sm-offset-2">
        <div class="row">
          <div class="col-sm-6">
            <h4 class="font-alt mb-0">Join</h4>
          </div>
         </div>

			<div class="row" align="center">	            
			<hr class="divider-w mt-10 mb-20">
			<!-- 중복되도 상관없는 이유 : get으로 실행되면 컨트롤러에서 doGet으로 받고, post방식으로 오면 getPost로 받아서 이렇게 표현해도 괜찮다. -->
			<form action="${pageContext.request.contextPath}/addMember" method="post">
				<table border="1">
					<tr>
						<td>Member Id</td>
						<td>
							<input type ="text" name="memberId" id="memberId">
						</td>
					</tr>
					<tr>
						<td>Member Pw</td>
						<td>	<input type ="password" name="memberPw"></td>
					</tr>
				</table>
				<br>
				<button type="button" id="ckbtn">ID 중복체크</button>
				<button type="submit" id="joinBtn" disabled>회원가입</button>
			</form>
					</div>
              </div>
            </div>
          </div>
        </section>
        </div>

       
 <div>
    <c:import url="/footer"></c:import>
</div> 

<div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
</main>
        

</body>

    <!--  
    JavaScripts
    =============================================
    -->
    <script src="${pageContext.request.contextPath}/assets/lib/jquery/dist/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/wow/dist/wow.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/smoothscroll.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</html>