<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/admin/adminMovieGlobals.css" />
    <link rel="stylesheet" href="css/admin/adminMovieStyle.css" />
  </head>
  <body>
    <div class="DB">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="div-sidebar">
            <img class="element" src="img/1.png" />
            <div class="text-wrapper">관리자</div>
            <div class="list">
              <div class="item-link"><div class="div"><a href="Controller?type=adminMovieDb">영화관리</a></div></div>
              <div class="div-wrapper"><div class="text-wrapper-2"><a href="Controller?type=adminEvent">이벤트/혜택 관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-3"><a href="Controller?type=adminCpHome">쿠폰관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-4"><a href="Controller?type=adminNotice">고객센터 관리</a></div></div>
            </div>
          </div>
          <div class="div-con-wrap">
            <div class="nav">
              <div class="strong"><div class="text-wrapper-5">1</div></div>
              <div class="link"><div class="text-wrapper-6">2</div></div>
              <div class="link-2"><div class="text-wrapper-6">3</div></div>
              <div class="link-3"><div class="text-wrapper-6">4</div></div>
              <div class="link-4"><div class="text-wrapper-6">5</div></div>
              <div class="link-5"><div class="text-wrapper-6">6</div></div>
              <div class="link-6"><div class="text-wrapper-6">7</div></div>
              <div class="link-7"><div class="text-wrapper-6">8</div></div>
              <div class="link-8"><div class="text-wrapper-6">9</div></div>
              <div class="link-9"><div class="text-wrapper-7">10</div></div>
              <div class="link-10"></div>
              <div class="link-11"></div>
            </div>
            <button class="button">
              <div class="container"><div class="text-wrapper-8">구분</div></div>
              <img class="image" src="img/image.png" />
            </button>
            <div class="border">
              <div class="input">
                <div class="container-2"><div class="text-wrapper-9">검색어를 입력해 주세요.</div></div>
              </div>
              <div class="button-2"></div>
            </div>
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
                <form id="searchForm" action="Controller?type=adminMovie" method="post">
			    시작 년도: <input type="text" name="openStartDt" required> &nbsp;
			    종료 년도: <input type="text" name="openEndDt" required> &nbsp;
			    <button type="submit">조회</button>
				</form>
            <div class="overlap-group">
              <div class="view"><div class="text-wrapper-14">API</div></div>
              <div class="view-2"><div class="text-wrapper-15">DB</div></div>
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
