package main.java.web.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogoutAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //로그아웃 처리
        //세션에 저장된 아이디를 삭제
        //로그아웃 성공시 인덱스로 이동
        request.getSession().removeAttribute("mvo");


        return "/Controller?type=index";
    }
}
