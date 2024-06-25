package web.main.action;


import web.mybatis.dao.LoginDAO;
import web.mybatis.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegisterAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("alo");
        //회원가입 처리
        String u_id = request.getParameter("id");
        String u_pw = request.getParameter("pw");
        String u_name = request.getParameter("name");
        String u_email = request.getParameter("email");
        String u_phone = request.getParameter("phone");
        String u_address = request.getParameter("addr");
        String u_birth = request.getParameter("birth");
        String u_postcode = request.getParameter("postcode");
        String u_email_rcv = request.getParameter("email_rcv");
        //회원가입 날짜 yyyy-MM-dd
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String u_join_date = sdf.format(date);


        MemberVO member = new MemberVO(u_id, u_pw, "0", "0", u_name, u_phone, u_postcode, u_address, u_email, u_email_rcv, u_birth, "0", u_join_date, null);

        int cnt = LoginDAO.regist(member);

        if(cnt == 1){
            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }

        return null;
    }
}
