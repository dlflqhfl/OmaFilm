package main.java.web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.inquiryDAO;
import web.mybatis.vo.InquiryVO;
import web.mybatis.vo.IqCommentVO;

public class InquiryViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String iq_idx = request.getParameter("iq_idx"); 
		System.out.println(iq_idx);
		
		InquiryVO ivo =inquiryDAO.inquiryIdx(iq_idx);
		
		IqCommentVO comment=inquiryDAO.inquiryComment(iq_idx);
		System.out.println("제발:"+comment);
		
		request.setAttribute("ivo", ivo);
		request.setAttribute("comment", comment);
		
		return "jsp/myPage/inquiryContent.jsp";
	}


}
