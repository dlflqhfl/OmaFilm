package web.main.action;

import web.main.util.Paging;
import web.mybatis.dao.NoticeDAO;
import web.mybatis.vo.NoticeVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NoticeDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Paging page = new Paging(5, 3);
		
		String cPage = request.getParameter("cPage");
		String n_idx = request.getParameter("n_idx");
		String n_title = request.getParameter("n_title");
		
		//전체페이지 수를 구하기
		page.setTotalRecode(NoticeDAO.getCount());
		
		
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
		
		NoticeVO nvo = NoticeDAO.view(page.getBegin(), page.getEnd(), Integer.parseInt(n_idx),n_title);
		
		
		//위의 배열 ar을 jsp에서 표현하기 위해 request에 저장하자
		request.setAttribute("nvo", nvo);
		request.setAttribute("page", page);
		
		return "/jsp/serviceCenter/noticedetail.jsp";
	}

}
