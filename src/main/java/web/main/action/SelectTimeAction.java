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
		String guan = request.getParameter("guan");
		String movieName = request.getParameter("movieName");
		String date = request.getParameter("date");
		if( text != null) {
			System.out.println("영화제목 들어옴" + text);
			ScreeningScheduleVO[] list = ReservationDAO.selectText();
			request.setAttribute("list", list);
			return "jsp/reservation/selectTimeText.jsp";
		} else if( movieName != null && date != null && guan != null) {
			System.out.println("영화제목 들어옴" + guan);
			System.out.println("영화제목 들어옴" + movieName);
			System.out.println("영화제목 들어옴" + date);
			Map<String, String> map = new HashMap<>();
			map.put("movieName", movieName);
			map.put("date", date);
			map.put("guan", guan);
			String[] list = ReservationDAO.selectTime(map);
			int res = 0;
			if( list != null && list.length > 0){
				int s_code = ReservationDAO.selectS_code(map);
				System.out.println(s_code);
				res = ReservationDAO.selectCount(s_code);
				System.out.println(res);
			}
			int total = ReservationDAO.selectSeatTotal(guan);
			
			if( guan.equals("쌍용 1관")) {
				request.setAttribute("total", total);
				request.setAttribute("count", res);
			} else if( guan.equals("쌍용 2관")) {
				request.setAttribute("total", total);
				request.setAttribute("count", res);
			} else if( guan.equals("쌍용 3관")) {
				request.setAttribute("total", total);
				request.setAttribute("count", res);
			} else if( guan.equals("쌍용 4관")) {
				request.setAttribute("total", total);
				request.setAttribute("count", res);
			}  else if( guan.equals("프리미엄 오경주관")) {
				request.setAttribute("count", res);
				request.setAttribute("total", total);
			}
			
			request.setAttribute("time", list);
			
			
			return "jsp/reservation/selectTimeMovieTime.jsp";
		}
		
		return "jsp/reservation/selectTime.jsp";
	}
	
}
