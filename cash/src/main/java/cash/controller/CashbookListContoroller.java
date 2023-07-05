package cash.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cash.model.*;
import cash.vo.*;
import java.util.*;



@WebServlet("/cashbookListByTag")
public class CashbookListContoroller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 인증 검사
		HttpSession session = request.getSession();
		String memberId = "test1";

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공");
			memberId = (String)session.getAttribute("loginMember");
		}
		//매개값 받기
		String word = null;
		if(request.getParameter("word") != null) {
			word = request.getParameter("word");
		}
		int beginRow =0;
		int rowPerPage =0;		
		if(request.getParameter("beginRow") !=null 
		&& request.getParameter("rowPerPage") !=null){
			beginRow = Integer.parseInt(request.getParameter("beginRow"));
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		//모델 호출
		CashbookDao cashbookDao = new CashbookDao();
		
		List<Cashbook> list = cashbookDao.selectCashbookListByTag(memberId, word, beginRow, rowPerPage);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("WEB-INF/view/cashbookListByTag.jsp").forward(request, response);		
	}
}
