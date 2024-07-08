package main.java.web.main.action;
import org.json.JSONObject;
import web.mybatis.dao.LoginDAO;
import web.mybatis.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class NaverLoginAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String clientId = "prTymuieNCdwFguuzeIa";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "YVXiKA204q";//애플리케이션 클라이언트 시크릿값";
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode("http://localhost:9090/OmaFilm/Controller?type=naver", "UTF-8");
        String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&redirect_uri=" + redirectURI
                + "&code=" + code
                + "&state=" + state;
        String accessToken = "";
        String refresh_token = "";

        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuilder res = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();
            if (responseCode == 200) {
                // 액세스 토큰 얻기
                JSONObject json = new JSONObject(res.toString());
                accessToken = json.getString("access_token");
                System.out.println("accessToken : " + accessToken);

                // 사용자 정보 요청
                LoginDAO.handleUserInfo(accessToken, request);

                // db에 저장된 정보인지 확인
                String id = (String) request.getSession().getAttribute("social_id");
                String email = (String) request.getSession().getAttribute("social_email");
                int cnt = LoginDAO.emailCheck(id);
                // cnt가 0이면 email이 db에 없는 것이므로 회원가입 창으로 이동
                String result = "";

                if (cnt == 0) {
                    result = "0";
                } else {
                    //이제 이것이 소셜 로그인이 맞는지 아니면 그냥 로그인인지 확인해야함
                    int cnt2 = LoginDAO.socialLoginCheck(id);

                    if (cnt2 == 0) {
                        //소셜 로그인이 아닌 경우
                        result = "1";
                        //경고창
                    } else {
                        //email에 해당하는 mvo를 가져와 세션에 저장
                        MemberVO mvo = LoginDAO.getMember(id);
                        request.getSession().setAttribute("mvo", mvo);
                        result = "2";
                    }
                }
                request.setAttribute("result", result);
                System.out.println("result1 : " + result);
            }
        } catch (Exception e) {
            // Exception 로깅
        }

        return "/jsp/login/login_1.jsp";
    }
}