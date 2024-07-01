<%@ page import="web.main.util.Paging"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/serviceCenter/notice_style.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container-wrapper">
        <div class="container">
          <img class="footer" src="${pageContext.request.contextPath}/img/serviceCenter/notice/footer.png" />
          <div class="frame">
            <div class="navbar">
              <div class="link"><div class="text-wrapper">회원가입</div></div>
              <div class="div-wrapper"><div class="text-wrapper">고객센터</div></div>
              <div class="div"><div class="text-wrapper-2">관리자</div></div>
              <div class="text-wrapper-3">로그인</div>
              <div class="link-2"><div class="text-wrapper">빠른예매</div></div>
              <img class="img" src="${pageContext.request.contextPath}/img/serviceCenter/notice/link.png" />
              <img class="link-3" src="${pageContext.request.contextPath}/img/serviceCenter/notice/link-1.png" />
              <img class="link-4" src="${pageContext.request.contextPath}/img/serviceCenter/notice/link-2.png" />
              <div class="text-wrapper-4">예매</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-5">영화</div></a
              >
              <div class="text-wrapper-6">이벤트</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-7">혜택</div></a
              >
              <img class="heading-link" src="${pageContext.request.contextPath}/img/serviceCenter/notice/heading-1-link.png" />
              <div class="link-5"></div>
            </div>
          </div>
          <div class="heading">공지사항</div>
          <div class="strong">
            <p class="element">
              <span class="span">전체 </span>
              <span class="text-wrapper-8">${cnt}</span>
              <span class="span">건</span>
            </p>
          </div>
          <div class="border">
            	<form id="searchForm" action="Controller?type=noticesearch" method="post">
                	<input type="text" name="n_title" class="text-wrapper-9" placeholder="검색어를 입력해 주세요."/>  
           		 <button class="button"></button>
           		 </form>
          </div>
         
		  <table class="table">
		    <thead>
		      <tr>
		        <th class="cell n_idx"><div class="text-wrapper-10">번호</div></th>
		        <th class="cell-2 title"><div class="text-wrapper-11">제목</div></th>
		        <th class="cell-3 n_time"><div class="text-wrapper-12">등록일</div></th>
		      </tr>
		    </thead>
		    
		    <div class="nav1">
            <ol class="paging">
           	 
			
				<c:set var="page" value="${requestScope.page}"/>
				
				<c:if test="${page.startPage < page.pagePerBlock }">
					<li class="disable">&lt;</li>
				</c:if>
			
				<c:if test="${page.startPage >= page.pagePerBlock }">
				
				<li><a href="Controller?type=notice&cPage=${page.nowPage-page.pagePerBlock }">&lt;</a></li>
				</c:if>
			
				<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
				<c:if test="${vs.index eq page.nowPage }">
				<li class="now">${vs.index}</li>
			    </c:if> 
			    <c:if test="${vs.index ne page.nowPage }">
				<li><a href="Controller?type=notice&cPage=${vs.index}">${vs.index}</a></li>
				</c:if>
				</c:forEach>
			
			
				<c:if test="${page.endPage < page.totalPage }">
					
					<li><a href="Controller?type=notice&cPage=${page.nowPage+page.pagePerBlock}">&gt;</a></li>
				</c:if>
				
				<c:if test="${page.endPage > page.totalPage }">	
					<li class="disable">&gt;</li>
				</c:if>	

              </ol>
          </div>
          
		    <tbody>	      
				<c:forEach var="vo" items="${nar }" varStatus="vs">
		                <tr>
		                   <td>${requestScope.page.totalRecode - ((requestScope.page.nowPage - 1) * requestScope.page.numPerPage + vs.index)}</td>
		                    <td style="text-align: left">
		                        	<a href="Controller?type=noticedetail&n_idx=${vo.n_idx}&n_title=${vo.n_title}&cPage=${requestScope.page.nowPage}">
		                            ${vo.n_title}
		                        </a>
		                    </td>
		                    <td>
		                    	<fmt:parseDate value="${vo.n_time}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
    							<fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd" />	
		                    </td>
		                </tr>
		            </c:forEach>
	
		        <c:if test="${fn:length(nar) < 1 }">
		            <tr>
		                <td colspan="3">
		                등록된 데이터가 없습니다.
		                </td>
		            </tr>
		        </c:if>
		    </tbody>
		  </table>

          <div class="background">
            <div class="overlap">
              <div class="link-18"><div class="text-wrapper-18">고객센터</div></div>
              <div class="list">
                <div class="overlap-group">
                  <div class="item-link"><div class="text-wrapper-19"><a href="Controller?type=home">고객센터 홈</a></div></div>
                  <div class="item-link-2"><div class="text-wrapper-20"><a href="Controller?type=faq">자주 묻는 질문</a></div></div>
                  <div class="link-20"><div class="text-wrapper-21"><a href="Controller?type=directions">오시는 길</a></div></div>
                  <div class="item-link-3"><div class="text-wrapper-22"><a href="Controller?type=notice"><%--공지사항--%></a></div></div>
                  <div class="link-21"><div class="text-wrapper-23"><a href="Controller?type=sinquiry">1:1문의</a></div></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </body>
</html>
