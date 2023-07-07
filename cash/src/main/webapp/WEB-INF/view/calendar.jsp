<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--문자열 자르기 위한 import -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar.jsp</title>
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
        
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-4 col-md-3 sidebar">
 <!-- 서치 -->
                <div class="widget">
                  <form role="form">
                    <div class="search-box">
                      <input class="form-control" type="text" placeholder="Search..."/>
                      <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                  </form>
                </div>
<!--  태그 -->
                <div class="widget">
                  <h5 class="widget-title font-alt">Tag</h5>
			  <div class="tags font-serif">
					<c:forEach var="m" items="${htList}">
						<a href="${pageContext.request.contextPath}/cashbookListByTag?word=${m.word}" rel="tag">
							${m.word}(${m.cnt})
						</a>
					</c:forEach>
                  </div>
                </div>




              </div>
              <div class="col-sm-8 col-sm-offset-1">
                <div class="post">
                
	<h1>
	<!-- 변수값or반환값 -> EL사용 	 -->
	<!-- 자바코드(제어문) : JSTL 사용 -->
		<a href="${pageContext.request.contextPath}/calendar?targetYear=${targetYear}&targetMonth=${targetMonth-1}">	&#60;&#60;</a>
		${targetYear}년 ${targetMonth+1}월
		<a href="${pageContext.request.contextPath}/calendar?targetYear=${targetYear}&targetMonth=${targetMonth+1}">&#62;&#62;</a>
	</h1>
	
	
	
	
	<table class="table table-bordered ">
		<thead>
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
		</thead>
		<tr>
			<!-- 총 날짜까지 반북문 -->
			<c:forEach var="i" begin="0" end="${totalCell - 1}" step="1">
				<!--dateNum에 시작 날짜 입력 (시작 공백만큼 빼주고 1을 더해야 시작일) -->
				<c:set var="dateNum" value="${i - beginBlank + 1}" />
				
				<!--7일마다 행바꿈 -->
				<c:if test="${i % 7 == 0 && i !=0}">
					</tr><tr>
				</c:if>
					
				<!--1일부터 마지막 날까지 출력 -->
				<c:if test="${dateNum > 0 && dateNum <= lastDate}">
				
					<!--7일마다 빨간색으로 -->
					<c:if test="${i % 7 == 0}">
						<td>
							<a href="${pageContext.request.contextPath}/calendarOne?targetYear=${targetYear}&targetMonth=${targetMonth-1}&targetDay=${dateNum}">
								<p class="text-danger">${dateNum}</p>							
							</a>
							<!-- 자동으로 가져오기 때문에 getter,setter 없으면 못쓴다. -->
							<c:forEach var="cashInfo" items="${list}">
								<!-- 날짜와 cashInfo가 맞는 경우만 츌력 -->
								<c:if test="${dateNum == fn:substring(cashInfo.cashbookDate, 8,10) }">
									<div>
										<!-- 수입인 경우 + -->
										<c:if test="${cashInfo.category=='수입'}">										
											<span style="color:blue">+${cashInfo.price}	</span>
										</c:if>
										<!-- 지출인 경우 - -->
										<c:if test="${cashInfo.category=='지출'}">										
											<span style="color:red">-${cashInfo.price}</span>
										</c:if>
									</div>
								</c:if>
							</c:forEach>
						</td>
					</c:if>					
					<!--빨간색이 아닌 날 -->
					<c:if test="${i % 7 != 0}">
						<td>
							<a href="${pageContext.request.contextPath}/calendarOne?targetYear=${targetYear}&targetMonth=${targetMonth-1}&targetDay=${dateNum}">	
								<p class="text-body">${dateNum}</p>
							</a>
							<!-- 자동으로 가져오기 때문에 getter,setter 없으면 못쓴다. -->
							<c:forEach var="cashInfo" items="${list}">
								<!-- 날짜와 cashInfo가 맞는 경우만 츌력 -->
								<c:if test="${dateNum == fn:substring(cashInfo.cashbookDate, 8,10) }">
									<div>
										<!-- 수입인 경우 + -->
										<c:if test="${cashInfo.category=='수입'}">										
											<span style="color:blue">+${cashInfo.price}	</span>
										</c:if>
										<!-- 지출인 경우 - -->
										<c:if test="${cashInfo.category=='지출'}">										
											<span style="color:red">-${cashInfo.price}</span>
										</c:if>
									</div>
								</c:if>
							</c:forEach>		
						</td>						
					</c:if>					
				</c:if>
				<!-- 날짜 범위 밖은 빈 칸 -->
				<c:if test="${!(dateNum > 0 && dateNum <= lastDate)}">
					<td></td>
				</c:if>
			</c:forEach>
		</tr>
	</table>
                
                </div>
                </div>
            </div>
          </div>
        </section>
        
        
        
        <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Titan</h5>
                  <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                  <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                  <p>Email:<a href="#">somecompany@example.com</a></p>
                </div>
              </div>

            </div>
          </div>
        </div>
        
        
        
        
        
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
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
  </body>
</html>