package web.main.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.vo.MemberVO;

public class SelectTimeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Object obj = request.getSession().getAttribute("mvo");
		MemberVO mvo = null;
		if( obj != null) {
			 mvo = (MemberVO)obj;
		}
		
		if( mvo != null) {
			return"jsp/reservation/selectTime.jsp";
		}else {
			request.getSession().setAttribute("loginErrorMessage", "로그인이 필요한 서비스입니다.");
			return "jsp/login/login_1.jsp";
		}
		
	}
	
}
