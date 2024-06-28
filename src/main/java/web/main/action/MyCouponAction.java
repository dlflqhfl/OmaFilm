package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.mybatis.dao.MyCouponDAO;
import web.mybatis.vo.IssuedCouponVO;
import web.mybatis.vo.MemberVO;

public class MyCouponAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		String type = request.getParameter("selectedType");
		
		if(mvo!=null) {
			if(type.equals("all")) { //모두 보여주기
				//회원 정보 -> 쿠폰 검색 -> request에 저장
				IssuedCouponVO[] cvo = MyCouponDAO.getAllCoupon(mvo);
				request.setAttribute("cvo", cvo);
				
			}else if(type == null || type.trim().length()<1 || type == "usable") {
				//회원 정보 -> 쿠폰 검색 -> request에 저장
				IssuedCouponVO[] cvo = MyCouponDAO.getUsableCoupon(mvo);
				request.setAttribute("cvo", cvo);
				
			}else if(type.equals("used")) {
				//회원 정보 -> 쿠폰 검색 -> request에 저장
				IssuedCouponVO[] cvo = MyCouponDAO.getUsedCoupon(mvo);
				request.setAttribute("cvo", cvo);
				
			}
		}
		
		return "/jsp/myCoupon/myCoupon.jsp";
	}

}
