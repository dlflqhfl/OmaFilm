package web.main.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.main.util.Paging;
import web.mybatis.dao.AdminCpDAO;
import web.mybatis.vo.MemberVO;

public class AdminCpMemberAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberVO[] memlist;
		
		if(request.getParameter("insertU_code[]") != null) {
            String[] u_code = request.getParameterValues("insertU_code[]");
            String ci_code = request.getParameter("ci_code");
            System.out.println("ci_code : " + ci_code);
            for(int i=0; i<u_code.length; i++) {
            	System.out.println("u_code : " + u_code[i]);
                AdminCpDAO.insertU_code(ci_code, u_code[i]);
            }
            memlist = AdminCpDAO.getMemList();
    		
    		request.setAttribute("memlist", memlist);
    		
        }else if(request.getParameter("searchType")!=null) {
        	String searchType = request.getParameter("searchType");
        	String searchValue = request.getParameter("searchValue");
        	memlist = AdminCpDAO.searchMemItem(searchType, searchValue);
			request.setAttribute("memlist", memlist);
        }
        else {
        	//회원 정보 찾기
        	memlist = AdminCpDAO.getMemList();
    		request.setAttribute("memlist", memlist);
        }
		
		String ci_code = request.getParameter("ci_code");
		
		List<String> list = AdminCpDAO.getU_code(ci_code);
		
		request.setAttribute("ucodelist", list);
		
		//rvo 페이징 처리
		Paging page = new Paging(10,5);
		
		String cPage = request.getParameter("cPage");
		if(memlist !=null)
			page.setTotalRecode(memlist.length);
		if(cPage !=null)
			page.setNowPage(Integer.parseInt(cPage));
		else
			page.setNowPage(1);
		request.setAttribute("page", page);
		
		return "jsp/adminCoupon/adminCpMember.jsp";
	}

}
