<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie/movieList.css" />
  </head>
  <body>
          <div class="overlap-group">
              <img class="overlay" src="${pageContext.request.contextPath}/img/movie/movieList/overlay.svg" />
             <jsp:include page="/jsp/header/header.jsp"/>
            </div>
    <div class="div-wrapper">
      <div class="container-wrapper">
        <div class="container">
          <div class="div">
            <div class="border">
              <div class="input">
                <div class="container-2">
                	<form id="searchForm" action="Controller?type=movieslist" method="post">
	                	<input type="text" name="movieNm" class="text-wrapper" placeholder="영화명 검색"/>  
	           		 	<button class="button"></button>
	           		</form>
                </div>
              </div>
            </div>
            <div class="list">
             	 <div class="item-button"><a href="Controller?type=movielist" class="text-wrapper-2">예매순</a></div>
              <div class="item">
                <div class="text-wrapper-3"><a href="Controller?type=movierlist" class="button-2">관람평 많은순</a></div>
                <div class="vertical-divider"></div>
              </div>
            </div>
          </div>
          <div class="ordered-list">
          <c:forEach items="${mar}" var="mar" varStatus="vs">
            <div class="item-3">
              <div class="background">
                <div class="overlap-group" style="background-image: url('${mar.m_file}'); background-size: cover; background-repeat: no-repeat; background-position: center;"> 
                  <%-- 이미지 호버 --%>
                  <div class="MovieHover">
	                <a href="Controller?type=moviedetail&movieCd=${mar.movieCd}">
	               	 <div class="MovieHover_text">${mar.m_plot}</div><%-- 줄거리 --%>
	                </a>
                 </div>
                  <div class="text-wrapper-5">
			            <c:if test="${requestScope.type eq 'movierlist'}">
			                ${mar.rvo.review_count} <%-- MovieRlistAction에서 넘어온 경우 --%>
			            </c:if>
			            <c:if test="${requestScope.type ne 'movierlist'}">
			                ${mar.dvo.rank} <%-- 다른 Action에서 넘어온 경우 --%>
			            </c:if>
                  </div>
                </div>
              </div>
              <div class="container-3"><div class="text-wrapper-6">${mar.movieNm}</div>
              <div class="image" style="background-image: url('${pageContext.request.contextPath}/img/movie/movieList/${mar.watchGradeNm}.png'); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
              </div>
              <div class="container-4">
                <div class="text-wrapper-7">예매율 <fmt:formatNumber value="${mar.dvo.salesShare}"/>%</div>
                <div class="vertical-divider-2"></div>
                <div class="text-wrapper-8">개봉일 
                <fmt:parseDate value="${mar.openDt}" pattern="yyyyMMdd" var="parsedDate"/>
    			<fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd" /></div>
              </div>
              <div class="link-wrapper">
                <div class="link"><a href="Controller?type=selectTime&movieCd=${mar.movieCd}" class="text-wrapper-9">예매</a></div>
              </div>
            </div>
            </c:forEach>
         
          
        
          <div class="nav1 button-4">
		            <ol class="paging">
		           	 
					
						<c:set var="page" value="${requestScope.page}"/>
						
						<c:if test="${page.startPage < page.pagePerBlock }">
							<li class="disable">&lt;</li>
						</c:if>
					
						<c:if test="${page.startPage >= page.pagePerBlock }">
						
						<li><a href="Controller?type=movielist&cPage=${page.nowPage-page.pagePerBlock }">&lt;</a></li>
						</c:if>
					
						<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
						<c:if test="${vs.index eq page.nowPage }">
						<li class="now">${vs.index}</li>
					    </c:if> 
					    <c:if test="${vs.index ne page.nowPage }">
						<li><a href="Controller?type=movielist&cPage=${vs.index}">${vs.index}</a></li>
						</c:if>
						</c:forEach>
					
					
						<c:if test="${page.endPage < page.totalPage }">
							
							<li><a href="Controller?type=movielist&cPage=${page.nowPage+page.pagePerBlock}">&gt;</a></li>
						</c:if>
						
						<c:if test="${page.endPage > page.totalPage }">	
							<li class="disable">&gt;</li>
						</c:if>	
		
		              </ol>
		          </div> 
          </button>
          </div>
          
        </div>
      </div>
    </div>
          <jsp:include page="/jsp/footer/footer.jsp"/>
    <script>
    var movieHoverElements = document.querySelectorAll('.MovieHover');

    movieHoverElements.forEach(function (element) {
        element.parentElement.addEventListener('mouseover', function () {
            element.style.display = 'block';
        });
        element.parentElement.addEventListener('mouseout', function () {
            element.style.display = 'none';
        });
    });
    
    var moviePlot = document.querySelectorAll('.MovieHover_text');
    moviePlot.forEach(function (element) {
       if(element.innerText.length > 150){
          element.innerText = element.innerText.substring(0, 150) + '...';
       }
    });
    
</script>
</body>
</html>
