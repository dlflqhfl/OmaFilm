package web.main.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.mybatis.dao.ReservationDAO;
import web.mybatis.vo.ReserverVO;

public class NoReservationCheckAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String birth = request.getParameter("birth");
		String login = request.getParameter("res");
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		map.put("password", password);
		map.put("birth", birth);
		//map값 다 들어옴
		System.out.println(map);
		int res = ReservationDAO.loginNoReserver(map);
		
		if( name != null && email != null && password != null && birth != null) {
			if(res > 0) {
				request.setAttribute("res", res);
				System.out.println("로그인성공");
				request.getSession().setAttribute("info", map);
				return "jsp/reservation/noReserverSuccess.jsp";
			} else {
				System.out.println("로그인실패");
				return "jsp/login/login_2.jsp";
			}
		} else if ( login != null){
			System.out.println("들어옴");
			
			HttpSession session = request.getSession();
		    Map<String, String> userInfo = (Map<String, String>) session.getAttribute("info");
		    ReserverVO[] list = ReservationDAO.selectReserver(userInfo); 
		    request.setAttribute("list", list);
		    int cnt = ReservationDAO.selectCnt(userInfo);
		    System.out.println(cnt);
			request.setAttribute("cnt", cnt);
			return "jsp/reservation/noReservationCheck.jsp";
		}
		
		return null;
		
		
	}

}
