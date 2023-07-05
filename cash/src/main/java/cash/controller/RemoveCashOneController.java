package cash.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cash.model.*;


@WebServlet("/removeCashOne")
public class RemoveCashOneController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//session 인증 검사
		HttpSession session = request.getSession();
		String memberId = null;

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공 <-- RemoveCashOneController");
			memberId = (String)session.getAttribute("loginMember");
		}else {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		
		int cashbookNo = 0;
		if(request.getParameter("cashbookNo") != null) {
			cashbookNo =  Integer.parseInt(request.getParameter("cashbookNo"));
			System.out.println(cashbookNo + "<--cashbookNo-- RemoveCashOneController");
		}else {
			// 현재 요청의 Referer 헤더를 통해 이전 페이지의 URL을 가져옵니다.
			String previousPage = request.getHeader("Referer");

			// 이전 페이지가 있는 경우에만 리다이렉트
			if (previousPage != null && !previousPage.isEmpty()) {
			    // 이전 페이지로 리다이렉트
			    response.sendRedirect(previousPage);
			} else {
				// 이전 페이지가 없는 경우
				response.sendRedirect(request.getContextPath() + "/login");
			}
		}
		
		//모델 호출
		CashbookDao cashbookDao = new CashbookDao();
		HashtagDao hashtagDao= new HashtagDao();
		
		//cashbook_no로 cashbook 테이블에서 삭제, 이후 hashtag에서 삭제
		hashtagDao.deleteHashtagByNo(cashbookNo);
		int row = cashbookDao.deleteCashbookByNo(cashbookNo);
		
		//row가 1이면 성공적으로 cashbook 컬럼 삭제
		if (row == 1) {
		    // 삭제 성공한 경우 JavaScript로 알림 창을 띄우고 페이지를 리다이렉트합니다.
		    String alertScript = "<script>alert('삭제되었습니다.'); window.location.href='" + request.getContextPath() + "/calendar';</script>";
		    response.getWriter().println(alertScript);
		} else {
		    System.out.println("실패 <-- RemoveCashOneController");
		    response.sendRedirect(request.getContextPath() + "/calendar");
		}

		
	}
}
