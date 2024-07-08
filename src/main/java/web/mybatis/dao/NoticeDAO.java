package web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.NoticeVO;

import java.util.HashMap;
import java.util.List;

public class NoticeDAO {
	
	public static int getCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("notice.count");
		
		ss.close();
		
		return cnt;
	}
	
	public static int getsearchCount(String n_title) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("notice.searchcount", n_title);
		
		ss.close();
		
		return cnt;
	}
	
	public static NoticeVO[] getList(int begin, int end, String n_title) {
		NoticeVO[] nar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("n_title", n_title);
		
		List<NoticeVO> list = ss.selectList("notice.list", map);
		if(list != null && list.size() > 0) {
			nar = new NoticeVO[list.size()];
			list.toArray(nar); //list가 가지는 모든 요소들을 ar 배열에 복사
		}
		ss.close();
		return nar;
	}
	
	public static NoticeVO view(int begin, int end, 
			int n_idx, String n_title) {
		NoticeVO nvo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, Object> map = new HashMap<>();
		
		if (n_idx != 0) { 
	        map.put("n_idx", n_idx); 
	    } else { // n_idx가 0인 경우 (목록 페이지)
	        map.put("begin", begin);
	        map.put("end", end);
	        if (n_title != null && !n_title.isEmpty()) { // 검색어가 있을 경우 추가
	            map.put("n_title", n_title);
	        }

	    }
		
		nvo = ss.selectOne("notice.view", map);
		
		ss.close();
		return nvo;
	}

	
}
