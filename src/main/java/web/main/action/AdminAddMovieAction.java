package web.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminAddMovieAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		return "jsp/admin/adminAddMovie.jsp";
	}

}
