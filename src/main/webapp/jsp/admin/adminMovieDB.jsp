<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminMovieGlobals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminMovieDbStyle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminSelectTimeglobals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminSelectTimeStyle.css" />
</head>
<body>
<div class="DB">
    <div class="overlap-wrapper">
        <div class="overlap">
          <div class="div-sidebar">
            <img class="element" src="img/adminMovie/1.png" />
            <div class="text-wrapper">관리자</div>
            <div class="list">
              <div class="item-link"><div class="div">영화관리</div></div>
              <div class="div-wrapper"><div class="text-wrapper-2">이벤트/혜택 관리</div></div>
              <div class="item-link-2"><div class="text-wrapper-3">쿠폰관리</div></div>
              <div class="item-link-2"><div class="text-wrapper-4">고객센터 관리</div></div>
            </div>
          </div>
          <div class="div-con-wrap">
            <button class="button" onclick="search()">검색</button>
            <div class="border">
              <div class="input">
                <div class="container-2"><input type="text" id="search" name="search" class="text-wrapper-9" placeholder="영화제목을 입력해주세요"></div>
              </div>
              <div class="button-2"></div>
            </div>
            <div class="cell"><div class="text-wrapper-10">삭제</div></div>
            <div class="cell-2"><div class="text-wrapper-11" onclick="dialog()">시간 추가</div></div>
       	 	<div id="myModal" class="modal">
       			<div class="modal-content">
       				<%@ include file="/jsp/admin/adminSelectTime.jsp" %>
       			</div>
       		</div>
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
                <div class="menu">
                    <a href="Controller?type=adminMovieApi"><div class="view"><div class="text-wrapper-14">API</div></div></a>
                    <a href="Controller?type=adminMovieDb"><div class="view-2"><div class="text-wrapper-15">DB</div></div></a>
                </div>
            </div>
            <div class="heading">영화관리</div>
            
                  <div class="nav1">
                    <ol class="paging">

                        <c:set var="page" value="${requestScope.page}"/>

                        <c:if test="${page.startPage < page.pagePerBlock }">
                            <li class="disable">&lt;</li>
                        </c:if>

                        <c:if test="${page.startPage >= page.pagePerBlock }">

                            <li><a href="Controller?type=adminMovieDb&cPage=${page.nowPage-page.pagePerBlock }">&lt;</a></li>
                        </c:if>

                        <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
                            <c:if test="${vs.index eq page.nowPage }">
                                <li class="now">${vs.index}</li>
                            </c:if>
                            <c:if test="${vs.index ne page.nowPage }">
                                <li><a href="Controller?type=adminMovieDb&cPage=${vs.index}">${vs.index}</a></li>
                            </c:if>
                        </c:forEach>


                        <c:if test="${page.endPage < page.totalPage }">

                            <li><a href="Controller?type=adminMovieDb&cPage=${page.nowPage+page.pagePerBlock}">&gt;</a></li>
                        </c:if>

                        <c:if test="${page.endPage >= page.totalPage }">
                            <li class="disable">&gt;</li>
                        </c:if>

                    </ol>
                </div>
            
            <table class="movie-table">
                <thead>
                <tr>
                    <th>선택</th>
                    <th>번호</th>
                    <th>영화 제목</th>
                    <th>개봉일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="movie" items="${ar }" varStatus="num">
                    <tr>
                        <td><input type="checkbox" id="checkbox" name="movieCd" value="${movie.movieCd }"/></td>
                        <td>${num.index + 1}</td>
                        <td>${movie.movieNm}</td>
                        <td>${movie.openDt}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <form id="screenAdd" action="Controller?type=adminMovieDb" method="post">
                <input type="hidden" id="nameData" name="nameData" value="">
                <input type="hidden" id="dateData" name="dateData" value="">
                <input type="hidden" id="timeData" name="timeData" value="">
                <input type="hidden" id="movieCd" name="movieCd" value="">
            </form>
            
            <form id="searchDb" action="Controller?type=adminMovieDb" method="post">
            	<input type="hidden" id="searchData" name="searchData" value="">
            </form>
        </div>
    </div>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
