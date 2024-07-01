<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/event/eventdetail.css" />
  </head>
  <body>
    <div class="screen">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="container">
            <div class="heading">이벤트 상세보기</div>
            <div class="overlap-group">
              <img class="overlay" src="${pageContext.request.contextPath}/img/event/eventdetail/overlay.svg" />
              <div class="navbar">
                <div class="link"><div class="text-wrapper">회원가입</div></div>
                <div class="div-wrapper"><div class="text-wrapper">고객센터</div></div>
                <div class="div"><div class="text-wrapper-2">관리자</div></div>
                <div class="text-wrapper-3">로그인</div>
                <div class="link-2"><div class="text-wrapper">빠른예매</div></div>
                <img class="img" src="${pageContext.request.contextPath}/img/event/eventdetail/link.png" />
                <img class="link-3" src="${pageContext.request.contextPath}/img/event/eventdetail/link-1.png" />
                <img class="link-4" src="${pageContext.request.contextPath}/img/event/eventdetail/link-2.png" />
               <a href="Controller?type=selectTime" target="_blank" rel="noopener noreferrer">
               <div class="text-wrapper-4">예매</div></a>
                <a href="Controller?type=movielist" target="_blank" rel="noopener noreferrer">
                <div class="text-wrapper-5">영화</div></a>
                <a href="Controller?type=event" target="_blank" rel="noopener noreferrer">
                <div class="text-wrapper-6">이벤트</div></a>
                <a href="Controller?type=benefits" target="_blank" rel="noopener noreferrer">
                <div class="text-wrapper-7">혜택</div></a>
                <img class="heading-link" src="${pageContext.request.contextPath}/img/event/eventdetail/heading-1-link.png" />
                <div class="link-5"></div>
              </div>
            </div>
            <div class="overlap-group-2">
              <div class="rectangle"></div>
              <div class="text-wrapper-8">${evo.n_title }</div>
            <div class="rectangle-2"></div>
          </div>
          <div class="element" style="background-image: none;">  <img src="${pageContext.request.contextPath}/img/event/eventdetail/${evo.n_img}.jpg" style="width: 100%; height: auto;"> </div>
     		 <jsp:include page="/jsp/footer/footer.jsp"/>
            </div>
        </div>
      </div>
    </div>
    
  </body>
</html>
