package main.java.web.main.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNoticeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		return "jsp/admin/adminNotice.jsp";
	}

}
