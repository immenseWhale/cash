package cash.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cash.vo.*;
import cash.model.*;


@WebServlet("/addCashbook")
public class AddCashbookController extends HttpServlet {
	//입력 폼으로
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	

		//session 인증 검사
		HttpSession session = request.getSession();
		String memberId = "test1";

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공");
			memberId = (String)session.getAttribute("loginMember");
		}
		
		//request 매개값
		int targetYear =0;
		int targetMonth=0;
		int targetDay = 0;
		if(request.getParameter("targetYear") != null) {
			targetYear = Integer.parseInt(request.getParameter("targetYear") );
			System.out.println(targetYear + "<--targetYear-- CalendarOneController");
		}
		if(request.getParameter("targetMonth") != null) {
			targetMonth =  Integer.parseInt(request.getParameter("targetMonth") );
			System.out.println(targetMonth + "<--targetMonth-- CalendarOneController");
		}
		if(request.getParameter("targetDay") != null) {
			targetDay =  Integer.parseInt(request.getParameter("targetDay") );
			System.out.println(targetDay + "<--targetDay-- CalendarOneController");
		}

		request.setAttribute("targetYear", targetYear);		
		request.setAttribute("targetMonth", targetMonth);		
		request.setAttribute("targetDay", targetDay);			
		//나머지 데이터는 입력 폼에서 사용자가 입력

		request.getRequestDispatcher("/WEB-INF/view/addCashbook.jsp").forward(request, response);
		
	}

	//액션
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		//session 인증 검사
		HttpSession session = request.getSession();
		String memberId = "test1";

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공");
			memberId = (String)session.getAttribute("loginMember");
		}
		
		
		int targetYear =0;
		int targetMonth=0;
		int targetDay = 0;
		int price = 0;
		if(request.getParameter("targetYear") != null) {
			targetYear = Integer.parseInt(request.getParameter("targetYear") );
			System.out.println(targetYear + "<--targetYear-- AddCashbookController");
		}
		if(request.getParameter("targetMonth") != null) {
			targetMonth =  Integer.parseInt(request.getParameter("targetMonth") );
			System.out.println(targetMonth + "<--targetMonth-- AddCashbookController");
		}
		if(request.getParameter("targetDay") != null) {
			targetDay =  Integer.parseInt(request.getParameter("targetDay") );
			System.out.println(targetDay + "<--targetDay-- AddCashbookController");
		}
		if (request.getParameter("price") != null) {
			price = Integer.parseInt(request.getParameter("price"));
			System.out.println(price + "<--price-- AddCashbookController");
		}

		String category=null;
		String cashbookDate=null;
		String memo =null;
		if(request.getParameter("category") != null) {
			category =  request.getParameter("category");
			System.out.println(category + "<--category-- AddCashbookController");
		}
		if(request.getParameter("cashbookDate") != null) {
			cashbookDate =  request.getParameter("cashbookDate");
			System.out.println(cashbookDate + "<--cashbookDate-- AddCashbookController");
		}
		if(request.getParameter("memo") != null) {
			memo =  request.getParameter("memo");
			System.out.println(memo + "<--memo-- AddCashbookController");
		}

		//request 매개값으로 채워준다
		Cashbook cashbook = new Cashbook(0, memberId, category, cashbookDate, memo, price, null,null);
		
		
		CashbookDao cashbookDao = new CashbookDao();
		
		int cashbookNo = cashbookDao.insertCashbook(cashbook);
		if(cashbookNo == 0) {
			System.out.println(cashbookDao + "<--Pk값-- 입력실패 AddCashbookController");
			response.sendRedirect(request.getContextPath()+"/addCashbook");
			return;
		}else {
			cashbook.setCashbookNo(cashbookNo);
		}
		
		//입력 성공시 -> 해시태그가 있다면 해시태그 추출 후 해시태그 입력 (반복문)
		/*
		해시태그 추출 알고리즘
		# #구디 #구디 #자바 
		#을 공백#으로 바꿔주면 해결된다
		 */
		HashtagDao hashtagDao = new HashtagDao();
		
		String memo2 = memo.replace("#", " #");		//#을 공백#으로 바꿔준다 -> #구디#아카데미 -> #구디 #아카데미
		
								//공백으로 만든 배열까지
		for(String ht : memo2.split(" ")) {
			String ht2 = ht.replace("#", ""); 	//#이라는 글자를 없앤다.
			if(ht2.length()>0) {					//0글자는 의미 없기 떄문에
				Hashtag hashtag = new Hashtag();
				hashtag.setCashbookNo(cashbookNo);
				hashtag.setWord(ht2);
				hashtagDao.insertHashtag(hashtag);
			}
		}

		response.sendRedirect(request.getContextPath()+"/calendar");
	}

}
