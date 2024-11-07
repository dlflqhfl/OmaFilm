package web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.MemberVO;

public class PersonInforDAO {
	
	 public static int updateUserInfo(MemberVO member) {
	       SqlSession ss = FactoryService.getFactory().openSession();
	       
	            int cnt = ss.update("member.updateUserInfo", member);
	            if( cnt > 0) {
	            	ss.commit();
	            } else {
	            	ss.rollback();
	            }
	            ss.close();
	            return cnt;
	        }
	    } 
	

