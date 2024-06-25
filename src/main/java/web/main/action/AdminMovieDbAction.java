package web.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.ScreeningScheduleVO;

public class AdminMovieDbAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		MovieListVO[] ar = AdminDAO.selectMovieList();
		request.setAttribute("ar", ar);
		
		String movieCd = request.getParameter("movieCd");
		String name = request.getParameter("nameData");
		String date = request.getParameter("dateData");
		String time = request.getParameter("timeData");
		
		ScreeningScheduleVO sc = new ScreeningScheduleVO();
		sc.setMovieCd(movieCd);
		sc.setSs_date(date);
		sc.setSs_time(time);
		sc.setT_name(name);
		
		if( movieCd != null) {
			int res = AdminDAO.insertScreen(sc);
		}
		
		
		return "jsp/admin/adminMovieDB.jsp";
	}
	

}
