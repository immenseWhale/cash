package cash.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import cash.model.HashtagDao;

@WebServlet("/getChartData")
public class RestApiController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//session 인증 검사
		HttpSession session = request.getSession();
		String memberId = null;

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공 <-- RestApiController");
			memberId = (String)session.getAttribute("loginMember");
		}

		//view에 넘겨줄 달력 정보(달력 관련 모델값)
		Calendar firstDay = Calendar .getInstance();		//오늘 날짜
		
		//출력하고자 하는 년도,월,일의 기본값은 이번달 1일
		int targetYear = firstDay.get(Calendar.YEAR);
		int targetMonth = firstDay.get(Calendar.MONTH);		
		firstDay.set(Calendar.DATE,1);							//달력의 1일
		System.out.println(targetYear + "<--targetYear-- RestApiController " );
		System.out.println(targetMonth + "<--targetMonth-- RestApiController " );

		//출력하고자하는 년도와 월이 매개값으로 넘어왔다면
		if(request.getParameter("targetYear") !=null 
		&& request.getParameter("targetMonth") !=null){
			targetYear = Integer.parseInt(request.getParameter("targetYear"));
			targetMonth = Integer.parseInt(request.getParameter("targetMonth"));
			firstDay.set(Calendar.YEAR,targetYear);							//달력의 1일
			//API에서 자동으로 targetMonth:12->1 Year+1 달이 넘어가면 해가 변동되는걸 처리해준다.
			firstDay.set(Calendar.MONTH,targetMonth);							//달력의 1일
			//변동 된 달력을 새로 받아온다
			targetYear = firstDay.get(Calendar.YEAR);
			targetMonth = firstDay.get(Calendar.MONTH);
		}
		
        List<Map<String, Object>> htList = new HashtagDao().selectWordCountByMonth(memberId, targetYear, targetMonth+1);
        System.out.println(htList.size() +"<--htList.size()-- CalendarController " );
        
        // JSON 형식의 응답을 설정
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Gson을 사용하여 List를 JSON 형식의 문자열로 변환
        Gson gson = new Gson();
        String jsonStr = gson.toJson(htList);
        System.out.println(jsonStr+"<--jsonStr-- CalendarController " );

        out.print(jsonStr); // JSON 응답을 출력
        out.flush(); // 출력 버퍼 비우기
		
	}
}
