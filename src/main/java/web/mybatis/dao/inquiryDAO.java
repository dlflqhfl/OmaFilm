package web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.InquiryVO;
import web.mybatis.vo.IqCommentVO;
import web.mybatis.vo.NoticeVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class inquiryDAO {
	

	  public static InquiryVO[] searchList(Map<String, Object> map) {
		  InquiryVO[] ivo = null;
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			List<InquiryVO> list = ss.selectList("inquiry.search",map);
			if(list != null && list.size() > 0) {
				ivo = new InquiryVO[list.size()];
				list.toArray(ivo);
			}
			ss.close();
				return ivo;	
	  }
	  
	  public static InquiryVO inquiryIdx(String iq_idx) {
		  SqlSession ss= FactoryService.getFactory().openSession();
		 
		  InquiryVO iqvo = ss.selectOne("inquiry.idx",iq_idx);
		  System.out.println("화이팅!"+iqvo);
		  ss.close();
		  
		  return iqvo;
		  
	  }
	  
	  public static IqCommentVO inquiryComment(String iq_idx) {
		  SqlSession ss= FactoryService.getFactory().openSession();
		  
		  IqCommentVO comment = ss.selectOne("inquiry.comment", iq_idx);
		  System.out.println("아자아자!"+comment);
		    ss.close();
		    
		    return comment;
	  }
	  
	  public static int getCountIq(int u_code) {
		  
		SqlSession ss = FactoryService.getFactory().openSession();
	  
		int cnt = ss.selectOne("inquiry.pageCount",u_code);
		System.out.println("전체 게시물 수:"+cnt);
		ss.close();
		
		return cnt;
	}
	  
	  public static InquiryVO[] getListIq(int begin, int end, String inquiryTitle, int u_code) {
			InquiryVO[] ivo = null;
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("begin", String.valueOf(begin));
			map.put("end", String.valueOf(end));
			map.put("inquiryTitle",inquiryTitle);
			map.put("u_code", u_code);
			
			List<InquiryVO> list = ss.selectList("inquiry.iqList", map);
			if(list != null && list.size() > 0) {
				ivo = new InquiryVO[list.size()];
				list.toArray(ivo); //list가 가지는 모든 요소들을 ar 배열에 복사
			}
			ss.close();
			return ivo;
		}
		
	  
	  public static InquiryVO[] myHomeinquiryList(int u_code) {

		  InquiryVO[] ivo = null;
		  
		  SqlSession session = FactoryService.getFactory().openSession();
		  
		  List<InquiryVO> list = session.selectList("inquiry.myHomeList",u_code);
			  if (list != null && list.size() > 0) {
			        ivo = list.toArray(new InquiryVO[list.size()]);
			    } else {
			        ivo = new InquiryVO[0]; // 빈 배열 생성
			    }
			  
			session.close(); // 세션 닫기
			  
			return ivo;
	  }

	public static int iqSearchCount(String inquiryTitle, int u_code) {
		 int totalCount = 0;
		    
		    SqlSession ss = FactoryService.getFactory().openSession();
		    
		    try {
		        HashMap<String, String> map = new HashMap<>();
		        map.put("inquiryTitle", inquiryTitle);
		        map.put("u_code", String.valueOf(u_code));
		        
		        totalCount = ss.selectOne("inquiry.searchCount", map);
		        System.out.println("요건?"+totalCount);
		    } finally {
		        ss.close();
		    }
		    
		    return totalCount;
		}
}