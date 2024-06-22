package web.main.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.mybatis.dao.PaymentDAO;
import web.mybatis.vo.MemberVO;

public class PayCompleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 세션 객체 가져오기
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		
		int rsvr_code=0;
		//예매자 저장
		if(mvo != null) { //예매자가 회원일 때
			rsvr_code = PaymentDAO.saveMem(mvo.getU_code());
		}else { //예매자가 비회원일 때
			Map<String, String> map = new HashMap<>();
			String non_name = request.getParameter("non_name");
			String non_phone = request.getParameter("non_phone");
			String non_address = request.getParameter("non_address");
			String non_postal_code = request.getParameter("non_postal_code");
			String non_email = request.getParameter("non_email");
			map.put("non_name", non_name);
			map.put("non_phone", non_phone);
			map.put("non_address", non_address);
			map.put("non_postal_code", non_postal_code);
			map.put("non_email", non_email);
			
			rsvr_code = PaymentDAO.saveNonMem(map);
		}
		
		int p_code =0; 
		//결제 내역 저장
		if(rsvr_code >0) {
			Map<String, String> map = new HashMap<>();
			//String cp_no = request.getParameter("cp_no"); //쿠폰
			String p_method = request.getParameter("p_method");
			String p_content = request.getParameter("p_content");
			String p_ex_price = request.getParameter("p_ex_price");
			String p_tt_price = request.getParameter("p_tt_price");
			String merchant_uid = request.getParameter("merchant_uid");
			
			System.out.println(rsvr_code);			
			map.put("rsvr_code", String.valueOf(rsvr_code));
			//map.put("cp_no", cp_no);
			map.put("p_method", p_method);
			map.put("p_content", p_content);
			map.put("p_ex_price", p_ex_price);
			map.put("p_tt_price", p_tt_price);
			map.put("merchant_uid", merchant_uid);
			
			p_code = PaymentDAO.savePayment(map);
			
		}
		
		int rs_num =0;
		//예매 내역 저장
		if(p_code>0) {
			Map<String, String> map = new HashMap<>();
			String ss_code = request.getParameter("ss_code");
			String rs_count = request.getParameter("rs_count");
			
			map.put("rsvr_code", String.valueOf(rsvr_code));
			map.put("p_code", String.valueOf(p_code));
			map.put("ss_code", ss_code);
			map.put("rs_count", rs_count);
			
			rs_num = PaymentDAO.saveReservation(map);
		}
		
		//선택 좌석 저장
		if(rs_num>0) {
			Map<String, String> map = new HashMap<>();
			map.put("rs_num", String.valueOf(rs_num));
			map.put("p_code", String.valueOf(p_code));
			
			
			String t_code = request.getParameter("t_code");
			String checkSeat = request.getParameter("checkSeat");
			System.out.println(checkSeat);
			String[] seat = checkSeat.split(",");
			String totalCount = request.getParameter("totalCount");
			System.out.println(totalCount);
			String[] people = totalCount.split("/");
			String[] audi = new String[seat.length];
			int count=0;
			for(int i=0; i<people.length; i++) {
				String[]tmp = people[i].split(":");
				System.out.println(tmp[0]);
				System.out.println(tmp[1]);
				int num = Integer.parseInt(tmp[1]);
				for(int j=0; j<num; j++) {
					audi[count++] = tmp[0];
				}
				
			}
			for(int i=0; i<seat.length;i++) { //관객 수, 타입만큼, 좌석코드 삽입 //A2,A1 성인1/청소년1/경로0
				String s_code = t_code + seat[i];
				map.put("s_code", s_code);
				switch(audi[i]) {
				case "성인":
					map.put("a_code", "1");
					break;
				case "청소년":
					map.put("a_code", "2");
					break;
				case "경로":
					map.put("a_code", "3");
					break;
				}
				PaymentDAO.saveSelectedSeat(map);
			}
		}
		
		return "/jsp/payment/payment_complete.jsp";
	}

}
