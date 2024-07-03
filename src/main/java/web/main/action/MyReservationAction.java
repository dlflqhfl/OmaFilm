package web.main.action;

import web.mybatis.dao.MyReservationDAO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.ReservationVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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

		String searchKey = request.getParameter("searchKey");
		if(searchKey!=null && searchKey.trim().length()<1) {
			searchKey=null;
		}

		String selectedMonth = request.getParameter("selectedMonth");
		if(selectedMonth!=null && selectedMonth.length()<1) {
			selectedMonth=null;
		}

		String cancelMonth = request.getParameter("cancelMonth");
		if(cancelMonth!=null && cancelMonth.trim().length()<1) {
			cancelMonth=null;
		}


		if(cancelMonth!=null) {
			//당월 예매 취소 내역 -> list로 띄우기
			ReservationVO[] rvo_cancel = MyReservationDAO.getCancelList(mvo.getU_code(), cancelMonth);
			if(rvo_cancel !=null)
				System.out.println(rvo_cancel.length);
			request.setAttribute("rvo_cancel", rvo_cancel);
		}
		else if(searchKey==null && selectedMonth==null) { //월 입력값이 없을 때 -> 모든 값

			ReservationVO[] rvo = MyReservationDAO.getAllList(mvo.getU_code());
			request.setAttribute("rvo", rvo);

			ReservationVO[] rvo_cancel = MyReservationDAO.getAllCancel(mvo.getU_code());
			request.setAttribute("rvo_cancel", rvo_cancel);

		}else { //입력값이 있을 때

			//당월 예매 내역 조회 -> list로 띄우기
			ReservationVO[] rvo = MyReservationDAO.getReservationList(mvo.getU_code(), searchKey, selectedMonth);
			if(rvo !=null)
				System.out.println(rvo.length);
			request.setAttribute("rvo", rvo);

		}

		//예매 취소하기
		return "/jsp/myReservation/myReservation.jsp";
	}

}