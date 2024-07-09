<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/event/benefitdetail.css" />
  </head>
  <body style="position:relative;">
  <jsp:include page="/jsp/header/header.jsp"/>
    <div class="screen">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="container">
            <div class="heading">혜택 상세보기</div>
            <div class="overlap-group-2">
              <div class="rectangle"></div>
              <div class="text-wrapper-8">${bvo.n_title }</div>
            <div class="rectangle-2"></div>
          </div>
          <div class="element" style="background-image: none;">  
          <img src="${bvo.n_img}" style="width: 100%; height: auto;"> </div>
            </div>
        </div>
      </div>
    </div>
      <jsp:include page="/jsp/footer/footer.jsp"/>
  </body>
</html>
