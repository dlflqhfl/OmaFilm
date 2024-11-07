package web.mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.CouponItemVO;
import web.mybatis.vo.MemberVO;

public class AdminCpDAO {
	public static CouponItemVO[] getCouponItem() {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<CouponItemVO> list = ss.selectList("couponItem.getCouponItemList");
		//System.out.println(list.size());
		
		CouponItemVO[] couponItem = new CouponItemVO[list.size()];
		
		list.toArray(couponItem);
		
		ss.close();
		
		return couponItem;
	}
	
	public static void delCouponItem(String ci_code) {
		SqlSession ss = FactoryService.getFactory().openSession();

		int cnt = ss.delete("couponItem.delCouponItem", ci_code);

		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		
		ss.close();
	}
	
	public static void addCoupinItem(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("couponItem.addCouponItem", map);

		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		
		ss.close();
	}
	
	public static MemberVO[] getMemList() {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<MemberVO> list = ss.selectList("member.getMemList");
		
		MemberVO[] memList = new MemberVO[list.size()];
		list.toArray(memList);
		
		ss.close();
		return memList;
	}
	
	public static List<String> getU_code(String ci_code) {
		SqlSession ss = FactoryService.getFactory().openSession();
        
        List<String> list = ss.selectList("issuedCoupon.getU_code", ci_code);
        
        ss.close();
        return list;
	}
	
	public static void insertU_code(String ci_code, String u_code) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<>();
		
		map.put("ci_code", ci_code);
		map.put("u_code", u_code);

		int cnt = ss.insert("issuedCoupon.insertU_code", map);

		if (cnt > 0)
			ss.commit();
		else
			ss.rollback();

		ss.close();
	}
	
	public static CouponItemVO[] searchCouponItem(String searchType, String searchValue) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		List<CouponItemVO> list = ss.selectList("couponItem.searchCouponItem", map);
		
		CouponItemVO[] couponItem = new CouponItemVO[list.size()];
		list.toArray(couponItem);
		ss.close();
		return couponItem;
		
	}
	
	public static MemberVO[] searchMemItem(String searchType, String searchValue) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		System.out.println(searchType);
		System.out.println(searchValue);
		
		List<MemberVO> list = ss.selectList("member.searchMem", map);
		System.out.println(list.size());
		
		MemberVO[] memItem = new MemberVO[list.size()];
		list.toArray(memItem);
		ss.close();
		return memItem;
	}
}
