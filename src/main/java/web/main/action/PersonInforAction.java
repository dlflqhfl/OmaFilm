package web.main.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.LoginDAO;
import web.mybatis.dao.MyHomeDAO;
import web.mybatis.dao.PersonInforDAO;
import web.mybatis.vo.MemberVO;

public class PersonInforAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute("mvo");
        MemberVO mvo = (MemberVO) obj;

        if (mvo != null) {
            int u_code = mvo.getU_code();

            String u_id = request.getParameter("id");
            String u_pw = request.getParameter("pw");
            String u_name = request.getParameter("name");
            String u_email = request.getParameter("email");
            String u_phone = request.getParameter("phone");
            String u_address = request.getParameter("addr");
            String u_birth = request.getParameter("birth");
            String u_postcode = request.getParameter("postcode");
            String u_email_rcv = request.getParameter("email_rcv");
            String u_social = request.getParameter("social");
            //회원가입 날짜 yyyy-MM-dd
            u_id = (u_id != null) ? u_id : mvo.getU_id(); 
            u_name = (u_name != null) ? u_name : mvo.getU_name();
            u_social = (u_social !=null) ? u_social : mvo.getU_social();
            MemberVO updateMember = new MemberVO(mvo.getU_id(), u_pw, "0", mvo.getU_social(), mvo.getU_name(), u_phone, 
                    u_postcode, u_address, u_email, u_email_rcv, u_birth, "0", mvo.getU_join_date(), null); // 기존 가입 날짜 유지

            updateMember.setU_code(u_code);
            
            int updateSuccess = PersonInforDAO.updateUserInfo(updateMember); 
             
            if (updateSuccess >0) { 
                // 업데이트된 회원 정보를 다시 조회하여 세션에 반영
                MemberVO member = MyHomeDAO.getMemName(u_code);
                request.getSession().setAttribute("mvo", member);
                request.setAttribute("cnt",updateSuccess);
                System.out.println("Response Sent: 1"); // 응답 로그
                
                
                return "jsp/myPage/personInforSuccess.jsp"; 
            } else {
                System.out.println("Response Sent: 0"); // 응답 로그
                return "jsp/myPage/personInfor.jsp";
            }

            
        } else {
            // 로그인되지 않은 경우 처리 (예: 로그인 페이지로 이동)
            return null; // 로그인 페이지 경로
        }
    }
}