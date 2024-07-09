package web.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.main.util.Paging;
import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.NoticeVO;

public class AdminFrequentlyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		AdminDAO noticeDAO = new AdminDAO();	//먼저 DB정보 받기
        String nf_none = request.getParameter("nf_none");  // 파라미터로 n_none 값이 넘어오는 경우
        List<NoticeVO> noticeFreList = noticeDAO.getNoticeFreList(nf_none);
		
        request.setAttribute("noticeFreList", noticeFreList);
        
        Paging page = new Paging(10,5);
  		
  		String cPage = request.getParameter("cPage");
  		if(noticeFreList !=null)
  			page.setTotalRecode(noticeFreList.size());
  		if(cPage !=null)
  			page.setNowPage(Integer.parseInt(cPage));
  		else
  			page.setNowPage(1);
  		request.setAttribute("page", page);
        
        
		return "jsp/admin/adminFrequently.jsp";
	}

}
