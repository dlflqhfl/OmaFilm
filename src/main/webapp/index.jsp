<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
<jsp:include page="jsp/header/header.jsp"/>
<div class="omakase-cinema">
    <div class="overlap-wrapper">
        <div class="overlap">
            <div class="background">
                <div class="overlap-group">
                    <div class="container">
                        <div class="view">
                            <div class="heading">오마카세 시네마 이벤트</div>
                            <div class="event-list">
                            <c:forEach items="${ear}" var="ear" varStatus="vs">
								<c:if test="${vs.index < 3}">
									<a href="Controller?type=eventdetail&n_idx=${ear.n_idx}">
		                                <div class="link">
		                                    <div class="strong">
		                                        <div class="text-wrapper">${ear.n_title }</div>
		                                    </div>
		                                    <div class="div"><fmt:parseDate value="${ear.n_time}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
    							<fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd" />~소진시 까지</div>
		                                    <div class="container-2" style="background-image: url('${pageContext.request.contextPath}/img/event/event/${ear.n_banner}.png'); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
		                                </div>
									</a>
								</c:if>
							</c:forEach> 
							</div>
                            <a href="Controller?type=event">
                            <div class="div-wrapper">
                                <div class="text-wrapper-4">더보기</div>
                            </div>
                            </a>
                        </div>
                        <div class="border-wrapper">
                            <div class="border">
                                <div class="group">
                                    <div class="horizontal-border">
                                        <div class="strong-2">공지사항</div>
                                        <a href="Controller?type=notice">
                                        <div class="link-4">
                                            <div class="text-wrapper-5">더보기</div>
                                        </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="horizontal-border-wrapper">
                                    <div class="horizontal-border">
                                        <div class="strong-3">혜택</div>
                                        <a href="Controller?type=benefits">
                                        <div class="link-5">
                                            <div class="text-wrapper-6">더보기</div>
                                        </div>
                                        </a>
                                    </div>
                                </div>
								<%-- 공지사항 --%>	
								<div class="notice-list">
								<c:forEach var="vo" items="${nar }" varStatus="vs">
								<c:if test="${vs.index < 5}">
                                <a href="Controller?type=noticedetail&n_idx=${vo.n_idx}&n_title=${vo.n_title}&cPage=${requestScope.page.nowPage}">
                                    <div class="OMAKASE">${vs.index+1}. ${vo.n_title}</div>
                                </a>
                                </c:if>
								</c:forEach>
								</div>
								<%-- 혜택 --%>	
								<div class="benefits-list">
								<c:forEach var="bar" items="${bar }" varStatus="vs">
								<c:if test="${vs.index < 4}">
                                <a href="Controller?type=benefitdetail&n_idx=${bar.n_idx}">
                                    <div class="link-7" style="background-image: url('${pageContext.request.contextPath}/img/event/benefits/${bar.n_banner}.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
                                </a>
                                </c:if>
								</c:forEach>
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="border-2"></div>
                    <div class="overlap-group-wrapper">
                        <div class="overlap-2"></div>
                    </div>
                </div>
            </div>
            <div class="top">
                <div class="customer-service">
                	<a href="Controller?type=home">
                    <div class="link-9">
                        <div class="image"></div>
                        <div class="text-wrapper-8">고객센터</div>
                    </div>
                    </a>
                    <a href="Controller?type=faq">
                    <div class="link-10">
                        <div class="image-2"></div>
                        <div class="text-wrapper-9">자주 묻는 질문</div>
                    </div>
                    </a>
                    <a href="Controller?type=sinquiry">
                    <div class="link-11">
                        <div class="image-3"></div>
                        <div class="text-wrapper-10">1:1 문의</div>
                    </div>
                    </a>
                    <a href="Controller?type=notice">
                    <div class="link-12">
                        <div class="image-4"></div>
                        <div class="text-wrapper-11">공지사항</div>
                    </div>
                    </a>
                    <a href="Controller?type=directions">
                    <div class="link-13">
                        <div class="image-5"></div>
                        <div class="text-wrapper-12">오시는 길</div>
                    </div>
                    </a>
                </div>
                <div class="container-wrapper">
                    <div class="container-4">
                        <button class="button">
                            <div class="text-wrapper-13">박스오피스</div>
                        </button>
                        <a href="Controller?type=movielist" target="_blank" rel="noopener noreferrer">
                            <div class="link-14">
                                <div class="text-wrapper-14">더 많은 영화보기</div>
                                <div class="image-6"></div>
                            </div
                            >
                        </a>
                        <div class="ordered-list">
	                        <c:forEach items="${mar}" var="mar" varStatus="vs">
	                        	<c:if test="${vs.index < 4}">
						            <div class="item">
						              <div class="link-15">
						                <div class="overlap-group-2" style="background-image: url('${mar.m_file}'); background-size: cover; background-repeat: no-repeat; background-position: center;">
						                  <%-- 이미지 호버 --%>
						                  <div class="MovieHover">
							                <a href="Controller?type=moviedetail&movieCd=${mar.movieCd}">
							               	 <div class="MovieHover_text">${mar.m_plot}</div><%-- 줄거리 --%>
							                </a>
						                 </div>
						                  <div class="background-3"><div class="text-wrapper-15">${mar.dvo.rank}</div></div>
						                </div>
						              </div>
						              <div class="container-5">
						                <div class="link-16"><a href="Controller?type=selectTime&movieCd=${mar.movieCd}" class="text-wrapper-16">예매</a></div>
						              </div>
						            </div>
					            </c:if>
					         </c:forEach>


				            <c:if test="${empty mar}">
				            	<div id="none">
		              			 죄송합니다. 상영 준비중입니다.<br/>
		              			 빠른 시일 내에 준비하겠습니다.
		              			</div>
		              		</c:if>
                        </div>
                        <div class="overlay">
                            <div class="horizontal-border-2">
                                <div class="input">
                                    <div class="container-6">
                                    	<form id="searchForm" action="Controller?type=movieslist" method="post">
                                       	 <input type="text" name="movieNm" class="text-wrapper-22" placeholder="영화명을 입력해 주세요"/>
                                       	 <button class="button-4"></button>
                                       	</form> 
                                    </div>
                                </div>
                                <a href="Controller?type=movielist">
                                    <div class="link-wrapper">
                                        <div class="link-19">
                                            <div class="image-14"></div>
                                            <div class="text-wrapper-24">박스오피스</div>
                                        </div>
                                    </div>
                                </a>
                                <a href="Controller?type=selectTime" target="_blank" rel="noopener noreferrer"
                                >
                                    <div class="vertical-border-2">
                                        <div class="link-20">
                                            <div class="image-15"></div>
                                            <div class="text-wrapper-25">빠른예매</div>
                                        </div>
                                    </div>
                                </a
                                >
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="jsp/footer/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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
