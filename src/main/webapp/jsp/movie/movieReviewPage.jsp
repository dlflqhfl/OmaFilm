<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ol class="paging">
	<c:set var="page" value="${requestScope.page}"/>
	
	<c:if test="${page.startPage < page.pagePerBlock }">
		<li class="disable">&lt;</li>
	</c:if>
	<c:if test="${page.startPage >= page.pagePerBlock }">
	
	<li><a href="javascript:reviewList2('${page.nowPage - page.pagePerBlock}')">&lt;</a></li>
	</c:if>

	<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
		<c:if test="${vs.index eq page.nowPage }">
		<li class="now"><a href="javascript:reviewList2('${vs.index}')">${vs.index}</a></li>
	    </c:if> 
	    <c:if test="${vs.index ne page.nowPage }">
		<li><a href="javascript:reviewList2('${vs.index}')">${vs.index}</a></li>
		</c:if>
	</c:forEach>


	<c:if test="${page.endPage > page.totalPage }">
		
		<li><a href="javascript:reviewList2('${page.nowPage+page.pagePerBlock}')">&gt;</a></li>
	</c:if>
	
	<c:if test="${page.endPage <= page.totalPage }">	
		<li class="disable">&gt;</li>
	</c:if>	

</ol>