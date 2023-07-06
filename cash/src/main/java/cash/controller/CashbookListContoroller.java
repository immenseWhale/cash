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
		String memberId = null;

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공");
			memberId = (String)session.getAttribute("loginMember");
		}

		
		//모델 호출
		CashbookDao cashbookDao = new CashbookDao();
		
		//매개값 받기
		int currentPage = 1;		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		String word = null;
		if(request.getParameter("word") != null) {
			word = request.getParameter("word");
			request.setAttribute("word", word);
		}
		

		int rowPerPage = 3;
		int beginRow = (currentPage - 1) * rowPerPage;

		int endRow = beginRow + (rowPerPage - 1);
		int totalRow = cashbookDao.hashtagCashbookRow(memberId, word);
		//endRow가 실제 totalRow보다 크다면 불러온 totalRow를 넣어줘야 더 넘어가지 않고 멈춘다.
		if(endRow>totalRow){
			endRow = totalRow;
		}
		//페이지 네비게이션 페이징
		int pagePerPage=3;
		
		int lastPage = totalRow / rowPerPage;
		//마지막 페이지는 딱 나누어 떨어지지 않으니까 몫이 0이 아니다 -> +1
		if(totalRow % rowPerPage != 0){
			lastPage += 1;
		}
		int minPage = ((currentPage - 1) / pagePerPage ) * pagePerPage + 1;
		int maxPage = minPage + (pagePerPage - 1 );
		//maxPage 가 last Page보다 커버리면 안되니까 lastPage를 넣어준다
		if (maxPage > lastPage){
			maxPage = lastPage;
		}
		
		
		List<Cashbook> list = cashbookDao.selectCashbookListByTag(memberId, word, beginRow, rowPerPage);
		
		request.setAttribute("list", list);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("lastPage", lastPage);
        request.setAttribute("minPage", minPage);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("pagePerPage", pagePerPage);
		
		request.getRequestDispatcher("WEB-INF/view/cashbookListByTag.jsp").forward(request, response);		
	}
}
