<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serchResultPage.jsp</title>
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
                <h1 class="module-title font-alt mb-0">Serch</h1>
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
		            <h4 class="font-alt mb-0">검색어 : ${word}</h4>
		          </div>
		        </div>           
				<hr class="divider-w mt-10 mb-20">
		
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>serchWord</th>
							<th>Date</th>
							<th>Price</th>
							<th>Memo</th>
							<th>Createdate</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${list}">
							<tr>	
								<td>${m.serchWord}</td>		
								<td>${m.cashbookDate}</td>		
								<td>
									<c:if test="${m.category == '수입'}"><span>+${m.price}</span></c:if>
									<c:if test="${m.category == '지출'}"><span>-${m.price}</span></c:if>                     
								</td>   	
								<td>${m.memo}</td>	
								<td>${m.createdate}</td>		
							</tr>
						</c:forEach>
					</tbody>					
				</table>
		
		<!-- 페이징 -->
			<div align="center">		
				<c:if test="${minPage > 1}">
					<a href="${pageContext.request.contextPath}/serchResultPage?currentPage=${minPage-pagePerPage}&word=${word}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${minPage}" end="${maxPage}" step="1">	
					<c:choose>
						<c:when test="${i == currentPage}">
							<span>${i}</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/serchResultPage?currentPage=${i}&word=${word}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				
				<c:if test="${maxPage != lastPage}">
					<c:set var="nextPage" value="${currentPage + 1}" />
					<a href="${pageContext.request.contextPath}/serchResultPage?currentPage=${minPage+pagePerPage}&word=${word}">다음</a>
				</c:if>
			</div>
		</div></div></div></section></div>
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