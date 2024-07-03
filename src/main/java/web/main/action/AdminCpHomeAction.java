package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminCpDAO;
import web.mybatis.vo.CouponItemVO;

public class AdminCpHomeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		CouponItemVO[] arr;
		String delCode=request.getParameter("delCode");
		String searchType = request.getParameter("searchType");
		if (delCode != null) {
			AdminCpDAO.delCouponItem(delCode);
			arr = AdminCpDAO.getCouponItem();
			request.setAttribute("cpItemArr", arr);
		}
		else if(searchType != null) {
			String searchValue = request.getParameter("searchValue");
			arr = AdminCpDAO.searchCouponItem(searchType, searchValue);
			request.setAttribute("cpItemArr", arr);
		}
		else {
			arr = AdminCpDAO.getCouponItem();
			request.setAttribute("cpItemArr", arr);
		}
		
		return "jsp/adminCoupon/adminCpHome.jsp";
	}

}
