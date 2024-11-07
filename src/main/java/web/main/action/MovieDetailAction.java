package web.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.main.util.Paging;
import web.mybatis.dao.MovieListDAO;
import web.mybatis.dao.MovieReviewDAO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.MovieListVO;
import web.mybatis.vo.ReviewVO;

public class MovieDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 System.out.println("확인");
	        Object obj = request.getSession().getAttribute("mvo");
	        MemberVO member = (MemberVO) obj;
	        
	        Paging page = new Paging(6, 3);

	        // 영화 상세정보 가져오기 
	        String movieCd = request.getParameter("movieCd");
	        String cPage = request.getParameter("cPage");
	        System.out.println(cPage);
	        page.setTotalRecode(MovieReviewDAO.selectReviewCount(movieCd));
	        if(cPage != null) {
				page.setNowPage(Integer.parseInt(cPage));
				
			}else {
				page.setNowPage(1);  
			}
	        MovieListVO mvo = MovieListDAO.getMovieVO(movieCd);
	        request.setAttribute("mvo", mvo);
 
	        String score = request.getParameter("score");
	        String reviewDate = request.getParameter("reviewDate");
	        String reviewText = request.getParameter("reviewText");
	        String delete2 = request.getParameter("delete");
	        String recomm2 = request.getParameter("recomm");

	        if (member != null) {
	            String u_code = String.valueOf(member.getU_code());

	            if (score != null || reviewDate != null || reviewText != null) {
	                ReviewVO rvo = new ReviewVO();
	                rvo.setU_code(u_code);
	                rvo.setMovieCd(movieCd);
	                rvo.setR_grade(score);
	                rvo.setR_content(reviewText); 
	                rvo.setR_date(reviewDate);
	                rvo.setR_recomm("0"); // 기본값 설정
	                rvo.setR_status(0); // 기본값 설정

	                int insertSuccess = MovieReviewDAO.insertReview(rvo);
	                System.out.println("리뷰 등록 결과: " + insertSuccess);

	                if (insertSuccess > 0) {
	                    request.setAttribute("cnt", insertSuccess);
	                    return "jsp/movie/movieUpdate.jsp";
	                } else {
	                    System.out.println("리뷰 등록 실패");
	                    return "jsp/myPage/index.jsp";
	                }
	            } else if (delete2 != null) {
	                System.out.println("리뷰 삭제");
	                String r_idx = request.getParameter("r_idx");
	                int updateResult = MovieReviewDAO.updateReview(r_idx);

	                if (updateResult > 0) {
	                    request.setAttribute("cnt", updateResult);
	                    return "jsp/movie/movieDelete.jsp";
	                }
	            } else if (recomm2 != null) {
	                System.out.println("리뷰 추천");
	                String r_idx2 = request.getParameter("r_idx");
	                int recommResult = MovieReviewDAO.updateRecomm(r_idx2);

	                if (recommResult > 0) {
	                    request.setAttribute("cnt", recommResult);
	                    return "jsp/movie/movieRecomm.jsp";
	                }
	            }
	        }
	        System.out.println(page.getBegin());
	        System.out.println(page.getEnd());
	        // 리뷰 목록 처리
	        String cate = request.getParameter("cate");
	        String list2 = request.getParameter("list");
	        
	        Map<String, String> map2 = new HashMap<>();
	        map2.put("movieCd", movieCd);
	        map2.put("begin", String.valueOf(page.getBegin()));
	        map2.put("end", String.valueOf(page.getEnd()));

	        if (list2 != null) {
	            List<ReviewVO> list;
	            
	            if (cate == null || cate.equals("latest")) {
	                // 최신순 정렬 (기본값)
	                list = MovieReviewDAO.selectLatestReview(map2);
	            } else if (cate.equals("rating")) {
	                // 평점순 정렬
	                list = MovieReviewDAO.selectGradeReview(map2);
	            } else if (cate.equals("recomm")) {
	                // 추천순 정렬
	                list = MovieReviewDAO.selectRecommReview(map2);
	            } else {
	                // 유효하지 않은 sort 값 처리 (기본값으로 최신순 정렬)
	                list = MovieReviewDAO.selectLatestReview(map2);
	            }
	            
	            request.setAttribute("list", list);
	            return "jsp/movie/movieReview.jsp";
	        }

	        // 기본 영화 상세 페이지로 이동
	        return "jsp/movie/movieDetail.jsp";
	    }
	}
