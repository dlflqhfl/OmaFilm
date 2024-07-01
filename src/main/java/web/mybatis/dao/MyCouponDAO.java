package web.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.IssuedCouponVO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.ReservationVO;

public class MyCouponDAO {
	public static IssuedCouponVO[] getAllCoupon(MemberVO mvo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<IssuedCouponVO> list = ss.selectList("issuedCoupon.getAllCoupon", mvo.getU_code());
		
		IssuedCouponVO[] cvo = new IssuedCouponVO[list.size()];
		
		list.toArray(cvo);
		
		ss.close();
		
		return cvo;
	}
	
	public static IssuedCouponVO[] getUsableCoupon(MemberVO mvo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<IssuedCouponVO> list = ss.selectList("issuedCoupon.getCouponArr", mvo.getU_code());
		
		IssuedCouponVO[] cvo = new IssuedCouponVO[list.size()];
		
		list.toArray(cvo);
		
		ss.close();
		
		return cvo;
	}
	
	public static IssuedCouponVO[] getUsedCoupon(MemberVO mvo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<IssuedCouponVO> list = ss.selectList("issuedCoupon.getUsedCoupon", mvo.getU_code());
		
		IssuedCouponVO[] cvo = new IssuedCouponVO[list.size()];
		
		list.toArray(cvo);
		
		ss.close();
		
		return cvo;
	}
}
