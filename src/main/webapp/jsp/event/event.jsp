<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/event/event.css" />
  </head>
  <body>
    <div class="screen">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="container">
            <div class="heading">이벤트</div>
            <div class="overlap-group">
                <p class="element">
                  <span class="text-wrapper">전체 </span>
                  <span class="span">${cnt }</span>
                  <span class="text-wrapper">건</span>
                </p>
              <div class="list-wrapper">
                <div class="list">
                <c:forEach items="${ear}" var="ear" varStatus="vs">
                  <div class="item-link">
                  	<a href="Controller?type=eventdetail&n_idx=${ear.n_idx}">
                    <div class="background">
                    <div class="div" style="background-image: url('${pageContext.request.contextPath}/img/event/event/${ear.n_banner}.png'); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
                    </div>
                    <div class="div-wrapper"><div class="p">${ear.n_title }
                    <div class="date">
                    <fmt:parseDate value="${ear.n_time}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
    				<fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd" />~소진시 까지</div>
    				</div>
    				</div>
                    </a>
                  </div>
                 </c:forEach> 
                </div>
              </div>
            </div>
<<<<<<< HEAD
             <jsp:include page="/jsp/header/header.jsp"/>
            <jsp:include page="/jsp/footer/footer.jsp"/>
=======
            <jsp:include page="/jsp/header/header.jsp"/>
>>>>>>> de098d57607d524e5a7719055510e3006fe53f26
          </div>
        </div>
      </div>
    </div>
            <jsp:include page="/jsp/footer/footer.jsp"/>
  </body>
</html>
