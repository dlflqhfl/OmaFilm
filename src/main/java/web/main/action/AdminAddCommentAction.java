package web.main.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminDAO; 
import web.mybatis.vo.IqCommentVO;

public class AdminAddCommentAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("댓글답변 테스트 시작");
		int iq_Idx = -1;
        String idxParam = request.getParameter("iq_idx");
        if (idxParam != null && !idxParam.isEmpty()) {
            try {
                iq_Idx = Integer.parseInt(idxParam);
            } catch (NumberFormatException e) {
                System.out.println("iq_idx 파라미터의 형식이 잘못되었습니다.");
                return "jsp/admin/error.jsp"; // 에러 페이지로 리다이렉트
            }
        }
		 String comm_content = request.getParameter("answer");
		 String comm_title=request.getParameter("title");
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String comm_time = dateFormat.format(new Date());
		if(comm_content ==null ||comm_content.isEmpty()) {
			System.out.println("답변 없습니다");
            return "jsp/admin/adminAddComment.jsp";
		}
		IqCommentVO iqComm = new IqCommentVO();
		iqComm.setComm_content(comm_content);
		iqComm.setComm_time(comm_time);
		iqComm.setIq_idx(iq_Idx);
		iqComm.setComm_title(comm_title);
		AdminDAO dao=new AdminDAO();
		dao.insertComment(iqComm);
		System.out.println("댓글답변 테스트 끝");
		
		
		Action adminInquiryAction = new AdminInquiryAction();
        return adminInquiryAction.execute(request, response);
	}

}
