package main.java.web.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mybatis.dao.MyHomeDAO;
import web.mybatis.vo.MemberVO;

public class CheckPwAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Object obj = request.getSession().getAttribute("mvo");
		 MemberVO mvo = (MemberVO) obj;
		 
		 if (mvo != null) {
		        int u_code = mvo.getU_code();
		        
		        // 비밀번호 확인 로직 추가
	            String inputpw = request.getParameter("inputpw");
	            if (inputpw != null && inputpw.equals(mvo.getU_pw())) {
	                // 비밀번호 일치: 개인정보 수정 페이지로 이동
	                return "/jsp/myPage/personInfor.jsp";
	            } else {
	                // 비밀번호 불일치 또는 입력되지 않음: 오류 메시지 설정 후 본인확인 페이지로 이동
	                request.setAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
	                return "/jsp/myPage/checkPw.jsp";
	            }
	        } else {
	            request.getSession().setAttribute("loginErrorMessage", "로그인이 필요한 서비스입니다.");
	            return "/jsp/login/login_1.jsp";
	        }
	    }
		
	}

