package web.main.action;

import web.mybatis.dao.EventDAO;
import web.mybatis.vo.NoticeVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EventDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String n_idx = request.getParameter("n_idx");
		
		
		NoticeVO evo = EventDAO.view(n_idx);
		
		request.setAttribute("evo", evo);
		
		return "/jsp/event/eventdetail.jsp";

	}

}
