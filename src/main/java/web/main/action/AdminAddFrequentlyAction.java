package web.main.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminDAO;
import web.mybatis.dao.NoticeDAO;
import web.mybatis.vo.NoticeVO;

public class AdminAddFrequentlyAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String title = request.getParameter("title");
        String content = request.getParameter("content");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //여기서 값을 받아서 넣을 계획입니다
        String n_time = dateFormat.format(new Date());
        if (title == null || title.isEmpty() ||
	            content == null || content.isEmpty()) {
        		System.out.println("값 없음");
	            return "jsp/admin/adminAddFrequently.jsp";
	        }
        //만약에 해당 값이 하나도 없다면 그냥 바로 넘기기
        System.out.println("값 있음");
        String nt_ct_code = "2";	//일단 공지사항은 1로 고정=>향후 의논에 따라 변경 할 수 있음
        int n_status=0;
        
        NoticeVO notice = new NoticeVO();
        notice.setN_title(title);
        notice.setN_content(content);
        notice.setN_time(n_time);
        notice.setNt_ct_code(nt_ct_code);
        notice.setN_status(n_status);

        AdminDAO dao = new AdminDAO();
        dao.insertNotice(notice);
        System.out.println("공지등록성공");
        
		return "jsp/admin/adminAddFrequently.jsp";
	}
}
