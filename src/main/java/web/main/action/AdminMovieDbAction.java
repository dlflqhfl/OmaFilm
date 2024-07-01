package web.main.action;

import web.main.util.Paging;
import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.ScreeningScheduleVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMovieDbAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		//페이징 처리를 위한 객체생성
		Paging page = new Paging(5, 3);

		String cPage = request.getParameter("cPage");

		//전체페이지 수를 구하기
		page.setTotalRecode(AdminDAO.getCount());

		request.setAttribute("page", page);
		MovieListVO[] ar = AdminDAO.selectMovieList(page.getBegin(),page.getEnd());

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