package main.java.web.mybatis.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.InquiryVO;
import web.mybatis.vo.MemberVO;

public class MyHomeDAO {
	public static MemberVO getMemName(int u_code) {
		  SqlSession ss = FactoryService.getFactory().openSession();
	        try {
	            return ss.selectOne("member.getMemName", u_code);
	        } finally {
	            ss.close();
	        }
	    }
	
	public static int countCoupon(int u_code) {
		SqlSession ss = FactoryService.getFactory().openSession();
		try {
            return ss.selectOne("issuedCoupon.getCouponCount", u_code);
        } finally {
            ss.close();
        }
	
	}
	public static int delCouponCount(int u_code) {
		SqlSession ss = FactoryService.getFactory().openSession();
		try {
			return ss.selectOne("issuedCoupon.delCouponCount",u_code);
		} finally {
			ss.close();
		}
		
	}
}
	
	