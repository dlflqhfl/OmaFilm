package web.main.action;

import web.mybatis.dao.LoginDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class PwUpdateAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String origin_pw = request.getParameter("origin_pw");
        System.out.println("id : " + id);
        System.out.println("pw : " + pw);
        System.out.println("origin_pw : " + origin_pw);


        Map<String, String> map = new HashMap<>();

        map.put("id", id);
        map.put("pw", pw);
        map.put("origin_pw", origin_pw);

        int cnt = LoginDAO.changePw(map);

        System.out.println("cnt : " + cnt);

        String result = "";

        if (cnt > 0) {
            System.out.println("비밀번호 변경 성공");
            request.getSession().removeAttribute("mvo");
            result = "0";
        } else {
            System.out.println("비밀번호 변경 실패");
            result = "1";
        }

        request.setAttribute("result", result);

        return "/jsp/login/email_check.jsp";

    }
}
