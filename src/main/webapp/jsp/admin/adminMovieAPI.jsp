<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminMovieGlobals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminMovieApiStyle.css" />
</head>
<body>
<div class="DB">
    <div class="overlap-wrapper">
        <div class="overlap">
            <div class="div-sidebar">
                <img class="element" src="img/admin/1.png" />
                <div class="text-wrapper">관리자</div>
                <div class="list">
                    <div class="item-link"><div class="div">영화관리</div></div>
                    <div class="div-wrapper"><div class="text-wrapper-2">이벤트/혜택 관리</div></div>
                    <div class="item-link-2"><div class="text-wrapper-3">쿠폰관리</div></div>
                    <div class="item-link-2"><div class="text-wrapper-4">고객센터 관리</div></div>
                </div>
            </div>
            <div class="div-con-wrap">
		 			<div class="nav1">
                    <ol class="paging">

                        <c:set var="page" value="${requestScope.page}"/>

                        <c:if test="${page.startPage < page.pagePerBlock }">
                            <li class="disable">&lt;</li>
                        </c:if>

                        <c:if test="${page.startPage >= page.pagePerBlock }">

                            <li><a href="Controller?type=adminMovieApi&cPage=${page.nowPage-page.pagePerBlock }">&lt;</a></li>
                        </c:if>

                        <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
                            <c:if test="${vs.index eq page.nowPage }">
                                <li class="now">${vs.index}</li>
                            </c:if>
                            <c:if test="${vs.index ne page.nowPage }">
                                <li><a href="Controller?type=adminMovieApi&cPage=${vs.index}">${vs.index}</a></li>
                            </c:if>
                        </c:forEach>


                        <c:if test="${page.endPage < page.totalPage }">

                            <li><a href="Controller?type=adminMovieApi&cPage=${page.nowPage+page.pagePerBlock}">&gt;</a></li>
                        </c:if>

                        <c:if test="${page.endPage >= page.totalPage }">
                            <li class="disable">&gt;</li>
                        </c:if>

                    </ol>
                </div>
                	<form action="Controller?type=adminMovieApi" method="post">
	                    <input class="border" id="searchData" name="searchData" placeholder="영화제목을 입력하세요">
		                <button class="button">검색</button>
                	</form>
                    <div class="button-2"></div>
                <div class="cell"><div class="text-wrapper-10">삭제</div></div>
                <div class="cell-2"><div class="text-wrapper-11">시간 추가</div></div>
                <div class="frame">
                    <div class="span-name"></div>
                    <div class="text-wrapper-12">관리자 님</div>
                    <div class="item-wrapper">
                        <div class="item">
                            <div class="link-12">
                                <div class="text-wrapper-13">로그아웃</div>
                                <div class="pseudo"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="heading">영화관리</div>
                <form id="searchForm" action="Controller?type=adminMovieApi" method="post">
                    시작 년도: <input type="text" name="openStartDt" required> &nbsp;
                    종료 년도: <input type="text" name="openEndDt" required> &nbsp;
                    <button type="submit">조회</button>
                </form>
                <div class="overlap-group">
                    <a href="Controller?type=adminMovieApi"><div class="view"><div class="text-wrapper-14">API</div></div></a>
                    <a href="Controller?type=adminMovieDb"><div class="view-2"><div class="text-wrapper-15">DB</div></div></a>
                </div>
                <table class="movie-table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>영화 제목</th>
                        <th>개봉일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="movie" items="${movie }" varStatus="num">
                        <tr>
                            <td>${num.index + 1}</td>
                            <td><a href="Controller?type=adminAddMovie&movieCd=${movie.movieCd }" class="movie-link">${movie.movieNm}</a></td>
                            <td>${movie.openDt}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
<script type="text/javascript">
    $(function() {
        let audiAcc = ${count};

        $('.movie-link').each(function() {
            let path = $(this).attr('href');
            if (path) { // href 값이 존재하는 경우에만 처리
                path += "&audiAcc=" + audiAcc; // audiAcc 값을 추가
                $(this).attr('href', path); // 수정된 URL을 href 속성에 설정
            }
        });
    });
</script>
</body>
</html>