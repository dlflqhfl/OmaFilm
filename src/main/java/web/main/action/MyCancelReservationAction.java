package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.main.util.Paging;
import web.mybatis.dao.MyReservationDAO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.ReservationVO;

public class MyCancelReservationAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		String cancelMonth = request.getParameter("cancelMonth");
		if(cancelMonth!=null && cancelMonth.trim().length()<1) {
			cancelMonth=null;
		}
		
		ReservationVO[] rvo_cancel =null;
		if(cancelMonth!=null) {
			//당월 예매 취소 내역 -> list로 띄우기
			rvo_cancel = MyReservationDAO.getCancelList(mvo.getU_code(), cancelMonth);
			System.out.println(cancelMonth);
			if(rvo_cancel !=null)
				System.out.println(rvo_cancel.length);
			request.setAttribute("rvo_cancel", rvo_cancel);
			
		}else {
			rvo_cancel = MyReservationDAO.getAllCancel(mvo.getU_code());
			request.setAttribute("rvo_cancel", rvo_cancel);
		}
		
		
		//rvo 페이징 처리
		Paging page = new Paging(10,5);
		
		String cPage = request.getParameter("cPage");
		if(rvo_cancel !=null)
			page.setTotalRecode(rvo_cancel.length);
		if(cPage !=null)
			page.setNowPage(Integer.parseInt(cPage));
		else
			page.setNowPage(1);
		request.setAttribute("page", page);
		
		return "/jsp/myReservation/myCancelReservation.jsp";
	}

}
