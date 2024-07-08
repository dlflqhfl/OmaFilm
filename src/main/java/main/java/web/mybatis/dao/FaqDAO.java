package main.java.web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.NoticeVO;

import java.util.HashMap;
import java.util.List;

public class FaqDAO {
	
	public static int getCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("notice.fcount");
		
		ss.close();
		
		return cnt;
	}
	
	public static int getsearchCount(String n_title) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("notice.searchfcount", n_title);
		
		ss.close();
		
		return cnt;
	}
	
	public static NoticeVO[] getList(int begin, int end, String n_title) {
		NoticeVO[] far = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("n_title", n_title);
		
		List<NoticeVO> list = ss.selectList("notice.flist", map);
		if(list != null && list.size() > 0) {
			far = new NoticeVO[list.size()];
			list.toArray(far); //list가 가지는 모든 요소들을 ar 배열에 복사
		}
		
		ss.close();
		return far;
	}
	
}
