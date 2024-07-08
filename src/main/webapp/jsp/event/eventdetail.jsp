<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/event/eventdetail.css" />
  </head>
  <body style="position:relative;">
    <div class="screen">
      <div class="overlap-wrapper">
      <jsp:include page="/jsp/footer/footer.jsp"/>
        <div class="overlap">
          <div class="container">
            <div class="heading">이벤트 상세보기</div>
             <jsp:include page="/jsp/header/header.jsp"/>
            <div class="overlap-group-2">
              <div class="rectangle"></div>
              <div class="text-wrapper-8">${evo.n_title }</div>
            <div class="rectangle-2"></div>
          </div>
          <div class="element" style="background-image: none;">
            <img src="${pageContext.request.contextPath}/img/event/eventdetail/${evo.n_img}.jpg" style="width: 100%; height: auto;"> </div>
            </div>
        </div>
      </div>
    </div>
      <jsp:include page="/jsp/footer/footer.jsp"/>
  </body>
</html>
