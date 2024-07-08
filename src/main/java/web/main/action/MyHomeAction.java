package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.mybatis.dao.MyHomeDAO;
import web.mybatis.dao.MyReservationDAO;
import web.mybatis.dao.inquiryDAO;
import web.mybatis.vo.InquiryVO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.ReservationVO;

public class MyHomeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Object obj = request.getSession().getAttribute("mvo");
		 MemberVO mvo = (MemberVO) obj;
		 
		 if (mvo != null) {
		        int u_code = mvo.getU_code();
		        
		        // 사용자 정보 조회 (기존 MyHomeDAO.getMemName 메서드 활용)
		        MemberVO member = MyHomeDAO.getMemName(u_code);
		        System.out.println("하하"+member);
		        request.getSession().setAttribute("member", member); 
		        
		        // 쿠폰 개수 조회 및 request에 저장
		        int couponCount = MyHomeDAO.countCoupon(u_code);
		        System.out.println(couponCount);
		        request.setAttribute("couponCount", couponCount);
		        
		        //당월 소멸 쿠폰 개수 조회 및 request에 저장
		        int delCouponCount = MyHomeDAO.delCouponCount(u_code);
		        request.setAttribute("delCouponCount",delCouponCount );
		        
		        //나의 문의내역
		        InquiryVO[] ivo = inquiryDAO.myHomeinquiryList(u_code);
				request.setAttribute("ivo", ivo);
				
				//나의 예매내역
				ReservationVO[] rvo = MyReservationDAO.getAllList(mvo.getU_code()); 
				request.setAttribute("rvo", rvo);
				 
		        return "/jsp/myPage/myhome.jsp";
		    } else {
		        request.getSession().setAttribute("loginErrorMessage", "로그인이 필요한 서비스입니다.");
		        return "/jsp/login/login_1.jsp";
		    }
		
	}	
		
}
	