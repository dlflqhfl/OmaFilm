package web.mybatis.dao;


import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.DailyBoxOfficeVO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.ScreeningScheduleVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class AdminDAO {
	public static int insertDailyMovie(DailyBoxOfficeVO daily, List<DailyBoxOfficeVO> dailyList) {
		SqlSession ss = FactoryService.getFactory().openSession();
		System.out.println("시작 DB저장 테스트");
		int result = 0;
		try {
			for (DailyBoxOfficeVO movie : dailyList) {
				movie.setBoxofficeType(daily.getBoxofficeType());
				movie.setShowRange(daily.getShowRange());
				result += ss.insert("dailyBoxOffice.movielist", movie);
			}
			ss.commit();
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}

	public static int checkMovie(String movieCd) {
		SqlSession ss = FactoryService.getFactory().openSession();

		int res = ss.selectOne("dailyBoxOffice.check",movieCd);
		ss.close();
		return res;
	}

	public static int insertMovieList(MovieListVO movie) {
		SqlSession ss = FactoryService.getFactory().openSession();

		int res = ss.insert("movieList.insertMovie",movie);
		if( res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return res;
	}
	public static MovieListVO[] selectMovieList(int begin, int end, String searchValue) {
		SqlSession ss = FactoryService.getFactory().openSession();

		Map<String, String> map = new HashMap<>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("searchValue", searchValue);

		List<MovieListVO> list = ss.selectList("movieList.selectMovie",map);
		System.out.println("나오냐?" +list);
		MovieListVO[] ar = null;
		if( list != null && list.size() > 0) {
			ar = new MovieListVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static int insertScreen(ScreeningScheduleVO sc) {
		SqlSession ss= FactoryService.getFactory().openSession();

		int res = ss.insert("screeningSchedule.insertScreen",sc);
		if( res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return res;
	}

	public static int updateDailyMovie(DailyBoxOfficeVO daily, List<DailyBoxOfficeVO> dailyList) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int result = 0;
		try {
			for (DailyBoxOfficeVO movie : dailyList) {
				movie.setBoxofficeType(daily.getBoxofficeType());
				movie.setShowRange(daily.getShowRange());
				result += ss.update("dailyBoxOffice.updateMovie", movie);
			}
			ss.commit();
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}

	public static int getCount() {
		SqlSession ss = FactoryService.getFactory().openSession();

		int res = ss.selectOne("movieList.count");
		ss.close();
		return res;
	}
}