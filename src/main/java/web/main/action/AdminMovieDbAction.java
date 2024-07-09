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
	
		String searchValue = request.getParameter("searchData");
		MovieListVO[] ar = AdminDAO.selectMovieList(searchValue);
		System.out.println(ar);

		
		request.setAttribute("ar", ar);

		String movieCd = request.getParameter("movieCd");
		System.out.println("d11d" + movieCd);
		String name = request.getParameter("nameData");
		String date = request.getParameter("dateData");
		String time = request.getParameter("timeData");
		String delete = request.getParameter("delete");
		ScreeningScheduleVO sc = new ScreeningScheduleVO();
		StringBuffer sb = new StringBuffer();
		sb.append(date);
		sb.append(" ");
		sb.append(time);
		
		System.out.println("날짜 "+sb.toString());
		sc.setMovieCd(movieCd);
		sc.setT_name(name);
		sc.setSs_time(sb.toString());

		if( movieCd != null && delete == null && date != null && time != null ) {
			int res = AdminDAO.insertScreen(sc);
			return "jsp/admin/adminMovieDB.jsp";
		}
		
		//rvo 페이징 처리
		Paging page = new Paging(10,5);
		
		String cPage = request.getParameter("cPage");
		if(ar !=null)
			page.setTotalRecode(ar.length);
		if(cPage !=null)
			page.setNowPage(Integer.parseInt(cPage));
		else
			page.setNowPage(1);
		request.setAttribute("page", page);
		 
		
		return "jsp/admin/adminMovieDB.jsp";
	}


}