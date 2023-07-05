package cash.controller;

import java.io.IOException;
import java.util.*;
import cash.model.*;
import cash.vo.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/calendar")
public class CalendarController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//session 인증 검사
		HttpSession session = request.getSession();
		String memberId = null;

		if(session.getAttribute("loginMember") != null) {
			System.out.println("로그인 성공 <-- CalendarController");
			memberId = (String)session.getAttribute("loginMember");
		}

		//view에 넘겨줄 달력 정보(달력 관련 모델값)
		Calendar firstDay = Calendar .getInstance();		//오늘 날짜
		
		//출력하고자 하는 년도,월,일의 기본값은 이번달 1일
		int targetYear = firstDay.get(Calendar.YEAR);
		int targetMonth = firstDay.get(Calendar.MONTH);		
		firstDay.set(Calendar.DATE,1);							//달력의 1일
		System.out.println(targetYear + "<--targetYear-- CalendarController " );
		System.out.println(targetMonth + "<--targetMonth-- CalendarController " );

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
		
		//달력출력시 시작 공백(1일 이전의 빈칸)
		int beginBlank = firstDay.get(Calendar.DAY_OF_WEEK)-1;		//1일 날짜의 요일(일1,월2,,,토6) -1
		//System.out.println(beginBlank + "<--beginBlank-- CalendarController " );
		
		int lastDate = firstDay.getActualMaximum(Calendar.DATE);
		//System.out.println(lastDate + "<--lastDate-- CalendarController " );
		
		//출력되는 월의 마지막 날짜 출력 후 공백 -> 전체 출력 셀의 개수가 7로 나누어 떨어져야한다
		int endBlank = 0;
		if( ((beginBlank + lastDate) % 7 ) != 0 ){
			endBlank = 7 - ((beginBlank+lastDate) % 7);
		}
		int totalCell = beginBlank + lastDate + endBlank;
		//System.out.println(endBlank + "<--endBlank-- CalendarController " );
		//System.out.println(totalCell + "<--totalCell-- CalendarController " );
		
		//모델을 호출(DAO 타겟 월의 수입/지출 데이터)
		List<Cashbook> list = new CashbookDao().selectCashbookListByMonth(memberId, targetYear, targetMonth+1);		
		//System.out.println(list + "<--list-- CalendarController " );
		
		List<Map<String, Object>> htList = new HashtagDao().selectWordCountByMonth(targetYear, targetMonth+1);
		//System.out.println(htList.size() +"<--htList.size()-- CalendarController " );
		
		//뷰에 값 넘기기(request 속성)
		request.setAttribute("targetYear", targetYear);
		request.setAttribute("targetMonth", targetMonth);
		request.setAttribute("beginBlank", beginBlank);
		request.setAttribute("lastDate", lastDate);
		request.setAttribute("totalCell", totalCell);
		request.setAttribute("endBlank", endBlank);
		
		request.setAttribute("list", list);
		request.setAttribute("htList", htList);;
		
		
		//달력을 출력하는 뷰
		request.getRequestDispatcher("/WEB-INF/view/calendar.jsp").forward(request, response);
		
		
		
	}


}
