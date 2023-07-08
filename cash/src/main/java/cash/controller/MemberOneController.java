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

@WebServlet("/memberOne")
public class MemberOneController extends HttpServlet {
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 유효검사 (null일 때만 통과)
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginMember");
		
		if (memberId == null) {
			//로그인 되지 않은 경우, 로그인 페이지로 리다이렉트
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		//모델값 구하기 dao
		MemberDao memberDao = new MemberDao();
		Member member = memberDao.selectMemberOne(memberId);
		//member 출력하는(포워딩대상) memberOne.jsp에도 공유되어야 한다. request가 공유되니까 request 안에 넣어서 공유한다.
		String cutPw = (member.getMemberpw()).substring(0,6);
		//System.out.println(cutPw +"<--cutPw-- MemberOneController");
		member.setMemberpw(cutPw);
		request.setAttribute("member", member);
		System.out.println(request.getAttribute("member") +"<--getAttribute member-- MemberOneController");
		
		
		//memberOne.jsp를 보여줄거다 - 포워딩
		request.getRequestDispatcher("/WEB-INF/view/memberOne.jsp").forward(request, response);
	}

}
