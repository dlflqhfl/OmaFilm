package web.main.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.mybatis.dao.PaymentDAO;
import web.mybatis.vo.AudienceVO;
import web.mybatis.vo.IssuedCouponVO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.ScreeningScheduleVO;
import web.mybatis.vo.TheaterSeatVO;
import web.mybatis.vo.TheaterVO;

public class PayAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

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
		String totalCount = request.getParameter("totalCount"); //성인:1/청소년:1/경로:0

		String dateAndTime = date+" "+time; //상영시간표 검색용
		request.setAttribute("dateAndTime", dateAndTime);

		//movieName -> 상영 영화 VO
		MovieListVO movieVO = PaymentDAO.getMovieVO(movieName); //필요
		request.setAttribute("movieVO", movieVO);

		//상영관 이름 -> 상영관 VO
		TheaterVO theaterVO = PaymentDAO.getTheaterVO(theater);
		request.setAttribute("theaterVO", theaterVO);

		//상영 영화 코드, 상영관 코드, 날짜+시작 시간 -> 상영시간표VO(ssvo)->request 저장
		ScreeningScheduleVO ssVO = PaymentDAO.getSsVO(movieVO.getMovieCd(), theaterVO.getT_name(),dateAndTime);
		request.setAttribute("ssVO", ssVO);
		/*
		 * //선택 좌석 -> 상영관 좌석 VO list String[] seat = checkSeat.split(",");
		 * TheaterSeatVO[] tsVO
		 * =PaymentDAO.getTheaterSeatVO(theaterVO.getT_name(),seat);
		 * request.setAttribute("tsVO", tsVO); System.out.println(tsVO[0].getT_code());
		 */

		//totalCount -> 관객 VO list
		String[] people = totalCount.split("/");
		/*
		 * //선택 좌석용 audienceVO AudienceVO[] audiVO = PaymentDAO.getAudienceVO(people);
		 * request.setAttribute("audiVO", audiVO);
		 * System.out.println(audiVO[0].getA_name());
		 */
		//관객별 가격을 얻고 싶어요

		//예매내역에 띄울 내용
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
						content += temp[0] +" × "+count+" = "+ (13000*count)+"\n";
						dbContent += temp[0] +"("+count+") ";
						totalPrice+=(13000*count);
						break;
					case "청소년":
						content += temp[0] +" × "+ count+" = "+(10000*count)+"\n";
						dbContent += temp[0] +"("+count+") ";
						totalPrice+=(10000*count);
						break;
					case "경로":
						content += temp[0] +" × "+ count+" = "+(8000*count)+"\n";
						dbContent += temp[0] +"("+count+") ";
						totalPrice+=(8000*count);
						break;
				}
			}
		}

		request.setAttribute("payContent", content);
		request.setAttribute("dbContent", dbContent);
		//request.setAttribute("totalPrice", totalPrice);
		System.out.println(content);
		System.out.println(totalPrice);
		//금액 계산

		return "/jsp/payment/payment.jsp";
	}

}
