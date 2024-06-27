package web.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import web.mybatis.service.FactoryService;
import web.mybatis.vo.InquiryVO;

public class inquiryDAO {
	
	public static InquiryVO[] inquiryList(String text) {
		
		InquiryVO[] ivo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<InquiryVO> list = ss.selectList("inquiry.all",text);
		if(list != null && list.size() > 0) {
			ivo = new InquiryVO[list.size()];
			list.toArray(ivo);
		}
			
		
		return ivo;		
	}

	  public static int totalCountTitle(String text) {
	        
		  SqlSession session = FactoryService.getFactory().openSession();
	        try {
	            return session.selectOne("inquiry.count", text);
	        } finally {
	            session.close();
	        }
	    }
	}


