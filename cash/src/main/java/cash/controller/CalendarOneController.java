package cash.controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cash.vo.*;
import cash.model.*;


@WebServlet("/calendarOne")
public class CalendarOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 인증 검사
		HttpSession session = request.getSession();
		String memberId = null;

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공");
			memberId = (String)session.getAttribute("loginMember");
		}
		int targetYear =0;
		int targetMonth=0;
		int targetDay = 0;
		if(request.getParameter("targetYear") != null) {
			targetYear = Integer.parseInt(request.getParameter("targetYear") );
			System.out.println(targetYear + "<--targetYear-- CalendarOneController");
		}else {
			response.sendRedirect(request.getContextPath()+"/calendar");
			return;
		}
		if(request.getParameter("targetMonth") != null) {
			targetMonth =  Integer.parseInt(request.getParameter("targetMonth") )+1;
			System.out.println(targetMonth + "<--targetMonth-- CalendarOneController");
		}else {
			response.sendRedirect(request.getContextPath()+"/calendar");
			return;
		}
		if(request.getParameter("targetDay") != null) {
			targetDay =  Integer.parseInt(request.getParameter("targetDay") );
			System.out.println(targetDay + "<--targetDay-- CalendarOneController");
		}else {
			response.sendRedirect(request.getContextPath()+"/calendar");
			return;
		}
		
		
		//dao호출
		CashbookDao cashbookDao = new CashbookDao();
		
		//	GROUP_CONCAT 을 이용하여 해시태그까지 출력
		List<HashMap<String, Object>> mapList = cashbookDao.cashbookOneList(memberId, targetYear, targetMonth+1, targetDay);
		//System.out.println(mapList + "<--mapList-- CalendarOneController");

		//뷰에 값 넘기기(request 속성)
		request.setAttribute("mapList", mapList);	
		request.setAttribute("targetYear", targetYear);		
		request.setAttribute("targetMonth", targetMonth);		
		request.setAttribute("targetDay", targetDay);			

		//calendarOne을 출력하는 뷰
		request.getRequestDispatcher("/WEB-INF/view/calendarOne.jsp").forward(request, response);
		
	}	
}
