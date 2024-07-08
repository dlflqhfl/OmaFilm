package main.java.web.main.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.ReservationDAO;
import web.mybatis.vo.ReservationVO;
import web.mybatis.vo.ScreeningScheduleVO;
import web.mybatis.vo.SelectSeatVO;

public class ReservationAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String text = request.getParameter("text");
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		System.out.println("영화제목"+text);

		ScreeningScheduleVO sc = new ScreeningScheduleVO();
		sc.setT_name(text);
		StringBuffer sb = new StringBuffer();
		sb.append(date);
		sb.append(" ");
		sb.append(time);
		sc.setSs_time(sb.toString());
		System.out.println(sb.toString());

		ScreeningScheduleVO ssvo = ReservationDAO.selectScreen(sc);
		System.out.println("ssvo" + ssvo);

		SelectSeatVO[] svo = null;
		if( ssvo != null) {
			svo = ReservationDAO.ticketing(ssvo);
			if( svo != null) {
				request.setAttribute("svo", svo);
				for (SelectSeatVO ss : svo) {
					System.out.println("좌석" + ss.getS_code());
				}
			}
		}

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