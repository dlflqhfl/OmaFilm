package web.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String text = request.getParameter("text");
		String path = "";
		
		if(text.equals("쌍용 1관")) {
			 path = "jsp/reservation/reservation.jsp";
		} else if(text.equals("쌍용 2관")) {
			path = "jsp/reservation/reservation1.jsp";
		} else if(text.equals("쌍용 3관")) {
			path = "jsp/reservation/reservation2.jsp";
		} else if(text.equals("쌍용 4관")) {
			path = "jsp/reservation/reservation3.jsp";
		} else if(text.equals("프리미엄 오경주관")) {
			path = "jsp/reservation/reservationP.jsp";
		}
		
		return path;
	}

}
