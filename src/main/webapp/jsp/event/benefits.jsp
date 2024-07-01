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
                    <div class="div" style="background-image: url('${pageContext.request.contextPath}/img/event/benefits/${bar.n_banner}.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
                    </div>
                    <div class="div-wrapper"><p class="p">${bar.n_title }</p></div>
                    </a>
                  </div>
                 </c:forEach> 
                </div>
              </div>
            </div>
            <div class="overlap-2">
              <img class="overlay" src="${pageContext.request.contextPath}/img/event/benefits/overlay.svg" />
              <div class="navbar">
                <div class="link"><div class="text-wrapper-9">회원가입</div></div>
                <div class="link-2"><div class="text-wrapper-9">고객센터</div></div>
                <div class="link-3"><div class="text-wrapper-10">관리자</div></div>
                <div class="text-wrapper-11">로그인</div>
                <div class="link-4"><div class="text-wrapper-9">빠른예매</div></div>
                <img class="img" src="${pageContext.request.contextPath}/img/event/benefits/link.png" />
                <img class="link-5" src="${pageContext.request.contextPath}/img/event/benefits/link-1.png" />
                <img class="link-6" src="${pageContext.request.contextPath}/img/event/benefits/link-2.png" />
                <div class="text-wrapper-12">예매</div>
                <a href="Controller?type=movielist" target="_blank" rel="noopener noreferrer"
                  ><div class="text-wrapper-13">영화</div></a
                >
                <a href="Controller?type=event" target="_blank" rel="noopener noreferrer"
                  ><div class="text-wrapper-14">이벤트</div></a>
                <a href="Controller?type=benefits" target="_blank" rel="noopener noreferrer"
                  ><div class="text-wrapper-15">혜택</div></a
                >
                <img class="heading-link" src="${pageContext.request.contextPath}/img/event/benefits/heading-1-link.png" />
                <div class="link-7"></div>
              </div>
            </div>
            <img class="footer" src="${pageContext.request.contextPath}/img/event/benefits/footer.png" />
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
