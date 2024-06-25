package web.mybatis.DAO;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.MemberVO;

import java.util.Map;

public class LoginDAO {

    /* 마이바티스를 통해 인자로 받은 아이디와 비밀번호의 값이 db에 있는값과 일치하는 vo객체를 불러오는 함수*/
    public static MemberVO loginCheck(Map map) {
        SqlSession ss = FactoryService.getFactory().openSession();

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
        int cnt = ss.insert("member.regist", mvo);

        if (cnt > 0){
            ss.commit();
        } else {
            ss.rollback();
        }

        ss.close();

        return cnt;
    }
}
