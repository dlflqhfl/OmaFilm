package web.main.action;

import web.mybatis.dao.LoginDAO;
import web.mybatis.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class KakaoLoginAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //소셜 로그인 처리
        //소셜 로그인 성공시 세션에 아이디를 저장
        //소셜 로그인 실패시 회원가입 창으로 이동
        //소셜 로그인 성공시 메인 페이지로 이동
    	
    	System.out.println("야");

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String token = request.getParameter("token");


        int cnt = LoginDAO.emailCheck(email);
        String result;
        
        System.out.println(cnt);

        // cnt가 0이면 email이 db에 없는 것이므로 회원가입 창으로 이동
        if (cnt == 0) {
            request.getSession().setAttribute("social_email", email);
            request.getSession().setAttribute("social_name", name);
            request.getSession().setAttribute("social_id", id);
            request.getSession().setAttribute("token", token);

            result = "0";
        }else {
            //이제 이것이 소셜 로그인이 맞는지 아니면 그냥 로그인인지 확인해야함
            int cnt2 = LoginDAO.socialLoginCheck(email);

            if (cnt2 == 0) {
                //소셜 로그인이 아닌 경우
                //경고창
                result = "1";
            }else {
                //email에 해당하는 mvo를 가져와 세션에 저장
                MemberVO mvo = LoginDAO.getMember(email);
                request.getSession().setAttribute("mvo", mvo);
                result = "2";
            }
        }
        request.setAttribute("result", result);

        return "/jsp/login/login_social.jsp";
    }
}