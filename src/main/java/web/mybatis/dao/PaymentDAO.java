package web.mybatis.DAO;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.IssuedCouponVO;
import web.mybatis.vo.IssuedPointVO;
import web.mybatis.vo.MemberVO;

import java.util.List;

public class PaymentDAO {

	//회원 아이디를 넣으면 회원 객체를 반환 
	public static MemberVO getMvo(String id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("member.idToMvo", id);
		ss.close();
		return mvo;
	}
	
	//회원 객체를 넣어 보유 쿠폰 리스트 가져오는 함수
	public static IssuedCouponVO[] getCouponArr(MemberVO mvo) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<IssuedCouponVO> list = ss.selectList("issuedCoupon.getCouponArr", mvo.getU_code());
		IssuedCouponVO[] cvo = new IssuedCouponVO[list.size()];
		list.toArray(cvo);
		ss.close();
		return cvo;
	}
	
	//회원 객체를 넣어 잔여 포인트를 가져오는 함수
	public static int getPoint(MemberVO mvo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		IssuedPointVO pvo= ss.selectOne("issuedPoint.getPoint", mvo.getU_code());
		ss.close();
		int point;
		if(pvo == null)
			point=0;
		else
			point = Integer.parseInt(pvo.getP_after());
		return point;
	}
}
