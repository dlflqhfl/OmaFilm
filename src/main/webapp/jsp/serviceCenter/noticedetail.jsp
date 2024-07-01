<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/serviceCenter/noticedetail_style.css" />
  </head>
  <body>
    <div class="div-wrapper">
      <div class="container-wrapper">
        <div class="container">
          <img class="footer" src="${pageContext.request.contextPath}/img/serviceCenter/noticedetail/footer.png" />
          <div class="frame">
            <div class="navbar">
              <div class="link"><div class="text-wrapper">회원가입</div></div>
              <div class="div"><div class="text-wrapper">고객센터</div></div>
              <div class="link-2"><div class="text-wrapper-2">관리자</div></div>
              <div class="text-wrapper-3">로그인</div>
              <div class="link-3"><div class="text-wrapper">빠른예매</div></div>
              <img class="img" src="${pageContext.request.contextPath}/img/serviceCenter/noticedetail/link.png" />
              <img class="link-4" src="${pageContext.request.contextPath}/img/serviceCenter/noticedetail/link-1.png" />
              <img class="link-5" src="${pageContext.request.contextPath}/img/serviceCenter/noticedetail/link-2.png" />
              <div class="text-wrapper-4">예매</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-5">영화</div></a
              >
              <div class="text-wrapper-6">이벤트</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-7">혜택</div></a
              >
              <img class="heading-link" src="${pageContext.request.contextPath}/img/serviceCenter/noticedetail/heading-1-link.png" />
              <div class="link-6"></div>
            </div>
          </div>
          <div class="heading">공지사항 상세보기</div>
          <div class="background">
            <div class="overlap">
              <div class="link-7"><div class="text-wrapper-8">고객센터</div></div>
              <div class="list">
                <div class="overlap-group">
                  <div class="item-link"><div class="text-wrapper-9"><a href="Controller?type=home">고객센터 홈</a></div></div>
                  <div class="item-link-2"><div class="text-wrapper-10"><a href="Controller?type=faq">자주 묻는 질문</a></div></div>
                  <div class="link-9"><div class="text-wrapper-11"><a href="Controller?type=directions">오시는 길</a></div></div>
                  <div class="item-link-3"><div class="text-wrapper-12"><a href="Controller?type=notice"><%--공지사항 --%></a></div></div>
                  <div class="link-10"><div class="text-wrapper-13"><a href="Controller?type=sinquiry">1:1문의</a></div></div>
                </div>
              </div>
            </div>
          </div>
          <div class="horizontal-border">
            <div class="table-body">
              <div class="row">
                <div class="cell">

                  <p class="label"><span class="span">제목 </span> <span class="text-wrapper-14">*</span></p>
                </div>
                <div class="input-wrapper"><div class="input">${nvo.n_title}</div></div>
              </div>
              <div class="row-2">
                <div class="cell">
                  <p class="p"><span class="span">등록일 </span> <span class="text-wrapper-14">*</span></p>
                </div>
                <div class="data">
                <div class="input-2">
	                <fmt:parseDate value="${nvo.n_time}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
	    			<fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd" />
                </div>
                </div>
              </div>
              <div class="row-3">
                <div class="label-wrapper">
                  <p class="label-2"><span class="span">내용 </span> <span class="text-wrapper-14">*</span></p>
                </div>
                <div class="border-wrapper">
                  <div class="border">
                    <div class="textarea">${nvo.n_content}</div>
                    <div class="container-2"><div class="text-wrapper-15">0 / 2000</div></div>
                  </div>
                </div>
              </div>
              <button class="button"><div class="text-wrapper-16"><a href="Controller?type=notice">목록</a></div></button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
