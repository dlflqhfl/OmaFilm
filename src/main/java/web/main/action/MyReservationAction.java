package web.main.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.mybatis.dao.MyReservationDAO;
import web.mybatis.dao.PaymentDAO;
import web.mybatis.vo.IssuedCouponVO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.ReservationVO;

public class MyReservationAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		//Date date = new Date();
		//입력받은 월, 기본값 당월
		//String yearAndMonth = String.valueOf(date.getYear()) + "-" +String.valueOf(date.getMonth());
		if(mvo == null) {
			System.out.println("나의 예매 내역을 조회하기 위해선 로그인이 필요합니다.");
			return "index.jsp";
		}
		
		String month = request.getParameter("month");
		
		if(month!=null) { //월 입력값이 있을 때
			//당월 예매 내역 조회 -> list로 띄우기
			ReservationVO[] rvo = MyReservationDAO.getReservationList(mvo.getU_code(), month); 
			request.setAttribute("rvo", rvo);
			
			//당월 예매 취소 내역 -> list로 띄우기
			ReservationVO[] rvo_cancel = MyReservationDAO.getCancelList(mvo.getU_code(), month); 
			request.setAttribute("rvo_cancel", rvo_cancel);
		}else { //월 입력값이 없을 때 -> 모든 값
			ReservationVO[] rvo = MyReservationDAO.getAllList(mvo.getU_code()); 
			request.setAttribute("rvo", rvo);
			
			ReservationVO[] rvo_cancel = MyReservationDAO.getAllCancel(mvo.getU_code()); 
			request.setAttribute("rvo_cancel", rvo_cancel);
		}
		
		//예매 취소하기
		return "/jsp/myReservation/myReservation.jsp";
	}

}
