package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminDAO;

public class AdminDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String[] deleteIds = request.getParameterValues("deleteIds");
        if (deleteIds != null) {
        	AdminDAO dao = new AdminDAO();
            for (String id : deleteIds) {
                dao.deleteNotice(Integer.parseInt(id));  // 주석 추가: 삭제 메소드 호출
            }
        }
        Action adminNoticeAction = new AdminNoticeAction();
        return adminNoticeAction.execute(request, response);
    }

}
