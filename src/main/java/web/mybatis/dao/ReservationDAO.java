package web.mybatis.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.PaymentVO;
import web.mybatis.vo.ReservationVO;
import web.mybatis.vo.ReserverVO;
import web.mybatis.vo.ScreeningScheduleVO;
import web.mybatis.vo.SelectSeatVO;

public class ReservationDAO {
	
	public static ScreeningScheduleVO selectScreen(ScreeningScheduleVO sc) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		ScreeningScheduleVO ar = ss.selectOne("screeningSchedule.selectReservationInfo", sc);
		
		ss.close();
		return ar;
	}
	
	public static SelectSeatVO[] ticketing(ScreeningScheduleVO ssvo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<SelectSeatVO> list = ss.selectList("selectSeat.checkSeat",ssvo);
		SelectSeatVO[] ar = null;
		if(list != null && list.size() > 0) {
			ar = new SelectSeatVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;

	}

	public static int loginNoReserver(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("reserver.selectNoReserver", map);
		ss.close();
		return res;
	}

	public static ReserverVO[] selectReserver(Map<String, String> userInfo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<ReserverVO> reserver = ss.selectList("reserver.selectReserverInfo",userInfo);
		ReserverVO[] ar = null;
		if( reserver != null && reserver.size() > 0) {
			ar = new ReserverVO[reserver.size()];
			reserver.toArray(ar);
		}
		ss.close();
		
		return ar;
	}

	public static int selectCnt(Map<String, String> userInfo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("reserver.count",userInfo);
		ss.close();
		return res;
	}

	public static ScreeningScheduleVO[] selectText() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ScreeningScheduleVO> list = ss.selectList("reservation.selectByText");
		ScreeningScheduleVO[] ar = null;
		if( list != null && list.size() > 0 ) {
			ar = new ScreeningScheduleVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static String[] selectTime(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<String> list = ss.selectList("reservation.selectByTime",map);
		String[] ar = null;
		if( list != null && list.size() > 0) {
			ar = new String[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
	public static  ReserverVO[] getNonMemCancelList(Map<String, String> userInfo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ReserverVO> reserver = ss.selectList("reserver.getNonMemCancelList",userInfo);
		ReserverVO[] ar = null;
		if( reserver != null && reserver.size() > 0) {
			ar = new ReserverVO[reserver.size()];
			reserver.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static int selectS_code(Map<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("reservation.selectByScode",map);
		ss.close();
		return res;
	}

	public static int selectCount(int s_code) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("selectSeat.seatCount",s_code);
		ss.close();
		return res;
	}

	public static int selectSeatTotal(String guan) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int res = ss.selectOne("theater.totalSeatCount", guan);
		ss.close();
		return res;
	}


}
