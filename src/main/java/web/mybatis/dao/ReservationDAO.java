package web.mybatis.dao;

import java.util.ArrayList;
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
		int res = ss.selectOne("reserver.selectNoReserver",map);
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
}
