package web.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.NoticeVO;

public class AdminSearchFreAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String searchCategory = request.getParameter("searchCategory");
        String searchTerm = request.getParameter("searchTerm");

        AdminDAO dao = new AdminDAO();
        List<NoticeVO> noticeFreList = dao.searchNotices(searchCategory, searchTerm);

        request.setAttribute("noticeFreList", noticeFreList);

        return "jsp/admin/adminFrequently.jsp";
        
	}

}
