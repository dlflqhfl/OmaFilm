package web.mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.ReservationVO;
import web.mybatis.vo.ReserverVO;

public class MyReservationDAO {
	
	public static ReservationVO[] getAllList(int u_code) {
		ReservationVO[] rvo = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		
		//예약자 찾기(u_code & rsvr_time -> rsvr_code)
		List<ReserverVO> list = ss.selectList("reserver.getAllRsvrList", u_code);
		
		//rsvr_code -> reservationVO
		List<ReservationVO> rvo_list = new ArrayList<ReservationVO>();
		
		for(ReserverVO rvo_temp : list) {
			ReservationVO tmp = ss.selectOne("reservation.getReservation", rvo_temp.getRsvr_code());
			if(tmp != null)
				rvo_list.add(tmp);
		}
		rvo = new ReservationVO[rvo_list.size()];
		rvo_list.toArray(rvo);
		
		ss.close();
		
		return rvo;
	}
	
	public static ReservationVO[] getAllCancel(int u_code) {
		ReservationVO[] rvo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		//예약자 찾기(u_code & rsvr_time -> rsvr_code)
		List<ReserverVO> list = ss.selectList("reserver.getAllRsvrList", u_code);
		
		//rsvr_code -> reservationVO
		List<ReservationVO> rvo_list = new ArrayList<ReservationVO>();
		
		for(ReserverVO rvo_temp : list) {
			ReservationVO tmp = ss.selectOne("reservation.getCancel", rvo_temp.getRsvr_code());
			if(tmp != null)
				rvo_list.add(tmp);
		}
		rvo = new ReservationVO[rvo_list.size()];
		rvo_list.toArray(rvo);
		
		ss.close();
		
		return rvo;
	}
	
	public static ReservationVO[] getReservationList(int u_code, String yearAndMonth) {
		ReservationVO[] rvo = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_code", String.valueOf(u_code));
		map.put("yearAndMonth", yearAndMonth);
		
		//예약자 찾기(u_code & rsvr_time -> rsvr_code)
		List<ReserverVO> list = ss.selectList("reserver.getMonthRsvrList", map);
		
		//rsvr_code -> reservationVO
		List<ReservationVO> rvo_list = new ArrayList<ReservationVO>();
		
		for(ReserverVO rvo_temp : list) {
			ReservationVO tmp = ss.selectOne("reservation.getReservation", rvo_temp.getRsvr_code());
			if(tmp != null)
				rvo_list.add(tmp);
		}
		rvo = new ReservationVO[rvo_list.size()];
		rvo_list.toArray(rvo);
		
		ss.close();
		
		return rvo;
	}
	
	public static ReservationVO[] getCancelList(int u_code, String yearAndMonth) {
		ReservationVO[] rvo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_code", String.valueOf(u_code));
		map.put("yearAndMonth", yearAndMonth);
		
		//예약자 찾기(u_code & rsvr_time -> rsvr_code)
		List<ReserverVO> list = ss.selectList("reserver.getMonthRsvrList", map);
		
		//rsvr_code -> reservationVO
		List<ReservationVO> rvo_list = new ArrayList<ReservationVO>();
		
		for(ReserverVO rvo_temp : list) {
			ReservationVO tmp = ss.selectOne("reservation.getCancel", rvo_temp.getRsvr_code());
			if(tmp != null)
				rvo_list.add(tmp);
		}
		rvo = new ReservationVO[rvo_list.size()];
		rvo_list.toArray(rvo);
		
		ss.close();
		
		return rvo;
	}
	
	public static void cancelReservation(String rs_num, String p_code) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.update("payment.cancelPayment",p_code);
		if(cnt>0) {
			int cnt2 = ss.update("reservation.cancelReservation", rs_num);
			if(cnt2>0)
				ss.commit();
			else
				ss.rollback();
		}
		else
			ss.rollback();
		
		ss.close();
	}
	
	public static String getUid(String p_code) {
		SqlSession ss = FactoryService.getFactory().openSession();
		String uid = ss.selectOne("getUid", p_code);
		
		ss.close();
		return uid;
	}
}
