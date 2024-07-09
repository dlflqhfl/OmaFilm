package web.main.action;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.DailyBoxOfficeVO;
import web.mybatis.vo.OpenMovieListVO;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AdminMovieApiAction implements Action{
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {
      LocalDate currentDate = LocalDate.now();
       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
       String formattedDate = currentDate.format(formatter);
       int dateNumber = Integer.parseInt(formattedDate);
       final int checkdateNumber = dateNumber - 1;

       DailyBoxOfficeVO[] daily_list = new DailyBoxOfficeVO[0];
       DailyBoxOfficeVO daily = null;
       try {
           String path = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=0a2ce772f649e25bd781abec17bf6279&targetDt=";
           StringBuilder sb = new StringBuilder();
           sb.append(path);
           sb.append(checkdateNumber);
           String repath = sb.toString();
           URL url = new URL(repath);
           HttpsURLConnection htp = (HttpsURLConnection) url.openConnection();
           htp.setRequestProperty("Content-Type", "application/xml");
           htp.connect();
           SAXBuilder builder = new SAXBuilder();
           Document doc = builder.build(htp.getInputStream());
           Element root = doc.getRootElement();
           Element dailybox = root.getChild("dailyBoxOfficeList");
           List<Element> list = dailybox.getChildren("dailyBoxOffice");

           daily = new DailyBoxOfficeVO();
           daily.setBoxofficeType(root.getChildText("boxofficeType"));
           daily.setShowRange(root.getChildText("showRange"));

           daily_list = new DailyBoxOfficeVO[list.size()];
           int i = 0;
           for (Element e : list) {
               // 각 반복마다 새로운 객체 생성
               DailyBoxOfficeVO dvo = new DailyBoxOfficeVO();
               dvo.setRnum(e.getChildText("rnum"));
               dvo.setRank(e.getChildText("rank"));
               dvo.setRankOldAndNew(e.getChildText("rankOldAndNew"));
               dvo.setMovieCd(e.getChildText("movieCd"));
               dvo.setMovieNm(e.getChildText("movieNm"));
               dvo.setOpenDt(e.getChildText("openDt"));
               dvo.setSalesAmt(e.getChildText("salesAmt"));
               dvo.setSalesShare(e.getChildText("salesShare"));
               dvo.setSalesAcc(e.getChildText("salesAcc"));
               dvo.setAudiCnt(e.getChildText("audiCnt"));
               dvo.setAudiAcc(e.getChildText("audiAcc"));
               dvo.setScrnCnt(e.getChildText("scrnCnt"));
               dvo.setShowCnt(e.getChildText("showCnt"));

               daily_list[i++] = dvo; // 각 객체를 배열에 추가
           }

           request.setAttribute("daily", daily);
           request.setAttribute("daily_list", daily_list);


           AdminDAO dao = new AdminDAO();
           List<DailyBoxOfficeVO> dailyList = Arrays.asList(daily_list);
           int check = AdminDAO.checkMovie(daily_list[0].getMovieCd());
           if (check <= 0) {
               dao.insertDailyMovie(daily, dailyList);
           } else {
               AdminDAO.updateDailyMovie(daily, dailyList);
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
      String search = request.getParameter("searchData");
      String curPage = request.getParameter("curPage");
      try {

         String path ="https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=0a2ce772f649e25bd781abec17bf6279";
         
         if( curPage != null) {
            path += "&curPage=" + curPage;
         }
         
         if ( openStartDt != null) {
            path += "&openStartDt=" + openStartDt;
         }

         // URL에 openEndDt 추가
         if (openEndDt != null) {
            path += "&openEndDt=" + openEndDt;
         }
         if( search != null) {
            path += "&movieNm=" + search;
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