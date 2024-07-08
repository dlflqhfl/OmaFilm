package main.java.web.main.action;

import web.mybatis.dao.LoginDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IdCheckAction implements Action{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //id 중복체크를 위한 action
        //ajax를 통해 받은 id를 가지고 db에 있는 id와 비교하여 중복되는지 확인
        String id = request.getParameter("id");
        System.out.println("id : " + id);

        //db에 있는 id와 비교하기 위한 dao 호출
        int cnt = LoginDAO.idCheck(id);
        System.out.println("cnt : " + cnt);

        //중복되는 id가 없다면 0을 리턴
        if(cnt == 0){
            response.getWriter().write("0");
        }else{
            response.getWriter().write("1");
        }

        return null;
    }
}
