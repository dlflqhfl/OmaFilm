package web.main.action;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.InquiryVO;

public class AdminCommentAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String iq_idxStr = request.getParameter("iq_idx");
		System.out.println(iq_idxStr+"값입니다");
		
        // iq_idx를 int로 변환
        int iq_idx = Integer.parseInt(iq_idxStr);

        // iq_idx를 기반으로 문의 세부사항을 가져옴
        AdminDAO inquiryDAO = new AdminDAO();
        InquiryVO inquiry = inquiryDAO.getInquiry(iq_idx);
        
        //iq_idxStr
        

        request.setAttribute("inquiry", inquiry);
        System.out.println("ACTION 테스트1");

        return "jsp/admin/adminComment.jsp";
	}
}
