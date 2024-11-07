package web.mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.ReviewVO;

public class MovieReviewDAO {
	public static int insertReview(ReviewVO rvo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("review.insertReview",rvo);
		
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
		
		return cnt;
	}


	public static int updateReview(String r_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		 int result = ss.update("review.updateStatus", r_idx);
	        System.out.println("result"+result);
	        if(result >0)
	        	ss.commit();
	        else
	        	ss.rollback();
	        
	        ss.close();
	        return result;
	}

	public static int updateRecomm(String r_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int result = ss.update("review.updateRecomm",r_idx);
		System.out.println("result2"+result);
			if(result > 0)
				ss.commit();
			else
				ss.rollback();
			
			ss.close();
		
		return result;
	}

	public static List<ReviewVO> selectLatestReview(Map<String, String> map2) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<ReviewVO> list = ss.selectList("review.selectLatestReview",map2);
		
		ss.close();
		
		return list;
	}

	public static List<ReviewVO> selectGradeReview(Map<String, String> map2) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<ReviewVO> list = ss.selectList("review.selectGradeReview",map2);
		
		ss.close();
		
		return list;
	}

	public static List<ReviewVO> selectRecommReview(Map<String, String> map2) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<ReviewVO> list = ss.selectList("review.selectRecommReview",map2);
		
		ss.close();
		
		return list;
	}
	
	public static int selectReviewCount(String movieCd) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.selectOne("review.selectReviewCount",movieCd);
		
		ss.close();
		
		return cnt;
		
	}


}
	

