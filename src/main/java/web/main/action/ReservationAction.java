package web.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "jsp/reservation/reservation.jsp";
	}

}
