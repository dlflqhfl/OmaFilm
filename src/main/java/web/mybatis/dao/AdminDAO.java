package web.mybatis.dao;


import org.apache.ibatis.session.SqlSession;
import web.mybatis.service.FactoryService;
import web.mybatis.vo.DailyBoxOfficeVO;
import web.mybatis.vo.InquiryVO;
import web.mybatis.vo.IqCommentVO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.NoticeVO;
import web.mybatis.vo.ScreeningScheduleVO; 

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class AdminDAO {
	public static int insertDailyMovie(DailyBoxOfficeVO daily, List<DailyBoxOfficeVO> dailyList) {
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

	public static int checkMovie(String movieCd) {
		SqlSession ss = FactoryService.getFactory().openSession();

		int res = ss.selectOne("dailyBoxOffice.check",movieCd);
		ss.close();
		return res;
	}

	public static int insertMovieList(MovieListVO movie) {
		SqlSession ss = FactoryService.getFactory().openSession();

		int res = ss.insert("movieList.insertMovie",movie);
		if( res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return res;
	}
	public static MovieListVO[] selectMovieList(String searchValue) {
		SqlSession ss = FactoryService.getFactory().openSession();

		Map<String, String> map = new HashMap<>();
		map.put("searchValue", searchValue);

		List<MovieListVO> list = ss.selectList("movieList.getDBMovieList",map);
		System.out.println("나오냐?" +list);
		MovieListVO[] ar = null;
		if( list != null && list.size() > 0) {
			ar = new MovieListVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}

	public static int insertScreen(ScreeningScheduleVO sc) {
		SqlSession ss= FactoryService.getFactory().openSession();

		int res = ss.insert("screeningSchedule.insertScreen",sc);
		if( res > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return res;
	}

	public static int updateDailyMovie(DailyBoxOfficeVO daily, List<DailyBoxOfficeVO> dailyList) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int result = 0;
		try {
			for (DailyBoxOfficeVO movie : dailyList) {
				movie.setBoxofficeType(daily.getBoxofficeType());
				movie.setShowRange(daily.getShowRange());
				result += ss.update("dailyBoxOffice.updateMovie", movie);
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

	public static int getCount() {
		SqlSession ss = FactoryService.getFactory().openSession();

		int res = ss.selectOne("movieList.count");
		ss.close();
		return res;
	}
	
	
	//--------------------------------------------------------
	
	public static int insertComment(IqCommentVO Comment) {
		int send=0;
		SqlSession ss = FactoryService.getFactory().openSession();
		try {
			
			send=ss.insert("iqComment.insertComment",Comment);
			ss.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("전송실패");
			e.printStackTrace();
			ss.rollback();
		}
		ss.close();
		return send;
	}
	
	public static int insertEvent(NoticeVO notice) {
		// TODO Auto-generated method stub
		SqlSession ss = FactoryService.getFactory().openSession();
        int result = 0;
        try {
            result = ss.insert("notice.insertEvent", notice);
            if (result > 0) {
            	ss.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
            ss.rollback();
        } finally {
            ss.close();
        }
        return result;
	}
	
	public static int insertNotice(NoticeVO notice) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int result = 0;
        try {
            result = ss.insert("notice.insertNotice", notice);
            if (result > 0) {
            	ss.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
            ss.rollback();
        } finally {
            ss.close();
        }
        return result;
    }

	//1대1 문의
	public static List<InquiryVO> getInquiryList(String iq_none){
		System.out.println("DAO 테스트");
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<InquiryVO> inquiryList=null;
		try {
			//여기서 바꾸기
			inquiryList=ss.selectList("inquiry.inquiryList");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		ss.close();
		
		
		return inquiryList;
	}


	public static InquiryVO getInquiry(int iq_idx) {
		// TODO Auto-generated method stub
		System.out.println("DAOcomment 테스트");
		SqlSession ss = FactoryService.getFactory().openSession();
		System.out.println("DB접속 테스트");
		InquiryVO inquiry = null;
		try {
			inquiry=ss.selectOne("inquiry.getInquiry",iq_idx);
		}
		catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		ss.close();
		return inquiry;
	}
	
	public static int deleteNotice(int n_idx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int result = 0;
        try {
            result = ss.delete("notice.deleteNotice", n_idx);
            if (result > 0) {
                ss.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
            ss.rollback();
        } finally {
            ss.close();
        }
        return result;
    }

	public static int deleteEventNotice(int parseInt) {
		// TODO Auto-generated method stub
		SqlSession ss = FactoryService.getFactory().openSession();
        int result = 0;
        try {
            result = ss.delete("notice.deleteEvent",parseInt);
            if (result > 0) {
                ss.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
            ss.rollback();
        } finally {
            ss.close();
        }
        return result;
	}

	public static List<NoticeVO> getEventList(String n_none){
		SqlSession ss = FactoryService.getFactory().openSession();
		List<NoticeVO> noticeList =null;
		try {
			noticeList =ss.selectList("notice.eventList",n_none);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		ss.close();
	return noticeList;
	}
	
	//자주묻는 질문 
	public static List<NoticeVO> getNoticeFreList(String nf_none){
		SqlSession ss = FactoryService.getFactory().openSession();
		List<NoticeVO> noticeFreList =null;
		try {
			noticeFreList =ss.selectList("notice.noticeFreList",nf_none);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		ss.close();
	return noticeFreList;
	}

	//공지사항검색
	public static List<NoticeVO> searchNotices(String searchCategory, String searchTerm) {
		// TODO Auto-generated method stub
		SqlSession ss = FactoryService.getFactory().openSession();
		List<NoticeVO> noticeList = null;
        try {
            Map<String, String> params = new HashMap<>();
            params.put("searchCategory", searchCategory);
            params.put("searchTerm", searchTerm);
            noticeList = ss.selectList("notice.searchList", params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
         ss.close();
         
         
        return noticeList;
	}

	public static List<NoticeVO> searchEvent(String searchCategory, String searchTerm) {
		// TODO Auto-generated method stub
		SqlSession ss = FactoryService.getFactory().openSession();
		List<NoticeVO> noticeList = null;
        try {
            Map<String, String> params = new HashMap<>();
            params.put("searchCategory", searchCategory);
            params.put("searchTerm", searchTerm);
            noticeList = ss.selectList("notice.searchEventList", params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
         ss.close();
         
         
        return noticeList;
	}
	
	public static List<InquiryVO> searchInquiry(String searchCategory, String searchTerm) {
		// TODO Auto-generated method stub
		SqlSession ss = FactoryService.getFactory().openSession();
		List<InquiryVO> inquiryList = null;
        try {
            Map<String, String> params = new HashMap<>();
            params.put("searchCategory", searchCategory);
            params.put("searchTerm", searchTerm);
            inquiryList = ss.selectList("inquiry.inquirySearchList", params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
         ss.close();
         
        return inquiryList;
	}

	//Notice 받는 DAO
	public static List<NoticeVO> getNoticeList(String n_none){
		SqlSession ss = FactoryService.getFactory().openSession();
		List<NoticeVO> noticeList =null;
		try {
			noticeList =ss.selectList("notice.noticeList",n_none);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		ss.close();
		return noticeList;
	}
}