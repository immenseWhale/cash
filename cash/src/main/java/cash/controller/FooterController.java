package cash.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FooterController
 */
@WebServlet("/footer")
public class FooterController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		

	    // 메인메뉴 뷰
	    request.getRequestDispatcher("/WEB-INF/view/inc/footer.jsp").include(request, response);
	}

}
