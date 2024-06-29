package web.main.action;

import web.mybatis.dao.PaymentDAO;
import web.mybatis.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class PayCompleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

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
			String cp_no = request.getParameter("cp_no"); //쿠폰
			String p_method = request.getParameter("p_method");
			String p_content = request.getParameter("p_content");
			String p_ex_price = request.getParameter("p_ex_price");
			String p_tt_price = request.getParameter("p_tt_price");
			String merchant_uid = request.getParameter("merchant_uid");

			map.put("rsvr_code", String.valueOf(rsvr_code));

			map.put("p_method", p_method);
			map.put("p_content", p_content);
			map.put("p_ex_price", p_ex_price);
			map.put("p_tt_price", p_tt_price);
			map.put("merchant_uid", merchant_uid);
			if(!cp_no.isEmpty()) {
				map.put("cp_no", cp_no);
			}
			p_code = PaymentDAO.savePayment(map);
			if(!cp_no.isEmpty())
				PaymentDAO.useCoupon(Integer.parseInt(cp_no));

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

			request.setAttribute("rs_num", rs_num);
		}

		//선택 좌석 저장
		if(rs_num>0) {
			String ss_code = request.getParameter("ss_code");
			Map<String, String> map = new HashMap<>();
			map.put("rs_num", String.valueOf(rs_num));
			map.put("p_code", String.valueOf(p_code));
			map.put("ss_code", ss_code);

			//String t_code = request.getParameter("t_code");
			String checkSeat = request.getParameter("checkSeat");
			String[] seat = checkSeat.split(",");

			String totalCount = request.getParameter("totalCount");
			String[] people = totalCount.split("/");

			String[] audi = new String[seat.length];
			int count=0;
			for(int i=0; i<people.length; i++) {
				String[]tmp = people[i].split(":");
				int num = Integer.parseInt(tmp[1]);
				for(int j=0; j<num; j++) {
					audi[count++] = tmp[0];
				}

			}
			String t_name = request.getParameter("t_name");
			String t_code="";

			switch(t_name){
				case "쌍용 1관":
					t_code ="1";
					break;
				case "쌍용 2관":
					t_code ="2";
					break;
				case "쌍용 3관":
					t_code ="3";
					break;
				case "쌍용 4관":
					t_code ="4";
					break;
				case "프리미엄 오경주관":
					t_code ="5";
					break;
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
