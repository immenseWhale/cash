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
		
		//모델 호출
		List<HashMap<String, Object>> serchList = CashbookDao.SerchSelectJOin(serchString, serchString);

		
		
		//뷰 포워딩
		request.getRequestDispatcher("/WEB-INF/view/serchResultPage.jsp").forward(request, response);

	}

}
