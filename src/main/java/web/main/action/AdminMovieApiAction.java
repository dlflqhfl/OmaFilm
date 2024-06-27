package web.main.action;

import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.DailyBoxOfficeVO;//OpenMovieListVO
import web.mybatis.vo.OpenMovieListVO;

public class AdminMovieApiAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// if문으로 만약 MovieCD 파라메터를 받을 경우에만 실행
		// else 만약 MovieCD 파라메타가 없을 경우에만 실행
		LocalDate currentDate = LocalDate.now();

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

		String formattedDate = currentDate.format(formatter);

		int dateNumber = Integer.parseInt(formattedDate);
		final int checkdateNumber = dateNumber - 1; // 어제 날짜 위주로 조회 당일은 조회가 안됨!

		DailyBoxOfficeVO[] daily_list = new DailyBoxOfficeVO[0]; //다음을 위해서 daily_list 배열 선언
		DailyBoxOfficeVO daily = null;	//출력용 테스트를 위해 try안이 아닌 밖에서 만듬
		try {
			String path = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=f5eef3421c602c6cb7ea224104795888&targetDt=";
			// 경로 지정 API경로+어제날짜는 안 넣었음
			StringBuilder sb = new StringBuilder();
			sb.append(path);
			sb.append(checkdateNumber);
			// 경로 합치기
			String repath = sb.toString();
			URL url = new URL(repath);
			// repath로 API 불러오는 경로 완성 이후 url로 하기
			HttpsURLConnection htp = (HttpsURLConnection) url.openConnection();
			htp.setRequestProperty("Content-Type", "application/xml");
			htp.connect();
			// url를 불러오기 하는것이 아닌 이제 접속할 수 있게 하기
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(htp.getInputStream());
			Element root = doc.getRootElement();
			Element dailybox = root.getChild("dailyBoxOfficeList");
			List<Element> list = dailybox.getChildren("dailyBoxOffice");
			
			daily = new DailyBoxOfficeVO();	//원래는DailyBoxOfficeVO daily =new DailyBoxOfficeVO();
			//지만 확인을 위해 위에서 선언을 함
			daily.setBoxofficeType(root.getChildText("boxofficeType"));
			daily.setShowRange(root.getChildText("showRange"));

			daily_list = new DailyBoxOfficeVO[list.size()];
			DailyBoxOfficeVO dvo = new DailyBoxOfficeVO();
			if (list != null && list.size() > 0) {
				daily_list = new DailyBoxOfficeVO[list.size()];
				int i = 0;
				for (Element e : list) {
					String rnum = e.getChildText("rnum");
					String rank = e.getChildText("rank");
					String rankOldAndNew = e.getChildText("rankOldAndNew");
					String movieCd = e.getChildText("movieCd");
					String movieNm = e.getChildText("movieNm");

					String openDt = e.getChildText("openDt");
					String salesAmt = e.getChildText("salesAmt");
					String salesShare = e.getChildText("salesShare");
					String salesAcc = e.getChildText("salesAcc");

					String audiCnt = e.getChildText("audiCnt");
					String audiAcc = e.getChildText("audiAcc");
					String scrnCnt = e.getChildText("scrnCnt");
					String showCnt = e.getChildText("showCnt");

					
					dvo.setRnum(rnum);
					dvo.setRank(rank);
					dvo.setRankOldAndNew(rankOldAndNew);
					dvo.setRankOldAndNew(rankOldAndNew);
					dvo.setMovieCd(movieCd);
					dvo.setMovieNm(movieNm);

					dvo.setOpenDt(openDt);
					dvo.setSalesAmt(salesAmt);
					dvo.setSalesShare(salesShare);
					dvo.setSalesAcc(salesAcc);

					dvo.setAudiCnt(audiCnt);
					dvo.setAudiAcc(audiAcc);
					dvo.setScrnCnt(scrnCnt);
					dvo.setShowCnt(showCnt);
					request.setAttribute("count", audiAcc);

					daily_list[i++] = dvo;
				}
			}

			request.setAttribute("daily", daily); // 해당 부분은 box오피스이름과 날짜범위
			request.setAttribute("daily_list", daily_list); // dailyBoxOffice안에 있는 것들
			

			AdminDAO dao=new AdminDAO();
			List<DailyBoxOfficeVO> dailyList = List.of(daily_list);
			int check = AdminDAO.checkMovie(dvo.getMovieCd());
			if( check <= 0) {
				int insertCount = dao.insertDailyMovie(daily, dailyList);
			} else {
				int updateDaily = AdminDAO.updateDailyMovie(daily, dailyList);
			}
            htp.disconnect();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("테슷트");
		
		//영화목록 api 받기
		//https://kobis.or.kr/kobisopenapi/webservice/rest/
		//movie/searchMovieList.xml?key=f5eef3421c602c6cb7ea224104795888+(입력한 날짜 안의 정보들을 넣기)
		
		//이건 영화 목록 API 참고로 테이블과는 전혀 다릅니다 테이블은 영화 상세목록.API입니다
		String openStartDt = request.getParameter("openStartDt");
		System.out.println(openStartDt);
		String openEndDt = request.getParameter("openEndDt");
		System.out.println(openEndDt);
		try {
			
			String path ="https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=f5eef3421c602c6cb7ea224104795888";
			
			if ( openStartDt != null) {
		        path += "&openStartDt=" + openStartDt;
		    }

		    // URL에 openEndDt 추가
		    if (openEndDt != null) {
		        path += "&openEndDt=" + openEndDt;
		    }
		    System.out.println(path);
		    StringBuilder sb = new StringBuilder();
			sb.append(path);
			
			URL url = new URL(sb.toString());
		    HttpsURLConnection htp = (HttpsURLConnection) url.openConnection();
		    htp.setRequestProperty("Content-Type", "application/xml");
		    htp.connect();
		    
		    SAXBuilder builder = new SAXBuilder();
		    Document doc = builder.build(htp.getInputStream());
		    Element root = doc.getRootElement();
		    Element movielists=root.getChild("movieList");
		    List<Element>movie = movielists.getChildren("movie");
		    
		    List<OpenMovieListVO> mov = new ArrayList<>();
		    
			    for(Element e: movie) {
			    	String movieCd = e.getChildText("movieCd");
			    	String movieNm = e.getChildText("movieNm");
			    	String openDt = e.getChildText("openDt");
			    	
			    	OpenMovieListVO vo = new OpenMovieListVO();
			    	vo.setMovieCd(movieCd);
			    	vo.setMovieNm(movieNm);
			    	vo.setOpenDt(openDt);
			    	mov.add(vo);
			    }
			    request.setAttribute("movie",mov);
		    //for문과 if 통과 이후
		    
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("값 안넣어짐");
		}
		return "jsp/admin/adminMovieAPI.jsp";
	}
	

}