<script type="text/javascript">

    let date;
    let name, time;

    let checkClick = null;
    let checkGuan = null;
    let checkMovie = null;
    let checkTime = null;
    let checkDate = null;


    let $daysContainer = $('#days');
    let $monthContainer = $('#current-month');

    let today = new Date();
    let currentMonth = today.getMonth(); // 0부터 시작합니다.
    let currentDate = today.getDate();
    let currentDay = today.getDay();

    let daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
    let monthNames = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
	
    
    
    function search(){
    	let search = $("#search").val()
    	
    	$("#searchData").val(search);
    	$("#searchDb").submit();
    }
    
    //모달창 열기
    function dialog() {
        $("#myModal").css("display", "block");
    }

    // 모달창 닫기
    function closeDialog() {
        $("#myModal").css("display", "none");
    }

    $(function(){

        $("#sb").click(function(){
            let movieCd = $("input[name='movieCd']:checked").val();
            $("#nameData").val(name)
            $("#dateData").val(date)
            $("#timeData").val(time)


            $("#movieCd").val(movieCd)
            $("#screenAdd").submit()

        })

        // 모달창 닫기
        $(".text-wrapper-21").click(function() {
            closeDialog();
        });

        // 모달창 외부 클릭시 닫기
        $(window).click(function(event) {
            if ($(event.target).is(".modal")) {
                closeDialog();
            }
        });

        $(".guan").click(function() {
            name = $(this).text();
            console.log(name)
        });

        $(".time").click(function() {
            time = $(this).text();
            console.log(time)
        });

        // 선택확인
        function check(element, selector, color, type) {
            if (checkClick) {
                $(checkClick).css('background-color', '');
            }
            $(element).css('background-color', color);
            if (type === 1 && checkGuan && checkGuan !== element) { // checkGuan이 존재하고, 현재 클릭된 요소와 다를 때
                $(checkGuan).css('background-color', '');
            } else if (type === 2 && checkMovie && checkMovie !== element) {
                $(checkMovie).css('background-color', '');
            } else if (type === 3 && checkTime && checkTime !== element) {
                $(checkTime).css('background-color', '');
            } else if (type === 4 && checkDate && checkDate !== element) {
                $(checkDate).css('background-color', '');
            }

            $(element).css('background-color', color);

            // 선택된 요소 업데이트
            if (type === 1) {
                checkGuan = element;
            } else if (type === 2) {
                checkMovie = element;
            } else if (type === 3) {
                checkTime = element;
            } else if (type === 4) {
                checkDate = element;
            }
        }

        $(".guan").click(function() {
            check(this, '.guan', '#C0C0C0', 1); // 관 선택 시 배경색 변경
        });
        $(".movie").click(function() {
            check(this, '.movie', '#C0C0C0', 2); // 영화 선택 시 배경색 변경
        });
        $(".time").click(function() {
            check(this, '.time', '#C0C0C0', 3); // 시간 선택 시 배경색 변경
        });

        $('.guan').hover(function() {
            if (this !== checkGuan) { // 선택된 요소가 아닐 때만 hover 효과 적용
                $(this).css('background-color', '#C0C0C0');
            }
        }, function() {
            if (this !== checkGuan) { // 선택된 요소가 아닐 때만 hover 효과 제거
                $(this).css('background-color', '');
            }
        });
        $('.movie').hover(function() {
            if (this !== checkMovie) { // 선택된 요소가 아닐 때만 hover 효과 적용
                $(this).css('background-color', '#C0C0C0');
            }
        }, function() {
            if (this !== checkMovie) { // 선택된 요소가 아닐 때만 hover 효과 제거
                $(this).css('background-color', '');
            }
        });
        $('.time').hover(function() {
            if (this !== checkTime) { // 선택된 요소가 아닐 때만 hover 효과 적용
                $(this).css('background-color', '#C0C0C0');
            }
        }, function() {
            if (this !== checkTime) { // 선택된 요소가 아닐 때만 hover 효과 제거
                $(this).css('background-color', '');
            }
        });

        // 대한민국의 공휴일 (연도별로 업데이트 필요)
        const holidays = [
            new Date(today.getFullYear(), 0, 1),    // 설날
            new Date(today.getFullYear(), 2, 1),    // 삼일절
            new Date(today.getFullYear(), 4, 5),    // 어린이날
            new Date(today.getFullYear(), 5, 6),    // 현충일
            new Date(today.getFullYear(), 7, 15),   // 광복절
            new Date(today.getFullYear(), 9, 3),    // 개천절
            new Date(today.getFullYear(), 9, 9),    // 한글날
            new Date(today.getFullYear(), 11, 25)   // 성탄절
        ];

        $monthContainer.text(`${monthNames[currentMonth]}`);

        // 오늘의 날짜가 왼쪽에서 두 번째 위치에 나타나도록 위치 조정
        let startDay = today.getDay() - 1;
        if (startDay < 0) {
            startDay = 6; // 일요일의 경우
        }

        for (let i = -startDay; i <= 6 - startDay; i++) {
            let dayDate = new Date(today);
            dayDate.setDate(currentDate - currentDay + startDay + i);

            let $dayElement = $('<div></div>').addClass('day');

            let $dateElement = $('<span></span>').addClass('date').text(dayDate.getDate());

            if (dayDate.getDate() === currentDate) { // 오늘 날짜일 경우
                $dayElement.addClass('selected');
                const $dayNameElement = $('<span></span>').addClass('day-name').addClass("now").text('오늘');
                $dateElement.addClass('today').css('color', 'white'); // 오늘 날짜에는 하얀색 글자 적용
                $dayElement.append($dayNameElement);
            } else {
                const $dayNameElement = $('<span></span>').addClass('day-name').text(daysOfWeek[dayDate.getDay()]);
                $dayElement.append($dayNameElement);

                // 토요일은 파란색으로 표시
                if (dayDate.getDay() === 6) {
                    $dateElement.css('color', 'blue');
                } else {
                    // 일요일은 빨간색으로 표시
                    if (dayDate.getDay() === 0) {
                        $dateElement.css('color', 'red');
                    } else {
                        // 그 외의 요일은 기본 색상(검은색)으로 표시
                        $dateElement.css('color', 'black');
                    }
                }
            }

            // 공휴일이면 날짜를 빨간색으로 표시
            if (holidays.some(holiday => holiday.getTime() === dayDate.getTime())) {
                $dateElement.css('color', 'red');
            }

            $dayElement.append($dateElement);
            $daysContainer.append($dayElement);

            $daysContainer.on('click', '.date', function() {
                check(this, '.date', '#C0C0C0', 4); // 날짜 선택 시 배경색 변경
            });
        }

        $(".date").click(function() {
            let day = $(this).text(); // 예: "20"

            // 현재 날짜 정보를 가져옵니다.
            let today = new Date();
            let year = today.getFullYear(); // 현재 연도를 가져옵니다.
            let month = today.getMonth() + 1; // 현재 월을 가져옵니다. (월은 0부터 시작하므로 +1을 해줍니다.)

            // 선택한 일자를 기반으로 Date 객체 생성
            let selectedDate = new Date(year, month - 1, day); // month는 0부터 시작하므로 -1을 해줍니다.

            let selectedYear = selectedDate.getFullYear(); // 선택한 일자의 연도를 가져옵니다.
            let selectedMonth = selectedDate.getMonth() + 1; // 선택한 일자의 월을 가져옵니다.

            date = selectedYear + "-" + selectedMonth + "-" + day;
            console.log(date);
        });
    })



</script>
</body>
</html>