<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="movie-container">
<c:forEach var="vo" items="${list }">
<div class="item-link-7 movie">
  <div class="overlap-group">
    <div class="strong-3"><div class="text-wrapper-12 name">${vo.mvo.movieNm }</div></div>
    <c:if test="${vo.mvo.watchGradeNm == '전체관람가' }">
	    <img class="image-background" src="img/reservation/image-background.svg" />
    </c:if>
    <c:if test="${vo.mvo.watchGradeNm == '12세이상관람가' }">
	    <img class="image-background" src="img/reservation/image-background-10.svg" />
    </c:if>
    <c:if test="${vo.mvo.watchGradeNm == '15세이상관람가' }">
	    <img class="image-background" src="img/reservation/image-background-16.svg" />
    </c:if>
  </div>
  <div class="overlap-2 movie">
    <img class="img" src="img/reservation/image-background-2.png" />
    <img class="image-background" src="img/reservation/image-background-2.png" />
  </div>
</div>
</c:forEach>
</div>