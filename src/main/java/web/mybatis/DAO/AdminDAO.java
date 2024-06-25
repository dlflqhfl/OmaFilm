package web.mybatis.DAO;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.DailyBoxOfficeVO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.ScreeningScheduleVO;

import java.util.HashMap;


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

	public static int insertMovieList(MovieListVO movie, ScreeningScheduleVO sc) {
	    SqlSession ss = FactoryService.getFactory().openSession();

	    int res = ss.insert("movieList.insertMovie",movie);
	    if( res > 0) {
	    	int result = ss.insert("screeningSchedule.insertScreen",sc);
	    	ss.commit();
	    } else {
	    	ss.rollback();
	    }
	    ss.close();
		return res;
	}

}
