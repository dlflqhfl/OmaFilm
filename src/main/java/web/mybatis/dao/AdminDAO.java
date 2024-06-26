package web.mybatis.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.DailyBoxOfficeVO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.ScreeningScheduleVO;


public class AdminDAO {
	public int insertDailyMovie(DailyBoxOfficeVO daily, List<DailyBoxOfficeVO> dailyList) {
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
	public static MovieListVO[] selectMovieList() {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<MovieListVO> list = ss.selectList("movieList.selectMovie");
		MovieListVO[] ar = null;
		if( list != null && list.size() > 0) {
			ar = new MovieListVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}

	public static int insertScreen(ScreeningScheduleVO sc) {
		SqlSession ss= FactoryService.getFactory().openSession();
		
		int res = ss.insert("movieList.insertScreen",sc);
		if( res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
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



}
