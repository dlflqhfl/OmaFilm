package web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.AdminCpDAO;
import web.mybatis.vo.CouponItemVO;

public class AdminCpHomeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String ci_code=request.getParameter("delCode");
		if (ci_code != null) {
			AdminCpDAO.delCouponItem(ci_code);
		}
		
		CouponItemVO[] arr = AdminCpDAO.getCouponItem();
		
		request.setAttribute("cpItemArr", arr);
		
		return "jsp/adminCoupon/adminCpHome.jsp";
	}

}
