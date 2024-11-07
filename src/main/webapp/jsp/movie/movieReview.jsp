<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="all">
<c:forEach var="list" items="${list }">
 <div class="frame"> 
 	<div class="frame-2">${list.u_id}</div> 
 <div class="overlap-13">
 <div class="text-wrapper-27">${list.r_date}</div>
<button type="button" class="recommBtn" onclick="recommReview(${list.r_idx})"></button>
</div>
<div class="frame-3">${list.r_content}</div>

 <c:if test="${list.r_grade >= 3}">
        <img class="img-2" src="${pageContext.request.contextPath}/img/movie/movieDetail/happyImg.png" alt="평점 이미지" />
    </c:if>
    <c:if test="${list.r_grade < 3}">
        <img class="img-2" src="${pageContext.request.contextPath}/img/movie/movieDetail/sadImg.png" alt="평점 이미지" />
    </c:if>
    
	<c:if test="${list.u_code == sessionScope.mvo.u_code}"> 
        <button type="button" class="deleteBtn" onclick="deleteReview(${list.r_idx})">삭제</button>
    </c:if>
</div>
</c:forEach>
</div>
