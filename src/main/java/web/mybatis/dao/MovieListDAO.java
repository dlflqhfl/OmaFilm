package web.mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.MovieListVO;


public class MovieListDAO {
	
	public static int getCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("movieList.count");
		
		ss.close();
		
		return cnt;
	}
	
	public static int getsearchCount(String movieNm) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("movieList.searchcount", movieNm);
		
		ss.close();
		
		return cnt;
	}
	
	public static MovieListVO[] getList(int begin, int end, String movieNm) {
		MovieListVO[] mar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		if(movieNm != null)
		map.put("movieNm", movieNm.trim());
		System.out.println("DAO 출력");
		System.out.println(begin);
		System.out.println(end);
		System.out.println(movieNm);
		
		List<MovieListVO> list = ss.selectList("movieList.list", map);
		System.out.println("리스트 사이즈 출력"+list.size());
		System.out.println(list);
		
		if(list != null && list.size() > 0) {
			mar = new MovieListVO[list.size()];
			System.out.println("MAR 길이"+mar.length);
			list.toArray(mar); //list가 가지는 모든 요소들을 ar 배열에 복사
		}
		
		return mar;
	}
	
	public static MovieListVO[] getRlist(int begin, int end, String movieNm) {
		MovieListVO[] mar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("movieNm", movieNm);
		
		List<MovieListVO> list = ss.selectList("movieList.rlist", map);
		if(list != null && list.size() > 0) {
			mar = new MovieListVO[list.size()];
			list.toArray(mar); //list가 가지는 모든 요소들을 ar 배열에 복사
		}
		
		return mar;
	}


}
