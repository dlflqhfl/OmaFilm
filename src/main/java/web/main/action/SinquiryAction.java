package web.main.action;


import web.mybatis.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SinquiryAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Object obj = request.getSession().getAttribute("mvo");
		
		MemberVO mvo = (MemberVO)obj;
		
		if(mvo != null) {
			request.getSession().setAttribute("u_code", mvo.getU_code());
			return "/jsp/serviceCenter/inquiry.jsp";
		} else {
			request.getSession().setAttribute("loginErrorMessage", "로그인이 필요한 서비스입니다.");
			return "/jsp/login/login_1.jsp";
		}	
			
	}	   
}
