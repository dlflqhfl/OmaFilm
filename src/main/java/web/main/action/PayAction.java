package web.main.action;

import web.mybatis.dao.PaymentDAO;
import web.mybatis.vo.IssuedCouponVO;
import web.mybatis.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PayAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		//임시로 회원 정보 가져오기
		//MemberVO mvo = sesseion.getAttribute("mvo");
		MemberVO mvo = PaymentDAO.getMvo("test1");
		request.setAttribute("mvo", mvo);
		
		//회원 정보 -> 쿠폰 검색 -> request에 저장
		IssuedCouponVO[] cvo = PaymentDAO.getCouponArr(mvo);
		request.setAttribute("cvo", cvo);
		
		//회원 정보 -> 포인트 검색 -> request에 저장
		int point = PaymentDAO.getPoint(mvo);
		request.setAttribute("point", point);
		
		return "/jsp/payment/payment.jsp";
	}

}
