package web.main.action;

import com.google.gson.JsonObject;
import web.mybatis.dao.LoginDAO;
import web.mybatis.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class SearchIdAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        System.out.println("birth : " + birth);
        System.out.println("name : " + name);
        System.out.println("email : " + email);

        Map<String, String> map = new HashMap<>();
        map.put("birth", birth);
        map.put("name", name);
        map.put("email", email);

        // DB에서 id, name, email을 비교하여 일치하는 아이디를 찾는 코드

        MemberVO mvo = LoginDAO.find_id_date(map);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject json = new JsonObject();

        if (mvo != null) {
            System.out.println("mvo : " + mvo.getU_id());
            System.out.println("mvo : " + mvo.getU_join_date());
            json.addProperty("id", mvo.getU_id());
            json.addProperty("join_date", mvo.getU_join_date());
        } else {
            json.addProperty("id", "null");
            json.addProperty("join_date", "null");
        }

        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();

        return null;
    }
}
