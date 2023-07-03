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
import com.google.gson.Gson;
import java.io.PrintWriter;

@WebServlet("/SelectMemberId")
public class SelectMemberIdController extends HttpServlet {
	
	//포스트 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// JSON 형식의 응답을 설정
		response.setContentType("application/json");
		PrintWriter out = response.getWriter(); // 응답을 출력하기 위한 PrintWriter 객체 생성
		
		String memberId = request.getParameter("memberId"); // 요청 파라미터에서 memberId 값 가져오기
		MemberDao dao = new MemberDao(); // MemberDao 객체 생성
		int result = dao.idCheck(memberId); // memberId 중복 체크 결과 반환 (1: 중복, 0: 중복 아님)
		System.out.println(result + "<--result-- seleectMemberIdController"); // 결과 출력 (콘솔 확인용)
		
		Gson gson = new Gson(); // Gson 객체 생성 (JSON 변환 라이브러리)
		String jsonStr = gson.toJson(result); // 결과를 JSON 형식의 문자열로 변환
		out.print(jsonStr); // JSON 응답을 출력
		out.flush(); // 출력 버퍼 비우기
	}
}
