package main.java.web.main.action;

import web.mybatis.dao.PaymentDAO;
import web.mybatis.vo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PayAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String price = request.getParameter("totalPrice");
		System.out.println("PayAction 진입");
		//임시로 회원 정보 가져오기
		//MemberVO mvo = PaymentDAO.getMvo("test1");
		//request.setAttribute("mvo", mvo);
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");

		if(mvo!=null) {
			//회원 정보 -> 쿠폰 검색 -> request에 저장
			IssuedCouponVO[] cvo = PaymentDAO.getCouponArr(mvo);
			request.setAttribute("cvo", cvo);
		}

		String movieName = request.getParameter("movieName"); //인사이드 아웃 2
		String theater = request.getParameter("text"); //쌍용 1관
		String date = request.getParameter("date"); //2024-06-26
		String time = request.getParameter("time"); // 09:00:00
		String checkSeat = request.getParameter("checkSeat"); //A1,A2
		
		//비회원
		String nText = request.getParameter("nText");
		String nDate = request.getParameter("nDate"); 
		String nTime = request.getParameter("nTime"); 
		String non_name = request.getParameter("non_name"); 
		String non_email = request.getParameter("non_email"); 
		String non_pw = request.getParameter("non_pw"); 
		
		
		ReserverVO rvo = new ReserverVO();
		rvo.setNon_name(non_name);
		rvo.setNon_email(non_email);
		rvo.setNon_pw(non_pw);
		request.setAttribute("rvo", rvo);
		
		String dateAndTime = date+" "+time; //상영시간표 검색용
		String nDateAndnTime =nDate+" "+nTime; //상영시간표 검색용
		
		MovieListVO movieVO = null;
		if( movieName != null) {
			//movieName -> 상영 영화 VO
			movieVO = PaymentDAO.getMovieVO(movieName); //필요
			request.setAttribute("movieVO", movieVO);
		}
		TheaterVO theaterVO = null;
		if( theater != null) {
			//상영관 이름 -> 상영관 VO
			theaterVO = PaymentDAO.getTheaterVO(theater);
			request.setAttribute("theaterVO", theaterVO);
		}
		TheaterVO thea = null;
		if( nText != null ) {
			thea = PaymentDAO.getNoTheaterVO(nText);
			request.setAttribute("thea", thea);
		}
		
		//상영 영화 코드, 상영관 코드, 날짜+시작 시간 -> 상영시간표VO(ssvo)->request 저장
		if( movieName != null && theater != null) {
			ScreeningScheduleVO ssVO = PaymentDAO.getSsVO(movieVO.getMovieCd(), theaterVO.getT_name(), dateAndTime);
			request.setAttribute("ssVO", ssVO);
		}
		
		if( movieName != null && nText != null ) {
			ScreeningScheduleVO ssVO1 = PaymentDAO.getSsVO1(movieVO.getMovieCd(), thea.getT_name(), nDateAndnTime);
			System.out.println("호이호이" +ssVO1);
			request.setAttribute("ssVO1", ssVO1);
		}
		/*
		 * //선택 좌석 -> 상영관 좌석 VO list String[] seat = checkSeat.split(",");
		 * TheaterSeatVO[] tsVO
		 * =PaymentDAO.getTheaterSeatVO(theaterVO.getT_name(),seat);
		 * request.setAttribute("tsVO", tsVO); System.out.println(tsVO[0].getT_code());
		 */

		//totalCount -> 관객 VO list
		String totalCount = request.getParameter("totalCount"); //성인:1/청소년:1/경로:0
		String nTotalCount = request.getParameter("nTotalCount"); //성인:1/청소년:1/경로:0
		if( totalCount != null) {
			String[] people = totalCount.split("/");
			String content="";
			//DB에 저장할 내용
			String dbContent =movieName+" ";
			int totalPrice = 0;
			//금액 내용을 위한 String 만들기 ex: 성인 1명 13000 + 청소년 2명
			for(int i=0; i<people.length; i++) {
				String[] temp = people[i].split(":");
				int count = Integer.parseInt(temp[1]);
				if(count != 0) { //수량이 유효하면
					switch(temp[0]) {
						case "성인":
							content += temp[0] +" × "+count+" = "+ (13000*count)+"   ";
							dbContent += temp[0] +"("+count+") ";
							totalPrice+=(13000*count);
							break;
						case "청소년":
							content += temp[0] +" × "+ count+" = "+(10000*count)+"   ";
							dbContent += temp[0] +"("+count+") ";
							totalPrice+=(10000*count);
							break;
						case "경로":
							content += temp[0] +" × "+ count+" = "+(8000*count)+"   ";
							dbContent += temp[0] +"("+count+") ";
							totalPrice+=(8000*count);
							break;
					}
				}
			}
			System.out.println("제발" + dbContent);
			request.setAttribute("payContent", content);
			request.setAttribute("dbContent", dbContent);
		}
		if( nTotalCount != null) {
			String[] nPeople = nTotalCount.split("/");
			//예매내역에 띄울 내용
			String nContent="";
			//DB에 저장할 내용
			String nDbContent =movieName+" ";
			int nTotalPrice = 0;
			//금액 내용을 위한 String 만들기 ex: 성인 1명 13000 + 청소년 2명
			for(int i=0; i<nPeople.length; i++) {
				String[] temp = nPeople[i].split(":");
				int count = Integer.parseInt(temp[1]);
				if(count != 0) { //수량이 유효하면
					switch(temp[0]) {
					case "성인":
						nContent += temp[0] +" × "+count+" = "+ (13000*count)+"   ";
						nDbContent += temp[0] +"("+count+") ";
						nTotalPrice+=(13000*count);
						break;
					case "청소년":
						nContent += temp[0] +" × "+ count+" = "+(10000*count)+"   ";
						nDbContent += temp[0] +"("+count+") ";
						nTotalPrice+=(10000*count);
						break;
					case "경로":
						nContent += temp[0] +" × "+ count+" = "+(8000*count)+"   ";
						nDbContent += temp[0] +"("+count+") ";
						nTotalPrice+=(8000*count);
						break;
					}
				}
			}
			request.setAttribute("nPayContent", nContent);
			request.setAttribute("nDbContent", nDbContent);
		}
		/*
		 * //선택 좌석용 audienceVO AudienceVO[] audiVO = PaymentDAO.getAudienceVO(people);
		 * request.setAttribute("audiVO", audiVO);
		 * System.out.println(audiVO[0].getA_name());
		 */
		//관객별 가격을 얻고 싶어요

		//예매내역에 띄울 내용
		
//		System.out.println(content);
//		System.out.println(totalPrice);
		//금액 계산

		return "/jsp/payment/payment.jsp";
	}

}