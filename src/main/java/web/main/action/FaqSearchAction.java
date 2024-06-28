package web.main.action;

import web.main.util.Paging;
import web.mybatis.dao.FaqDAO;
import web.mybatis.vo.NoticeVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FaqSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//페이징 처리를 위한 객체생성
				Paging page = new Paging(5, 3);
				
				String cPage = request.getParameter("cPage");
				String n_title = request.getParameter("n_title");
				
				//전체페이지 수를 구하기
				page.setTotalRecode(FaqDAO.getsearchCount(n_title));
				
				int cnt = FaqDAO.getsearchCount(n_title);
				
				//현재페이지값 받기
				if(cPage != null) {
					//int nowPage = Integer.parseInt(cPage);
					//page.setNowPage(nowPage);
					page.setNowPage(Integer.parseInt(cPage));
					//이때!
					//게시물을 추출할 때 사용되는 begin과 end과 구해지고
					//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
					
				}else
					page.setNowPage(1);
				
				NoticeVO[] far = FaqDAO.getList(page.getBegin(), page.getEnd(), n_title);
				
				//위의 배열 ar을 jsp에서 표현하기 위해 request에 저장하자
				request.setAttribute("far", far);
				request.setAttribute("page", page);
				request.setAttribute("cnt", cnt);
				
				
				return "/jsp/serviceCenter/faq.jsp";
			}

}
