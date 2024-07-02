package web.main.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminCpDAO;

public class AdminCpAddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		if(request.getParameter("ci_content") == null) { // 등록 실패 시 
            return "jsp/adminCoupon/adminCpAdd.jsp";
        }
		else {
			String ci_content = request.getParameter("ci_content");
			String ci_discount = request.getParameter("ci_discount");
			String ci_regi_time = request.getParameter("ci_regi_time");
			String ci_time = request.getParameter("ci_time");
			String ci_summary = request.getParameter("ci_summary");
			
			Map<String, String> map = new HashMap<>();
			map.put("ci_content", ci_content);
			map.put("ci_discount", ci_discount);
			map.put("ci_regi_time", ci_regi_time);
			map.put("ci_time", ci_time);
			map.put("ci_summary", ci_summary);
			
			AdminCpDAO.addCoupinItem(map);
			
			return "Controller?type=adminCpHome";
		}
		
	}

}
