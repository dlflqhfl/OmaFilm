package web.mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.AudienceVO;
import web.mybatis.vo.IssuedCouponVO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.ScreeningScheduleVO;
import web.mybatis.vo.SelectSeatVO;
import web.mybatis.vo.TheaterSeatVO;
import web.mybatis.vo.TheaterVO;

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
	//movieName -> 상영 영화 VO
	public static MovieListVO getMovieVO(String movieName) {
		SqlSession ss = FactoryService.getFactory().openSession();
		MovieListVO movieVO = ss.selectOne("movieList.getMovieVO", movieName);
		ss.close();
		return movieVO;
	}
	
	//상영관 이름 -> 상영관 VO
	public static TheaterVO getTheaterVO(String theater) {
		SqlSession ss = FactoryService.getFactory().openSession();
		TheaterVO theaterVO = ss.selectOne("theater.getTheaterVO", theater);
		ss.close();
		return theaterVO;
	}
	
	//상영 영화 코드, 상영관 코드, 날짜+시작 시간 -> 상영시간표VO(ssvo)
	public static ScreeningScheduleVO getSsVO(String movie_code, String t_code, String dateAndTime) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<>();
		map.put("movie_code", movie_code);
		map.put("t_code", t_code);
		map.put("dateAndTime", dateAndTime);
		
		ScreeningScheduleVO ssvo = ss.selectOne("screeningSchedule.getSsVO", map);
		ss.close();
		return ssvo;
	}
	
	public static TheaterSeatVO[] getTheaterSeatVO(String tNum, String[] seat) {
		List<SelectSeatVO> list = new ArrayList<>();
		TheaterSeatVO[] ssvoArr = new TheaterSeatVO[seat.length];
		SqlSession ss = FactoryService.getFactory().openSession();
		
		for(int i=0; i<seat.length; i++) {
			String temp = tNum+seat[i];
			TheaterSeatVO svo = ss.selectOne("theaterSeat.getTsVO", temp);
			ssvoArr[i] = svo;
		}
		ss.close();
		return ssvoArr;
	}
	
	//String Map 받아서 그만큼의 AudienceVO 객체를 담은 배열 반환
	public static AudienceVO[] getAudienceVO(String[] data) {
		//	data[0] = 성인:2 
		//	data[1] = 청소년:1
		//	data[2] = 경로:0
		SqlSession ss = FactoryService.getFactory().openSession();
		
		// 각 항목을 키-값 쌍으로 저장합니다.
		List<AudienceVO> list = new ArrayList<>();
		
		for (String item : data) {
		  String[] parts = item.split(":");
		  String key = parts[0];
		  int count = Integer.parseInt(parts[1]);
		  for(int i=0; i<count; i++) {
			  AudienceVO avo = ss.selectOne("audience.getAudienceVO", key);
			  list.add(avo);
		  }
		}
		ss.close();
		
		AudienceVO[] avoArr = new AudienceVO[list.size()];
		list.toArray(avoArr);
		
		return avoArr;
	}
	
	
	//--------------- PayCopleteAction에서 쓰는 함수 --------------
	//비회원 정보 저장, 예매자 코드 반환
	public static int saveNonMem(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("reserver.insertNonMem", map);
		int rsvr_code = 0;
		if(cnt>0) {
			rsvr_code = ss.selectOne("reserver.getNonMemRsvrCode", map);
			if(rsvr_code >0)
				ss.commit();
			else
				ss.rollback();
		} else
			ss.rollback();
		ss.close();
		
		return rsvr_code;
	}
	//회원 정보 저장, 예매자 코드 반환
	public static int saveMem(int u_code) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("reserver.insertMem", u_code);
		int rsvr_code = 0;
		if(cnt>0) {
			rsvr_code = ss.selectOne("reserver.getMemRsvrCode", u_code);
			if(rsvr_code > 0)
				ss.commit();
			else
				ss.rollback();
		}
		else
			ss.rollback();
		ss.close();
		
		return rsvr_code;
	}
	//결제 내역 저장, 결제 코드 반환
	public static int savePayment(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("payment.insertPayment", map);
		int p_code =0;
		if(cnt > 0) {
			p_code = ss.selectOne("getPCode", map);
			if(p_code > 0)
				ss.commit();
			else
				ss.rollback();
		}
		else
			ss.rollback();
		ss.close();
		
		return p_code;
	}
	
	//예매 내역 저장, 예매번호 반환
	public static int saveReservation(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt= ss.insert("reservation.insertReservation", map);
		int rs_code = 0;
		if(cnt > 0) {
			rs_code = ss.selectOne("reservation.getRsNum", map);
			if(rs_code > 0)
				ss.commit();
			else
				ss.rollback();
		}
		else
			ss.rollback();
		ss.close();
		
		return rs_code;
	}
	//선택 좌석 저장
	public static void saveSelectedSeat(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("selectSeat.insertSeat", map);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		
	}
	
}
