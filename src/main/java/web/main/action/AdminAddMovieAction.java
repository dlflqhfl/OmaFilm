package web.main.action;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import web.mybatis.dao.AdminDAO;
import web.mybatis.vo.MovieListVO;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URL;
import java.util.List;

public class AdminAddMovieAction implements Action {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {

      String movieCd = request.getParameter("movieCd");
      String content = request.getParameter("contentData");
      String file = request.getParameter("fileData");

      String viewPath = null;
      System.out.println(content);
      System.out.println(file);

      try {
         String path="https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=0a2ce772f649e25bd781abec17bf6279&movieCd=";
         //여기서 위에서 한 것에서 movieCd를 받아야 한다. 그것도 하나씩 받아서 하기 때문에 for문으로 돌려야 한다.
         StringBuilder sb=new StringBuilder();
         sb.append(path);
         sb.append(movieCd);
         System.out.println(sb.toString());
         String repath=sb.toString();
         //반복문 시작 movieCd가 위에서는 10개를 배열로 받아서 이걸 받아야 한다
         URL url=new URL(repath);

         HttpsURLConnection conn=
               (HttpsURLConnection)url.openConnection();
         //형변환을 해야 한다 url과 conn의 형이 다르다
         //받을 자원이 xml문서임을 증명하기 위해 mimeType을 설정한다
         conn.setRequestProperty("Content-Type",
               "application/xml");
         conn.connect();
         //이제 JDOM파서를 이용하여 요청의 결과 즉,응답의
         //내용을 xml문서객체로 얻어내야 한다.
         //이때 순서를 지켜야 한다
         SAXBuilder builder=new SAXBuilder();
         Document doc = builder.build(conn.getInputStream());

         Element root = doc.getRootElement();
         Element movieInfo = root.getChild("movieInfo");

         Element nations = movieInfo.getChild("nations");
         Element nation = nations.getChild("nation");

         Element genres = movieInfo.getChild("genres");
         Element genre = genres.getChild("genre");

         Element directors = movieInfo.getChild("directors");
         Element director = directors.getChild("director");

         Element actors = movieInfo.getChild("actors");
         List<Element> actor_list = actors.getChildren("actor");

         //movieInfo안에 있는 actors안에 있는 actor들
         Element showTypes = movieInfo.getChild("showTypes");
         List<Element> showType_list = showTypes.getChildren("showType");

         Element audits = movieInfo.getChild("audits");

         Element audit = audits.getChild("audit");
         MovieListVO movie = new MovieListVO();

         movie.setMovieCd(movieInfo.getChildText("movieCd"));
         movie.setMovieNm(movieInfo.getChildText("movieNm"));
         movie.setMovieNmEn(movieInfo.getChildText("movieNmEn"));
         movie.setShowTm(movieInfo.getChildText("showTm"));
         movie.setPrdtYear(movieInfo.getChildText("prdtYear"));
         movie.setOpenDt(movieInfo.getChildText("openDt"));
         movie.setTypeNm(movieInfo.getChildText("typeNm"));


         if( nation != null) {
            movie.setNationNm(nation.getChildText("nationNm"));
         }

         if( genre != null) {
            movie.setGenreNm(genre.getChildText("genreNm"));
         }
         if( director != null) {
            movie.setDirectors(director.getChildText("peopleNm"));
         }

         if(audit !=null) {
            movie.setWatchGradeNm(audit.getChildText("watchGradeNm"));
         }


         int s=0;
         for(Element e: showType_list) {
            movie.setShowTypeGroupNm(e.getChildText("showTypeGroupNm"));
            movie.setShowTypeNm(e.getChildText("showTypeNm"));
         }

         if (actors != null) {
            int i = 0;
            StringBuilder sbuf = new StringBuilder();
            StringBuilder actors_sbuf = new StringBuilder();

            for (Element actor : actor_list) {
               if (i > 4)
                  break;

               String peopleNm = actor.getChildText("peopleNm"); // 배우 이름 추출
               if (peopleNm != null) {
                  if (i > 0) {
                     sbuf.append("/");
                     actors_sbuf.append("/");
                  }
                  sbuf.append(peopleNm);
                  actors_sbuf.append(peopleNm);
               }
               i++;
            }

            movie.setActors(actors_sbuf.toString());
         }

         for(Element e : actor_list) {
            movie.setPeopleNm(e.getChildText("peopleNm"));
            movie.setPeopleNmEn(e.getChildText("peopleNmEn"));
            movie.setCast(e.getChildText("cast"));
            movie.setCastEn(e.getChildText("castEn"));
         }

         System.out.println("Movie Name: " + movie.getMovieNm());
         System.out.println("감독이름: "+movie.getDirectors());
         System.out.println("Actor Count: " + movie.getGenreNm());
         System.out.println("이용 등급"+movie.getWatchGradeNm());
         System.out.println("배우 이름들 출력"+movie.getActors());
         request.setAttribute("movie", movie);

         movie.setM_plot(content);
         movie.setM_file(file);
         System.out.println("총영화 목록" + movie);
         viewPath = "/jsp/admin/adminAddMovie.jsp";
         
         if (request.getParameter("submit") != null) {
            String fileData = request.getParameter("fileData");
            movie.setM_file(fileData);
            System.out.println("파일이름" + fileData);
            int res = AdminDAO.insertMovieList(movie);
            if (res > 0) {
               viewPath = "/jsp/admin/adminMovieDB.jsp";
               return viewPath;
            } else {
               viewPath = "/jsp/admin/adminMovieApi.jsp";
               return viewPath;
            }

         }

      } catch (Exception e) {
         e.printStackTrace();
      }

      return viewPath;

   }

}

