package web.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.inquiryDAO;
import web.mybatis.vo.InquiryVO;

public class InquiryAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String text = request.getParameter("inquiryTitle");
		
		int countTitle = inquiryDAO.totalCountTitle(text); 
        request.setAttribute("countTitle", countTitle); 
		
		InquiryVO[] list = inquiryDAO.inquiryList(text);
		request.setAttribute("ivo", list);
		
		return "jsp/myPage/inquiry.jsp";
	}

}
