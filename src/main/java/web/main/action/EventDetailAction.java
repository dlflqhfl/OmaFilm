package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.EventDAO;
import web.mybatis.vo.NoticeVO;

public class EventDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String n_idx = request.getParameter("n_idx");
		
		
		NoticeVO evo = EventDAO.view(n_idx);
		
		request.setAttribute("evo", evo);
		
		return "/jsp/event/eventdetail.jsp";

	}

}
