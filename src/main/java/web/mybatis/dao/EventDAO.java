package web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.NoticeVO;

import java.util.List;

public class EventDAO {
	
	public static int getCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("notice.ecount");
		
		ss.close();
		
		return cnt;
	}
	
	public static NoticeVO[] getElist() {
		NoticeVO[] ear = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<NoticeVO> list = ss.selectList("notice.elist");
		if(list != null && list.size() > 0) {
			ear = new NoticeVO[list.size()];
			list.toArray(ear); //list가 가지는 모든 요소들을 ar 배열에 복사
		}
		
		ss.close();
		return ear;
	}
	
	public static NoticeVO view(String n_idx) {
		NoticeVO nvo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		nvo = ss.selectOne("notice.eview", n_idx);
		
		ss.close();
		
		return nvo;
	}


}
