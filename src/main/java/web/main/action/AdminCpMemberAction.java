package web.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminCpDAO;
import web.mybatis.vo.MemberVO;

public class AdminCpMemberAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		if(request.getParameter("insertU_code[]") != null) {
            String[] u_code = request.getParameterValues("insertU_code[]");
            String ci_code = request.getParameter("ci_code");
            System.out.println("ci_code : " + ci_code);
            for(int i=0; i<u_code.length; i++) {
            	System.out.println("u_code : " + u_code[i]);
                AdminCpDAO.insertU_code(ci_code, u_code[i]);
            }
        }
		
		
		//회원 정보 찾기
		MemberVO[] memlsit = AdminCpDAO.getMemList();
		
		request.setAttribute("memlist", memlsit);
		
		String ci_code = request.getParameter("ci_code");
		
		List<String> list = AdminCpDAO.getU_code(ci_code);
		
		request.setAttribute("ucodelist", list);
		
		return "jsp/adminCoupon/adminCpMember.jsp";
	}

}
