package web.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.InquiryVO;

public class AdminInquiryAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		AdminDAO inquiry=new AdminDAO();
		String iq_none=request.getParameter("iq_none");
		List<InquiryVO> inquiryList= inquiry.getInquiryList(iq_none);
		System.out.println("ACTION 테스트");
		request.setAttribute("inquiryList", inquiryList);

		// TODO Auto-generated method stub
		return "jsp/admin/adminInquiry.jsp";
	}

	
}
