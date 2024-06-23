package web.mybatis.dao;

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
}
