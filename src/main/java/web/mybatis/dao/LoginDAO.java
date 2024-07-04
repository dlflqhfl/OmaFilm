package web.mybatis.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.MemberVO;

public class LoginDAO {

    /* 마이바티스를 통해 인자로 받은 아이디와 비밀번호의 값이 db에 있는값과 일치하는 vo객체를 불러오는 함수*/
    public static MemberVO loginCheck(Map map) {
        SqlSession ss = FactoryService.getFactory().openSession();
        System.out.println("loginCheck");
        MemberVO mvo = ss.selectOne("member.login_check", map);
        ss.close();

        return mvo;
    }

    //id 중복체크
    public static int idCheck(String id) {
        SqlSession ss = FactoryService.getFactory().openSession();

        int cnt = ss.selectOne("member.id_check", id);

        ss.close();

        return cnt;
    }

    //회원가입
    public static int regist(MemberVO mvo) {
        SqlSession ss = FactoryService.getFactory().openSession();

        System.out.println("regist");

        int cnt = ss.insert("member.regist", mvo);

        if (cnt > 0){
            ss.commit();
        } else {
            ss.rollback();
        }

        ss.close();
        System.out.println("cnt : " + cnt);
        return cnt;
    }

    //이메일 중복 확인
    public static int emailCheck(String email) {
        System.out.println("emailCheck");
        SqlSession ss = FactoryService.getFactory().openSession();

        int cnt = ss.selectOne("member.email_check", email);
        System.out.println("cnt : " + cnt);
        ss.close();

        return cnt;
    }

    //이메일 중복 확인 후 소셜 아이디가 존재하면 해당 mvo를 가져오는 함수
    public static MemberVO getMember(String email) {
        System.out.println("getMember");
        SqlSession ss = FactoryService.getFactory().openSession();

        MemberVO mvo = ss.selectOne("member.get_member", email);
        ss.close();

        return mvo;
    }

    //소셜 로그인인지 확인하는 함수
    public static int socialLoginCheck(String email) {
        System.out.println("socialLoginCheck");
        SqlSession ss = FactoryService.getFactory().openSession();

        int cnt = ss.selectOne("member.social_login_check", email);
        ss.close();

        return cnt;
    }

    //네이버 로그인 토큰을 통해 정보를 가져오는 함수
    public static  void handleUserInfo(String accessToken, HttpServletRequest request) {
        String headerStr = "Bearer " + accessToken; // Bearer Token 방식으로 인증 정보를 헤더에 포함
        String apiURL = "https://openapi.naver.com/v1/nid/me";
        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", headerStr); // 헤더에 인증 정보 추가
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
            }
            String inputLine;
            StringBuilder res = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();
            if (responseCode == 200) {
                JSONObject json = new JSONObject(res.toString());
                JSONObject response = json.getJSONObject("response");
 
                // 사용자 정보 추출
                String id = response.getString("id");
                String email = response.getString("email");
                String name = response.getString("name");
                String birthday = response.getString("birthday");
                String mobile = response.getString("mobile");
                String birth_year = response.getString("birthyear");
                String[] birth = birthday.split("-");
                String birth_month = birth[0];
                String birth_day = birth[1];

                // 사용자 정보를 요청의 속성으로 설정
                request.getSession().setAttribute("social_id", id);
                request.getSession().setAttribute("social_email", email);
                request.getSession().setAttribute("social_name", name);
                request.setAttribute("birth_month", birth_month);
                request.setAttribute("birth_day", birth_day);
                request.setAttribute("birth_year", birth_year);
                request.setAttribute("mobile", mobile);
            }
        } catch (Exception e) {
            // Exception 로깅
        }
    }

    //아이디 찾기 할때 db에서 이름 생일 이메일이 일치하는지 그 수를 가져오는 함수
    public static int findId(Map map) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("member.find_id", map);
        ss.close();

        System.out.println("cnt : " + cnt);

        return cnt;
    }

    //아이디 찾기시 db에서 이름 생일 이메일이 일치하는 mvo를 가져오는 함수
    public static MemberVO find_id_date(Map map) {
        SqlSession ss = FactoryService.getFactory().openSession();
        MemberVO mvo = ss.selectOne("member.find_id_date", map);
        ss.close();

        return mvo;
    }
}
