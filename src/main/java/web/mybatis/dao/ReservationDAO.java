package web.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
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
}
