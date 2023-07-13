<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import = "cash.vo.*" %>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

	Member member = (Member) request.getAttribute("member");
	System.out.println(request.getAttribute("member") +"<--getAttribute member-- modifyMember.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyMember.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
$(document).ready(function() {
	$('#ckBtn').click(function(){
		//alert('ckbtn click');		
		//공백일 경우 메시지
		if ($('#newPw').val() === undefined || $('#newPw').val() === '' 
		|| $('#pwCk').val() === undefined || $('#pwCk').val() === '') {
			alert('비밀번호 칸이 비었습니다.');
			$('#modifyBtn').prop('disabled', true); // 수정 버튼 비활성화
		} else if ($('#newPw').val() != $('#pwCk').val()) {
			alert('비밀번호가 일치하지 않습니다.');
			$('#modifyBtn').prop('disabled', true); // 수정 버튼 비활성화
		} else {
			alert('비밀번호가 일치합니다.');
			$('#modifyBtn').prop('disabled', false); // 수정 버튼 활성화
	    }
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
            <h1 class="module-title font-alt mb-0">Your Info</h1>
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
                <h4 class="font-alt mb-0">멤버 정보 수정</h4>
              </div>
            </div>
            <div class="row">
              <hr class="divider-w mt-10 mb-20">
              <form action="${pageContext.request.contextPath}/modifyMember" method="post">
                <div class="form-group">
                  <label>ID:</label>
                  <p><%= member.getMemberId() %></p>
                  <input type="hidden" name="memberId" value="<%= member.getMemberId() %>">
                </div>
                <div class="form-group">
                  <label>기존 비밀번호:</label>
                  <input class="form-control" type="password" name="beforePw">
                </div>
                <div class="form-group">
                  <label>새로운 비밀번호:</label>
                  <input class="form-control" type="password" name="newPw" id="newPw">
                </div>
                <div class="form-group">
                  <label>비밀번호 확인:</label>
                  <input class="form-control" type="password" id="pwCk">
                  <br>
                	<button type="button" id="ckBtn">비밀번호 확인</button>
                </div>
                <br>
                <div class="form-group">
                  <label>가입일자:</label>
                  <p><%= member.getCreatedate() %></p>
                </div>
                <div class="form-group">
                  <label>수정일자:</label>
                  <p><%= member.getUpdatedate() %></p>
                </div>
                <button type="submit" id="modifyBtn" disabled>수정</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</main>

       
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
