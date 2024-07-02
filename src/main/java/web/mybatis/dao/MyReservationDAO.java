package web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.ReservationVO;
import web.mybatis.vo.ReserverVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.MovieListVO;
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

	public static ReservationVO[] getReservationList(int u_code, String searchKey, String selectedMonth) {
		ReservationVO[] rvo = null;
		SqlSession ss = FactoryService.getFactory().openSession();

		List<ReservationVO> rvo_list = new ArrayList<ReservationVO>();
		Map<String, String> map2 = new HashMap<>();

		// searchKey가 null이 아닐 때
		List<MovieListVO> m_list=null;
		if(searchKey != null) { //영화 이름 검색어가 있을 때 - > 결과값이 많을 땐
			m_list = ss.selectList("movieList.searchMovie", searchKey);

		}

		List<ReserverVO> list; //예약자 리스트

		// selectedMonth가 null이 아닐 때
		if(selectedMonth!=null) { //선택된 날짜가 있을 때
			Map<String, String> map = new HashMap<String, String>();
			map.put("u_code", String.valueOf(u_code));
			map.put("yearAndMonth", selectedMonth);
			//예약자 찾기(u_code & rsvr_time -> rsvr_code)
			list = ss.selectList("reserver.getMonthRsvrList", map);

		}
		else { //선택된 날짜가 없을 때
			list = ss.selectList("reserver.getAllRsvrList", u_code);
		}

		if(m_list!=null) {
			for(MovieListVO mvo : m_list) {
				map2.put("movieCd", mvo.getMovieCd());
				//rsvr_code -> reservationVO
				for(ReserverVO rvo_temp : list) {
					String temp = String.valueOf(rvo_temp.getRsvr_code());
					System.out.println(temp);

					map2.put("rsvr_code", temp);
					System.out.println(map2.size());
					ReservationVO tmp = ss.selectOne("reservation.searchReservation", map2);
					if(tmp != null) {
						rvo_list.add(tmp);
					}

				}
			}
		} else {
			for(ReserverVO rvo_temp : list) {
				String temp = String.valueOf(rvo_temp.getRsvr_code());
				System.out.println(temp);

				map2.put("rsvr_code", temp);
				System.out.println(map2.size());
				ReservationVO tmp = ss.selectOne("reservation.searchReservation", map2);
				if(tmp != null) {
					rvo_list.add(tmp);
				}
			}
		}
		rvo = new ReservationVO[rvo_list.size()];
		rvo_list.toArray(rvo);

		ss.close();

		return rvo;
	}

	public static ReservationVO[] getCancelList(int u_code, String selectedMonth) {
		ReservationVO[] rvo = null;
		SqlSession ss = FactoryService.getFactory().openSession();

		List<ReservationVO> rvo_list = new ArrayList<ReservationVO>();

		Map<String, String> map2 = new HashMap<>();

		List<ReserverVO> list; //예약자 리스트

		// selectedMonth가 null이 아닐 때
		if(selectedMonth!=null) { //선택된 날짜가 있을 때
			Map<String, String> map = new HashMap<String, String>();
			map.put("u_code", String.valueOf(u_code));
			map.put("yearAndMonth", selectedMonth);
			//예약자 찾기(u_code & rsvr_time -> rsvr_code)
			list = ss.selectList("reserver.getMonthRsvrList", map);

		}
		else { //선택된 날짜가 없을 때
			list = ss.selectList("reserver.getAllRsvrList", u_code);
		}

		for(ReserverVO rvo_temp : list) {
			String temp = String.valueOf(rvo_temp.getRsvr_code());

			map2.put("rsvr_code", temp);

			ReservationVO tmp = ss.selectOne("reservation.searchCancel", map2);
			if(tmp != null) {
				rvo_list.add(tmp);
			}
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