<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="${pageContext.request.contextPath}/asset/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/lib/animate.css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/asset/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="${pageContext.request.contextPath}/asset/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="${pageContext.request.contextPath}/asset/css/colors/default.css" rel="stylesheet">
  </head>



  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse">
	            <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span>
	            <span class="icon-bar"></span><span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/calendar">calendar</a>
          </div>
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">	              	
		        <c:if test="${empty sessionScope.loginMember}">
					<li><a href="${pageContext.request.contextPath}/login">
						Login
					</a></li>		            
		        </c:if>
		        <c:if test="${not empty sessionScope.loginMember}">
		            <li><a href="${pageContext.request.contextPath}/logout">
		            	Logout
		            </a></li>
		        </c:if>
              </li>
              <li class="dropdown">
              	<c:if test="${not empty sessionScope.loginMember}">
              		<li><a href="${pageContext.request.contextPath}/memberOne">
              			${loginMember}님
              		</a></li>
            	</c:if>                
              </li>
            </ul>
          </div>
        </div>
      </nav>
      
    </main>
    <script>
		// 디버깅을 위한 코드
		console.log("showPopup: ${showPopup}");
        // showPopup 변수가 true인 경우에만 팝업 창을 표시합니다.
		<c:if test="${showPopup}">
            alert("환영합니다 ${loginMember}님!");
        </c:if>
    </script>
  </body>