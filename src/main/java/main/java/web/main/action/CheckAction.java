package main.java.web.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CheckAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //session에 저장된 인증번호와 사용자가 입력한 인증번호를 비교하는 코드
        //session에 저장된 인증번호를 가져온다.
        Object obj = request.getSession().getAttribute("code");
        Object timeObj = request.getSession().getAttribute("codeTime");


        if (obj != null && timeObj != null) {
            StringBuilder Code = (StringBuilder) obj;
            String code = Code.toString();
            long codeTime = (long) timeObj;
            long currentTime = System.currentTimeMillis();

            //현재 시간과 인증번호 생성 시간의 차이를 계산한다
            long diffTime = currentTime - codeTime;

            //사용자가 입력한 인증번호를 가져온다.
            String code_user = request.getParameter("code_user");
            System.out.println("code_user : " + code_user);
            System.out.println("code : " + code);


            //인증번호가 일치하는지 확인 그리고 인증번호가 3분이내 즉 만료되지 않았는지 확인
            String success = "0";
            if(code_user.equals(code) && diffTime < 3 * 60 * 1000){
                success = "1";
            }else {
                success = "0";
            }
            System.out.println("success : " + success);

            String jsonResponse = "{\"success\":\"" + success + "\"}";

            response.setContentType("application/json");
            response.getWriter().write(jsonResponse);
        }

        return null;
    }
}