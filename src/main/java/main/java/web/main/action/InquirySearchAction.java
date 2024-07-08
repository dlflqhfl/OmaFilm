package main.java.web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.main.util.Paging;
import web.mybatis.dao.NoticeDAO;
import web.mybatis.dao.inquiryDAO;
import web.mybatis.vo.InquiryVO;
import web.mybatis.vo.MemberVO;
import web.mybatis.vo.NoticeVO;

public class InquirySearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute("mvo");
		MemberVO mvo = (MemberVO) obj;
		
		 if (mvo != null) {
			 
			 	int u_code = mvo.getU_code();
			    Paging page = new Paging(5, 3);
				String cPage = request.getParameter("cPage");
				String inquiryTitle = request.getParameter("inquiryTitle");
				System.out.println("얍" + inquiryTitle);
				
				//전체페이지 수를 구하기
				page.setTotalRecode(inquiryDAO.iqSearchCount(inquiryTitle, u_code));
				
				int cnt =inquiryDAO.iqSearchCount(inquiryTitle,u_code);
				System.out.println("제발 나와라:"+cnt);
				
				//현재페이지값 받기
				if(cPage != null) {
					//int nowPage = Integer.parseInt(cPage);
					//page.setNowPage(nowPage);
					page.setNowPage(Integer.parseInt(cPage));
					//이때!
					//게시물을 추출할 때 사용되는 begin과 end과 구해지고
					//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
					
				}else {
					page.setNowPage(1);
				}
				
				InquiryVO[] ivo = inquiryDAO.getListIq(page.getBegin(), page.getEnd(), inquiryTitle, u_code);
				System.out.println("이것도 나와라"+ivo);
				
				//위의 배열 ar을 jsp에서 표현하기 위해 request에 저장하자
				request.setAttribute("ivo", ivo);
				request.setAttribute("page", page);
				request.setAttribute("cnt", cnt);
				
				
				return "jsp/myPage/inquiry.jsp";
			}

			return null;
			}
		}
