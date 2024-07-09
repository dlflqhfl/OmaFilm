<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/event/benefits.css" />
  </head>
  <body>
    <div class="screen">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="container">
            <div class="heading">혜택</div>
            <div class="overlap-group">
                <p class="element">
                  <span class="text-wrapper">전체 </span>
                  <span class="span">${cnt }</span>
                  <span class="text-wrapper">건</span>
                </p>
              <div class="list-wrapper">
                <div class="list">
                <c:forEach items="${bar}" var="bar" varStatus="vs">
                  <div class="item-link">
                  <a href="Controller?type=benefitdetail&n_idx=${bar.n_idx}">
                    <div class="background">
                    <div class="div" style="background-image: url('${bar.n_banner}'); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
                    </div>
                    <div class="div-wrapper"><p class="p">${bar.n_title }</p></div>
                    </a>
                  </div>
                 </c:forEach> 
                </div>
              </div>
            </div>
            <jsp:include page="/jsp/header/header.jsp"/>
          </div>
        </div>
      </div>
    </div>
            <jsp:include page="/jsp/footer/footer.jsp"/>
  </body>
</html>
