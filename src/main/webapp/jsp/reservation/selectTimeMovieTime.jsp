<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="schedule-container">
	<c:if test="${time == null }">
		<img class="img" src="img/reservation/background.png" />
	</c:if>
  <c:forEach var="time" items="${time}" varStatus="status">
    <div class="time-seat-button">
      <div class="time">${fn:substring(time, 0, 5)}</div>
      <div class="info">
        <span class="seats"><span class="available">40</span>/<span class="total">56</span></span>
        <span class="theater">9관</span>
      </div>
    </div>
  </c:forEach>
</div>