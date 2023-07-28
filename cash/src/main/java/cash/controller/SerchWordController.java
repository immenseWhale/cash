package cash.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cash.model.CashbookDao;

@WebServlet("/serchResultPage")
public class SerchWordController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//session 인증 검사
		HttpSession session = request.getSession();
		String memberId = null;

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공 <-- serchResultPage");
			memberId = (String)session.getAttribute("loginMember");
		}
		
		String serchString = null;
		//검색어 변수 선언, 받아오기
		if(request.getParameter("serchString") !=null ) {
			serchString = request.getParameter("serchString");
		}
		
		
		//모델 호출
		CashbookDao cashbookDao = new CashbookDao();
		
		//서치리스트 호출
		List<HashMap<String, Object>> serchList = cashbookDao.SerchSelectJoin(memberId, serchString);
		
		//값 뷰어로 넘기기
		request.setAttribute("serchList", serchList);
		request.setAttribute("serchWord", serchString);		
		
		//뷰 포워딩
		request.getRequestDispatcher("/WEB-INF/view/serchResultPage.jsp").forward(request, response);

	}

}
