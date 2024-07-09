package web.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.main.util.Paging;
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

		//rvo 페이징 처리
  		Paging page = new Paging(10,5);
  		
  		String cPage = request.getParameter("cPage");
  		if(inquiryList !=null)
  			page.setTotalRecode(inquiryList.size());
  		if(cPage !=null)
  			page.setNowPage(Integer.parseInt(cPage));
  		else
  			page.setNowPage(1);
  		request.setAttribute("page", page);
		
		return "jsp/admin/adminInquiry.jsp";
	}

	
}
