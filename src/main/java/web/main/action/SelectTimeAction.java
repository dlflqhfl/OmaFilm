package web.main.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.vo.MemberVO;

public class SelectTimeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return"jsp/reservation/selectTime.jsp";
		
	}
	
}
