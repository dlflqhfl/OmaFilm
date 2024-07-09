<%@page import="web.mybatis.vo.InquiryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/inquiry.css" />
  </head>
  <body>
    <div class="screen">
      <div class="text-wrapper">
        <div class="text">
          <div class="background">
          
          
          <!-- 
          
          <div class="overlap-group">
                  <div class="li-2"><div class="text-wrapper"><a href="Controller?type=checkPw">개인 정보 수정</a></div></div>
                  <div class="div-wrapper"><div class="div"><a href="Controller?type=myReservation">나의 예매 내역 조회</a></div></div>
                  <div class="li"><div class="text-wrapper-2"><a href="Controller?type=inquiry">나의 문의 내역</a></div></div>
                  <div class="li-4"><div class="text-wrapper-3"><a href="Controller?type=myCoupon">나의 쿠폰 조회</a></div></div>
                  <div class="li-3"><div class="text-wrapper-4"><a href="Controller?type=myCancelReservation">나의 예매 취소 내역 조회</a></div></div>
                  <div class="li-5"><div class="text-wrapper-5"><a href="Controller?type=myHome">마이페이지 홈</a></div></div>
                </div>
           -->
            <div class="nav">
              <div class="link"><div class="div">마이페이지</div></div>
              <div class="list">
              		<div class="item-3">
	                  <div class="div-wrapper"><div class="text-wrapper-4"><a href="Controller?type=myHome">마이페이지 홈</a></div></div>
	                </div>
	                <div class="item">
	                  <div class="div-wrapper"><div class="text-wrapper-2"><a href="Controller?type=myReservation">나의 예매 내역 조회</a></div></div>
	                </div>
	                <div class="link-wrapper">
	                  <div class="div-wrapper"><div class="text-wrapper-3"><a href="Controller?type=myCancelReservation">나의 예매 취소 내역 조회</a></div></div>
	                </div> 
	                <div class="overlap-group">
	                  <div class="div-wrapper2"><div class="text-wrapper-6"><a href="Controller?type=myCoupon">나의 쿠폰 조회</a></div></div>
	                </div>
	                <div class="item-4">
	                 <div class="item-link"><div class="text-wrapper-5"><a href="Controller?type=inquiry">나의 문의 내역</a></div></div>
	               </div>
	                <div class="item-5">
	                 <div class="div-wrapper"><div class="text-wrapper-100"><a href="Controller?type=checkPw">개인 정보 수정</a></div></div>
	               </div>
	                
              </div>
            </div>
          </div>
          <div class="heading">나의 문의 내역</div>
          <jsp:include page="/jsp/header/header.jsp"/>
          <div class="link-9"><a href="Controller?type=sinquiry"><button type="button" class="btn-9">1:1 문의하기</button></a></div>
          <p class="element">
            <span class="span">전체 </span>
            <span class="text-wrapper-15">${cnt}</span>
            <span class="span">건</span>
          </p>
          <div class="border">
          <form action="Controller?type=inquirySearch" method="post">
           <input type="hidden" name="type" value="inquiry">
           <div class="input">
			  <input type="text" class="text-wrapper-17" id="inquiryTitle" name="inquiryTitle" value="${param.inquiryTitle}" placeholder="제목을 입력해주세요."/>
	            <button type="submit" class="button-2">
				  <img src="${pageContext.request.contextPath}/img/myPage/inquiry/link.png" alt="버튼 이미지"> 
				</button>
				</div>
			</form>
          </div>
         	<table class="table">
          <thead>
            <tr>
              <th class="cell"><div class="text-wrapper-30">번호</div></th>
              <th class="cell-2"><div class="text-wrapper-31">제목</div></th>
              <th class="cell-3"><div class="text-wrapper-32">등록일</div></th>
            </tr>
          </thead>
           <div class="nav1">
            <ol class="paging">
				<c:set var="page" value="${requestScope.page}"/>
				
				<c:if test="${page.startPage < page.pagePerBlock }">
					<li class="disable">&lt;</li>
				</c:if>
			
				<c:if test="${page.startPage >= page.pagePerBlock }">
				
				<li><a href="Controller?type=inquiry&cPage=${page.nowPage-page.pagePerBlock }">&lt;</a></li>
				</c:if>
			
				<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
				<c:if test="${vs.index eq page.nowPage }">
				<li class="now">${vs.index}</li>
			    </c:if> 
			    <c:if test="${vs.index ne page.nowPage }">
				<li><a href="Controller?type=inquiry&cPage=${vs.index}">${vs.index}</a></li>
				</c:if>
				</c:forEach>
			
			
				<c:if test="${page.endPage < page.totalPage }">
					
					<li><a href="Controller?type=inquiry&cPage=${page.nowPage+page.pagePerBlock}">&gt;</a></li>
				</c:if>
				
				<c:if test="${page.endPage > page.totalPage }">	
					<li class="disable">&gt;</li>
				</c:if>	

              </ol>
          </div>
          <tbody>
			 <c:forEach items="${ivo}" var="vo" varStatus="vs"> 
            <tr>
              <td class="data"><div class="text-wrapper-33">${requestScope.page.totalRecode - ((requestScope.page.nowPage -1) * requestScope.page.numPerPage + vs.index)}</div></td> 
              <td class="link-wrapper"><a href="Controller?type=inquiryView&iq_idx=${vo.iq_idx}&iq_title=${vo.iq_title}&cPage=${requestScope.page.nowPage}">${vo.iq_title }</a></td>
              <td class="data-2"><div class="text-wrapper-34">${vo.iq_time }</div></td>
            </tr> 
            </c:forEach>   
          </tbody>
        </table>   
          <p class="p">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</p>
        </div>
      </div>
    </div>
    <jsp:include page="/jsp/footer/footer.jsp"/>
  </body>
</html>
    