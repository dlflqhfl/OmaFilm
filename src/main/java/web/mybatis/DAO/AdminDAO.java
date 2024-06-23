package web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.MovieListVO;

import java.util.HashMap;


//MoviedataVO mvo = SqlSession.selectOne("movie.getMovieCd", movie.getMovieCd());
//이건 나중에 if문 insert할때 적용

public class AdminDAO {
	
	public static int check(MovieListVO movielist) {
		System.out.println("세션 테스트1");
		SqlSession ss = FactoryService.getFactory().openSession();
		//여기서 에러??
		System.out.println("겟무비정보 테스트1");
		String chk= ss.selectOne("movie.chk", movielist.getMovieCd());
		System.out.println("겟무비정보 테스트2"+movielist.getMovieCd());
		if(chk != null) {	//만약 chk가 있다면 addupdate함수를 호출
			int updated = addupdate(movielist.getMovieCd(), movielist.getMovieNm()
	                ,movielist.getPrdtYear(), movielist.getShowTm(),movielist.getOpenDt(),
	                movielist.getTypeNm(), movielist.getNations(),movielist.getNationNm(),
	                movielist.getGenreNm(),movielist.getDirectors(),movielist.getPeopleNm(),movielist.getPeopleNmEn(),
	                movielist.getActors(),movielist.getCast(),movielist.getCastEn(),movielist.getShowTypes(),
	                movielist.getShowTypeGroupNm(),movielist.getShowTypeNm(),movielist.getAudits(),movielist.getAuditNo(),
	                movielist.getWatchGradeNm()
					);
			ss.close();
			return updated;
		}
		else {	//만약 chk가 없다면 addinsert 함수를 호출
			int inserted = addinsert(movielist.getMovieCd(), movielist.getMovieNm()
	                ,movielist.getPrdtYear(), movielist.getShowTm(),movielist.getOpenDt(),
	                movielist.getTypeNm(), movielist.getNations(),movielist.getNationNm(),
	                movielist.getGenreNm(),movielist.getDirectors(),movielist.getPeopleNm(),movielist.getPeopleNmEn(),
	                movielist.getActors(),movielist.getCast(),movielist.getCastEn(),movielist.getShowTypes(),
	                movielist.getShowTypeGroupNm(),movielist.getShowTypeNm(),movielist.getAudits(),movielist.getAuditNo(),
	                movielist.getWatchGradeNm());
			ss.close();
			return inserted;
		}
	}
	public static int addinsert(String movieCd,String movieNm,
			String prdtYear,String showTm, String openDt,
			String typeNm,String nations,String nationNm,
			String genreNm,String directors,String peopleNm,String peopleNmEn,
			String actors,String cast,String castEn,String showTypes,
			String showTypeGroupNm,String showTypeNm,String audits,String auditNo,
			String watchGradeNm) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("movieCd",movieCd);
		map.put("movieNm",movieNm);
		
		map.put("prdtYear",prdtYear);
		map.put("showTm",showTm);
		map.put("openDt",openDt);
		
		map.put("typeNm",typeNm);
		map.put("nations",nations);
		map.put("nationNm",nationNm);

		map.put("genreNm",genreNm);
		map.put("directors",directors);
		map.put("peopleNm",peopleNm);
		map.put("peopleNmEn",peopleNmEn);

		map.put("actors",actors);
		map.put("cast",cast);
		map.put("castEn",castEn);
		map.put("showTypes",showTypes);
		
		map.put("showTypeGroupNm",showTypeGroupNm);
		map.put("showTypeNm",showTypeNm);
		map.put("audits",audits);
		map.put("auditNo",auditNo);
		
		map.put("watchGradeNm",watchGradeNm);
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("movie.insertMovie", map);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		
		ss.close();
		return cnt;
	}
	public static int addupdate(String movieCd,String movieNm,
			String prdtYear,String showTm, String openDt,
			String typeNm,String nations,String nationNm,
			String genreNm,String directors,String peopleNm,String peopleNmEn,
			String actors,String cast,String castEn,String showTypes,
			String showTypeGroupNm,String showTypeNm,String audits,String auditNo,
			String watchGradeNm) {
		
		HashMap<String, String> map = new HashMap<>();
	    map.put("movieCd", movieCd);
	    map.put("movieNm", movieNm);
	    map.put("prdtYear", prdtYear);
	    map.put("showTm", showTm);
	    map.put("openDt", openDt);
	    map.put("typeNm", typeNm);
	    map.put("nations", nations);
	    map.put("nationNm", nationNm);
	    map.put("genreNm", genreNm);
	    map.put("directors", directors);
	    map.put("peopleNm", peopleNm);
	    map.put("peopleNmEn", peopleNmEn);
	    map.put("actors", actors);
	    map.put("cast", cast);
	    map.put("castEn", castEn);
	    map.put("showTypes", showTypes);
	    map.put("showTypeGroupNm", showTypeGroupNm);
	    map.put("showTypeNm", showTypeNm);
	    map.put("audits", audits);
	    map.put("auditNo", auditNo);
	    map.put("watchGradeNm", watchGradeNm);
	    
	    SqlSession ss = FactoryService.getFactory().openSession();
	    int cnt = ss.update("movie.updateMovie", map);
	    if (cnt > 0)
	        ss.commit();
	    else
	        ss.rollback();
	    ss.close();
	    return cnt;
	}
}
