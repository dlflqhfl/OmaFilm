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
		
		String searchValue = request.getParameter("searchData");
		System.out.println("검색어" + searchValue);
		//전체페이지 수를 구하기
		page.setTotalRecode(AdminDAO.getCount());
		
		if( cPage != null){
			page.setNowPage(Integer.parseInt(cPage));
		} else {
			page.setNowPage(1);
		}
		
		System.out.println("시작"+page.getBegin());
		System.out.println("끝"+page.getEnd());
		System.out.println("총"+page.getTotalRecode());
		
		
		MovieListVO[] ar = AdminDAO.selectMovieList(page.getBegin(),page.getEnd(),searchValue);
		System.out.println(ar);

		request.setAttribute("page", page);
		request.setAttribute("ar", ar);

		String movieCd = request.getParameter("movieCd");
		String name = request.getParameter("nameData");
		String date = request.getParameter("dateData");
		String time = request.getParameter("timeData");

		ScreeningScheduleVO sc = new ScreeningScheduleVO();
		StringBuffer sb = new StringBuffer();
		sb.append(date);
		sb.append(" ");
		sb.append(time);
		
		System.out.println("날짜 "+sb.toString());
		sc.setMovieCd(movieCd);
		sc.setT_name(name);
		sc.setSs_time(sb.toString());

		if( movieCd != null) {
			int res = AdminDAO.insertScreen(sc);
		}

		return "jsp/admin/adminMovieDB.jsp";
	}


}