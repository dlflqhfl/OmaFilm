package web.mybatis.dao;

import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.DailyBoxOfficeVO;

import java.util.HashMap;
import java.util.List;


public class MovieDAO {

    public static int getCount() {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("dailyBoxOffice.count");

        ss.close();

        return cnt;
    }

    public static int getsearchCount(String movieNm) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("dailyBoxOffice.searchcount", movieNm);

        ss.close();

        return cnt;
    }

    public static DailyBoxOfficeVO[] getList(int begin, int end, String movieNm) {
        DailyBoxOfficeVO[] mar = null;

        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String, String> map = new HashMap<>();
        map.put("begin", String.valueOf(begin));
        System.out.println(begin);
        map.put("end", String.valueOf(end));
        System.out.println(end);
        map.put("movieNm", movieNm);
        System.out.println(movieNm);

        List<DailyBoxOfficeVO> list = ss.selectList("dailyBoxOffice.list", map);
        if(list != null && list.size() > 0) {
            mar = new DailyBoxOfficeVO[list.size()];
            list.toArray(mar); //list가 가지는 모든 요소들을 ar 배열에 복사
        }

        return mar;
    }

}
