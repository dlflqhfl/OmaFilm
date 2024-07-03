package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.MovieListDAO;
import web.mybatis.vo.MovieListVO;

public class MovieDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String movieCd = request.getParameter("movieCd");
		MovieListVO mvo = MovieListDAO.getMovieVO(movieCd);
		request.setAttribute("mvo", mvo);
		
		return "jsp/movie/movieDetail.jsp";
	}

}
