<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook.jsp</title>

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
                <h1 class="module-title font-alt mb-0">가계부 작성</h1>
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
		            <h4 class="font-alt mb-0">${targetYear}년 ${targetMonth}월 ${targetDay}일</h4>
		          </div>
		        </div>       
                <hr class="divider-w mt-10 mb-20">
						<form action="${pageContext.request.contextPath}/addCashbook" method="post">
							<p>			
								<span>
									수입 <input type="radio" name="category" value="수입">
								</span>
								<span>
									지출 <input type="radio" name="category" value="지출">			
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