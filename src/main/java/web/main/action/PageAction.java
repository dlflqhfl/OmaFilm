package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.main.util.Paging;
import web.mybatis.dao.MovieListDAO;
import web.mybatis.dao.MovieReviewDAO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.MovieListVO;

public class PageAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("확인");
        Object obj = request.getSession().getAttribute("mvo");
        MemberVO member = (MemberVO) obj;
        
        Paging page = new Paging(6, 3);

        // 영화 상세정보 가져오기
        String movieCd = request.getParameter("movieCd");
        String cPage = request.getParameter("cPage");
                
        page.setTotalRecode(MovieReviewDAO.selectReviewCount(movieCd));
        
        
        //현재페이지값 받기
		if(cPage != null) {
			//int nowPage = Integer.parseInt(cPage);
			//page.setNowPage(nowPage);
			page.setNowPage(Integer.parseInt(cPage));
			//이때!
			//게시물을 추출할 때 사용되는 begin과 end과 구해지고
			//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
			
		}else {
			page.setNowPage(1);
		}
		
        
        request.setAttribute("page", page);
        
        
		return "jsp/movie/movieReviewPage.jsp";
	}

}
