package main.java.web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.WithDrawalDAO;
import web.mybatis.vo.MemberVO;

public class WithDrawalSuccessAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("호잇");
		Object obj = request.getSession().getAttribute("mvo");
        MemberVO mvo = (MemberVO) obj;
        
        if (mvo != null) {
            int u_code = mvo.getU_code();
            
            int updateSuccess = WithDrawalDAO.updateMemberStatus(u_code);
            System.out.println("나올리가 있겠니?"+updateSuccess);
            	if (updateSuccess > 0) {
                    // 탈퇴 성공 시 세션 무효화 및 로그아웃 처리
                    request.getSession().invalidate();
                    return "jsp/myPage/withDrawalSuccess.jsp";
                }else {
                    // 탈퇴 실패 시 에러 처리 (예: 오류 메시지 표시)
                    return "jsp/myPage/personInfor.jsp"; // 회원 정보 페이지 등으로 이동
                }
            }else {
        return "jsp/myPage/personInfor.jsp";  
    }
	}
}