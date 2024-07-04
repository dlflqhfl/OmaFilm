package web.main.action;

import web.main.util.Paging;
import web.mybatis.dao.NoticeDAO;
import web.mybatis.vo.NoticeVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NoticeSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//페이징 처리를 위한 객체생성
		Paging page = new Paging(5, 3);
		
		String cPage = request.getParameter("cPage");
		String n_title = request.getParameter("n_title");
		String type=request.getParameter("type");
		
		//전체페이지 수를 구하기
		page.setTotalRecode(NoticeDAO.getsearchCount(n_title));
		
		int cnt = NoticeDAO.getsearchCount(n_title);
		
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
		
		NoticeVO[] nar = NoticeDAO.getList(page.getBegin(), page.getEnd(), n_title);
		System.out.println(nar.length);
		
		//위의 배열 ar을 jsp에서 표현하기 위해 request에 저장하자
		request.setAttribute("nar", nar);
		request.setAttribute("page", page);
		request.setAttribute("cnt", cnt);
		request.setAttribute("type", type);
		request.setAttribute("n_title", n_title);
		
		
		
		return "/jsp/serviceCenter/notice.jsp";
	}


}
