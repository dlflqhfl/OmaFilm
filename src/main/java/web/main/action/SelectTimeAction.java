package web.main.action;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.ReservationDAO;
import web.mybatis.vo.ScreeningScheduleVO;

public class SelectTimeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String text = request.getParameter("text");
		String movieName = request.getParameter("movieName");
		String date = request.getParameter("date");
		if( text != null) {
			System.out.println("영화제목 들어옴" + text);
			
			ScreeningScheduleVO[] list = ReservationDAO.selectText(text);
			request.setAttribute("list", list);
			return "jsp/reservation/selectTimeText.jsp";
		} else if( movieName != null && date != null) {
			Map<String, String> map = new HashMap<>();
			map.put("movieName", movieName);
			map.put("date", date);
			String[] list = ReservationDAO.selectTime(map);
			request.setAttribute("time", list);
			
			return "jsp/reservation/selectTimeMovieTime.jsp";
		}
		
		
		return "jsp/reservation/selectTime.jsp";
	}
	
}
