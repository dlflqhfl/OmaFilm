package main.java.web.main.action;

import java.net.URL;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

import web.mybatis.vo.MovieListVO;

public class AdminDetailAction implements Action{
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String movieCd = request.getParameter("movieCd");
		request.setAttribute("movieCd", movieCd);
		try {
			//공공데이터 경로
			String path="https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=f5eef3421c602c6cb7ea224104795888&movieCd=";
			StringBuilder sb=new StringBuilder();
			sb.append(path);
			sb.append(movieCd);
			String repath=sb.toString();
			//위의 경로를 가지고 URL객체를 생성
			//다만 예외 상황이 발생 할 수 있다.
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
	        List<Element> nation_list = nations.getChildren("nation");
	        
	        Element genres = movieInfo.getChild("genres");
	        List<Element> genre_list = genres.getChildren("genre");
	        
	        Element directors = movieInfo.getChild("directors");
	        List<Element> director_list = directors.getChildren("director");
	        
	        Element actors = movieInfo.getChild("actors");
	        List<Element> actor_list = actors.getChildren("actor");
	        //movieInfo안에 있는 actors안에 있는 actor들
	        Element showTypes = movieInfo.getChild("showTypes");
	        List<Element> showType_list = showTypes.getChildren("showType");
	        
	        Element audits = movieInfo.getChild("audits");
	        List<Element> audit_list = audits.getChildren("audit");

	            MovieListVO movie = new MovieListVO();
	            
	            movie.setMovieCd(movieInfo.getChildText("movieCd"));
	            movie.setMovieNm(movieInfo.getChildText("movieNm"));
	            movie.setShowTm(movieInfo.getChildText("showTm"));
	            movie.setPrdtYear(movieInfo.getChildText("prdtYear"));
	            movie.setOpenDt(movieInfo.getChildText("openDt"));
	            movie.setTypeNm(movieInfo.getChildText("typeNm"));
	            
	            MovieListVO[] nation_ar = new MovieListVO[nation_list.size()];
	            int n=0;
	            for(Element e: nation_list) {
	            	MovieListVO nvo=new MovieListVO();
	            	nvo.setNationNm(e.getChildText("nationNm"));
	            	nation_ar[n++]=nvo;
	            }
	           
	            MovieListVO[] genre_ar=new MovieListVO[genre_list.size()];
	            int g=0;
	            for(Element e: genre_list) {
	            	MovieListVO gvo=new MovieListVO();
	            	gvo.setGenreNm(e.getChildText("genreNm"));
	            	genre_ar[g++]=gvo;
	            }
	            
	            MovieListVO[] director_ar=new MovieListVO[director_list.size()];
	            int d=0;
	            for(Element e: director_list) {
	            	
	            	MovieListVO dvo=new MovieListVO();
	            	dvo.setPeopleNm(e.getChildText("peopleNm"));
	            	dvo.setPeopleNmEn(e.getChildText("peopleNmEn"));
	            	director_ar[d++]=dvo;
	            }
	            MovieListVO[] showType_ar = new MovieListVO[showType_list.size()];
	            int s=0;
	            
	            for(Element e: showType_list) {
	            	
	            	MovieListVO svo=new MovieListVO();
	            	svo.setShowTypeGroupNm(e.getChildText("showTypeGroupNm"));
	            	svo.setShowTypeNm(e.getChildText("showTypeNm"));
	            	showType_ar[s++]=svo;
	            }
	            MovieListVO[] audit_ar = new MovieListVO[audit_list.size()];
	            int a=0;
	            for(Element e: audit_list) {
	            	
	            	MovieListVO avo=new MovieListVO();
	            	avo.setAuditNo(e.getChildText("auditNo"));
	            	avo.setWatchGradeNm(e.getChildText("watchGradeNm"));
	            	audit_ar[a++]=avo;
	            }
	            MovieListVO[] actor_ar = null;
	            if(actor_list.size()>5) {
	            	actor_ar = new MovieListVO[5];
	            }else
	            	actor_ar = new MovieListVO[actor_list.size()];
	            int i=0;
	            for(Element e : actor_list) {
	            	if(i>4)
	            		break;
	            	MovieListVO avo = new MovieListVO();
		            avo.setPeopleNm(e.getChildText("peopleNm"));
		            avo.setPeopleNmEn(e.getChildText("peopleNmEn"));
		            avo.setCast(e.getChildText("cast"));
		            avo.setCastEn(e.getChildText("castEn"));
		            //준비된 배열에 avo저장
		            actor_ar[i++] = avo;
	            }

	            request.setAttribute("movie", movie);
	            request.setAttribute("na_ar", nation_ar);
	            request.setAttribute("ge_ar", genre_ar);
	            request.setAttribute("di_ar", director_ar);
	            request.setAttribute("ac_ar", actor_ar);
	            request.setAttribute("sh_ar", showType_ar);
	            request.setAttribute("au_ar", audit_ar);
	            
	            System.out.println("나오냐?" + movie.getMovieNm());
	            System.out.println("나오냐?" + movie.getMovieCd());

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "jsp/admin/adminDetailAction.jsp"; // 적절한 리턴 값으로 수정
	}
}
