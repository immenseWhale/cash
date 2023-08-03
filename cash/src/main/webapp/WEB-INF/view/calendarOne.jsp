<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!-- jsp 파일 컴파일시 자바코드로 변환되는 c:..(제어문) 커스텀 태그 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendarOne.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	
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
                <h1 class="module-title font-alt mb-0">Detailed Cashbook</h1>
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
			            <h4 class="font-alt mb-0">가계부 상세</h4>
			          </div>
			        </div>
					<div class="row" align="center">	            
						<hr class="divider-w mt-10 mb-20">
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>No</th>
								<th>Date</th>
								<th>Price</th>
								<th>Memo</th>
								<th>Hash Tag</th>
								<th>Createdate</th>
								<th>Updatedate</th>
								<th> </th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${mapList}">
								<tr>
									<td>${m.cashbookNo}</td>		
									<td>${m.cashbookDate}</td>		
									<td>
										<c:if test="${m.category == '수입'}"><span>+${m.price}</span></c:if>
										<c:if test="${m.category == '지출'}"><span>-${m.price}</span></c:if>                     
									</td>   	
									<td>${m.memo}</td>	
									<td>${m.word}</td>		
									<td>${m.createdate}</td>		
									<td>${m.updatedate}</td>		
									<td>
										<form action="${pageContext.request.contextPath}/removeCashOne" method="post">
											<input type="hidden" name="cashbookNo" value="${m.cashbookNo}">
											<button type="submit">삭제</button>
										</form>
									</td>			
								</tr>
							</c:forEach>
						</tbody>					
					</table>
<!-------------------------- 비회원인 경우 쓰기 불가 -------------------------->
					<form action="${pageContext.request.contextPath}/addCashbook" method="get">
						<input type="hidden" name="targetYear" value="${targetYear}">
						<input type="hidden" name="targetMonth" value="${targetMonth + 1}">
						<input type="hidden" name="targetDay" value="${targetDay}">
						<button type="submit" id="writeButton">쓰기</button>
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
<script>

// memberId 가져오기
let memberId = '<%= session.getAttribute("loginMember") %>';
let targetYear = '<%= session.getAttribute("targetYear") %>';
let targetMonth = '<%= session.getAttribute("targetMonth") %>';
let targetDay = '<%= session.getAttribute("targetDay") %>';

console.log('calendarOne memberId : ' + memberId);
console.log('calendarOne targetYear : ' + targetYear);
console.log('calendarOne targetMonth : ' + targetMonth);
console.log('calendarOne targetDay : ' + targetDay);
// 쓰기 버튼 클릭 시 이벤트 처리
	$(document).ready(function() {

		$('#writeButton').click(function() {
			// memberId가 null, 공백인 경우 알림창 표시
			if (!memberId || memberId == "") {
				alert('로그인 후 사용 가능합니다. 로그인 페이지로 이동합니다.');
				window.location.href = '<%= request.getContextPath() %>/login'; // 로그인 페이지로 이동
			} else {
				// memberId가 존재하는 경우, 쓰기 페이지로 이동
				window.location.href = '<%= request.getContextPath() %>/addCashbook?targetYear=' + targetYear + '&targetMonth=' + targetMonth + '&targetDay=' + targetDay;
			}
 		});
	});
</script>

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