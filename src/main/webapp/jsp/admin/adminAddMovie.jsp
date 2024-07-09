<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminAddMovieGlobals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminAddMovieStyle.css" />
  </head>
  <body>
    <div class="API">
      <div class="div">
        <div class="overlap">
          <div class="row">
            <div class="cell"><div class="label">첨부파일 경로</div></div>
            <div class="data">
              <input type="text" class="input">
              <input type="file" class="fileText">
            </div>
          </div>
          <div class="row-3">
            <div class="cell"><div class="label">장르</div></div>
            <div class="data">
              <div class="input-4">${movie.genreNm }</div>
              <div class="input-5">${movie.directors }</div>
              <div class="input-6">${movie.actors } </div>
              <div class="cell-2"><div class="label">감독</div></div>
              <div class="cell-3"><div class="label">출연</div></div>
            </div>
          </div>
          <div class="row-4">
            <div class="cell"><div class="label">개봉일</div></div>
            <div class="overlap-group">
              <div class="cell-4"><div class="label-3">상영시간</div></div>
              <div class="cell-5"><div class="label-3">관람등급</div></div>
              <div class="cell-6"><div class="label-4">누적관람객 수</div></div>
              <div class="data-2">
                <div class="input-7">${movie.openDt }</div>
                <div class="input-8">${movie.showTm }분</div>
                <div class="input-9">${movie.watchGradeNm }</div>
                <div class="input-10">${param.audiAcc }명</div>
              </div>
            </div>
          </div>
          <div class="row-5">
            <div class="cell-7"><div class="label">영화명</div></div>
            <div class="input-wrapper"><div class="input-11">${movie.movieNm }</div></div>
          </div>
          <div class="row-6">
            <div class="cell-8">
              <p class="p"><span class="span">줄거리 </span></p>
            </div>
            <div class="border-wrapper">
               <div class="overlap-group-2">
                 <div class="container"><div class="text-wrapper-3">0 / 2000</div></div>
                 <textarea class="text-wrapper-4" id="area"></textarea>
               </div>
            </div>
          </div>
        </div>
        <form id="add" action="Controller?type=adminAddMovie" method="post">
           <input type="hidden" id="nameData" name="nameData" value="">
           <input type="hidden" id="timeData" name="timeData" value="">
           <input type="hidden" id="dateData" name="dateData" value="">
           <input type="hidden" id="fileData" name="fileData" value="">
           <input type="hidden" id="contentData" name="contentData" value="">
           <input type="hidden" id="submit" name="submit" value="submit">
           <input type="hidden" id="movieCd" name="movieCd" value="${movie.movieCd }">
           <button type="submit" id="goAdd" class="button-2 "><div class="text-wrapper-5">등록</div></button>
        </form>
        <button class="button-3"><div class="text-wrapper-6">목록</div></button>
        <div class="heading">영화관리</div>
        <div class="span-name"><div class="text-wrapper-7">관리자 님</div></div>
        <div class="list">
          <div class="item">
            <div class="link">
              <div class="text-wrapper-8" id="logout"><a href="${pageContext.request.contextPath}/Controller?type=logout">로그아웃</a></div>
            </div>
          </div>
        </div>
        <img class="line" src="img/line-2.svg" />
        <div class="text-wrapper-9">영화 추가</div>
        <jsp:include page="/jsp/admin/menu/menu.jsp"></jsp:include>
      </div>
    </div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
let date;
let name, time;
$(function() {
    // 파일 선택시 경로 표시
    $('.fileText').on('change', function(event) {
        var file = event.target.files[0];
        if (file) {
            $('.input').val(file.name);
        } else {
            $('.input').val('');
        }
    });

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
    });

    $(".time").click(function() {
        time = $(this).text();
    });

    let checkClick = null;
    let checkGuan = null;
    let checkMovie = null;
    let checkTime = null;
    let checkDate = null;

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

    let $daysContainer = $('#days');
    let $monthContainer = $('#current-month');

    let today = new Date();
    let currentMonth = today.getMonth(); // 0부터 시작합니다.
    let currentDate = today.getDate();
    let currentDay = today.getDay();

    let daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
    let monthNames = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];

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
    $("#goAdd").click(function() {
       let content = $("#area").val();
       console.log(content)
       $("#contentData").val(content);

       let file = $(".input").val()
       $("#fileData").val(file)
       console.log(file)
       
       $("#add").submit(); // form을 submit하는 코드입니다.
   });

    
});
   

// 모달창 열기
function showDialog() {
    $("#myModal").css("display", "block");
}

// 모달창 닫기
function closeDialog() {
    $("#myModal").css("display", "none");
}


const settings = {
     async: true,
     crossDomain: true,
     
     url: 'https://api.themoviedb.org/3/search/movie?query=${movie.movieNm}&include_adult=false&language=ko-KR&page=1&year=${movie.openDt.substring(0,4)}',
     method: 'GET',
     headers: {
       accept: 'application/json',
       Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzYzMjcxODhhNjViZTE5YTc4MjhjNzY4Y2NhNzg3NCIsIm5iZiI6MTcxOTg4NjExNC4yNjk4NzEsInN1YiI6IjY2ODM1ZWZmOTg4NzA5NzNhZTJiZWQ2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T8d6wDtewcUbAw4oecS_48QB4EolWbMIODHZ_GxvLXI'
     }
   };

   $.ajax(settings).done(function (response) {
     console.log(response);

     var results = response.results;

     var posterPath = "https://image.tmdb.org/t/p/w500/" + results[0].poster_path;

     var overview = results[0].overview;
     console.log(posterPath);
     console.log(overview);

     $(".input").val(posterPath);
     $("#area").val(overview);
   });
   
   //아이디가 로그아웃을 클릭했을때 로그아웃할거냐고 경고창
    document.querySelector('#logout').addEventListener('click', function(event) {
        var confirmLogout = confirm("로그아웃하시겠습니까?");
        if (!confirmLogout) {
            // 사용자가 취소를 클릭하면 이벤트를 중단합니다.
            event.preventDefault();
        }
    });
    
</script>
  </body>
</html>
