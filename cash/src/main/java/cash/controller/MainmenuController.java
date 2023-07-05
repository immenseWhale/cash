package cash.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mainmenu")
public class MainmenuController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MainmenuController doGet method");

	    // session 인증 검사
	    HttpSession session = request.getSession();

	    if (session.getAttribute("loginMember") != null) {
	        System.out.println("로그인 성공 <-- MainmenuController");
	        
	        // 세션에 popupShown 속성이 없으면 팝업을 띄우고, 속성을 설정하여 다음에는 팝업이 뜨지 않도록 합니다.
	        if (session.getAttribute("popupShown") == null) {
		        System.out.println("popupShown이 null <-- MainmenuController");
	            session.setAttribute("popupShown", true);
	            request.setAttribute("showPopup", true);
	        } else {
		        System.out.println("popupShown is not null <-- MainmenuController");
	            request.setAttribute("showPopup", false);
	        }
	    } else {
	        request.setAttribute("loginMember", false);
	    }

	    // 디버깅을 위한 코드
	    System.out.println("showPopup: " + request.getAttribute("showPopup"));

	    // 메인메뉴 뷰
	    request.getRequestDispatcher("/WEB-INF/view/inc/mainmenu.jsp").include(request, response);
	}
}

