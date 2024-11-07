package web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.MemberVO;

public class WithDrawalDAO {
	public static int updateMemberStatus(int u_code) {
	    SqlSession ss = FactoryService.getFactory().openSession();
	    
	        int result = ss.update("member.updateStatus", u_code);
	        System.out.println("result"+result);
	        if(result >0)
	        	ss.commit();
	        else
	        	ss.rollback();
	        ss.close();
	        return result;
	}
}