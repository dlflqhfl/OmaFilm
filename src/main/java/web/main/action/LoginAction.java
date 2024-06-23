package web.main.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import web.mybatis.dao.LoginDAO;
import web.mybatis.vo.MemberVO;

import java.util.HashMap;
import java.util.Map;

public class LoginAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("login_id");
        String pw = request.getParameter("login_pw");
        String remember_id = request.getParameter("remember_id");
        System.out.println("id: " + id);
        System.out.println("pw: " + pw);

        //로그인 처리
        //로그인 성공시 세션에 아이디를 저장
        //로그인 실패시 다시 로그인 페이지로 이동
        //로그인 성공시 메인 페이지로 이동

        Map<String, String> map = new HashMap<>();

        map.put("id", id);
        map.put("pw", pw);

        MemberVO mvo = LoginDAO.loginCheck(map);
        System.out.println("여기까지는 왔다");

        if(mvo != null){
            request.getSession().setAttribute("login", mvo);
            if(remember_id != null){
                request.getSession().setAttribute("remember_id", id);
            }
            System.out.println("로그인 성공");
            return "/Controller?type=index";
        }

        return "jsp/login/login_1.jsp";
    }
}
