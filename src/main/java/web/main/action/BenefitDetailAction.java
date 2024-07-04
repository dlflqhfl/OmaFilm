package web.main.action;

import web.mybatis.dao.BenefitsDAO;
import web.mybatis.vo.NoticeVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BenefitDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String n_idx = request.getParameter("n_idx");
		
		NoticeVO bvo = BenefitsDAO.view(n_idx);
		
		request.setAttribute("bvo", bvo);
		
		return "jsp/event/benefitdetail.jsp";

	}

}
