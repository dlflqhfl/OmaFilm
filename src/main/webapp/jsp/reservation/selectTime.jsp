  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head> 
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation/selectTimeGlobals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation/selectTimeStyle.css" />
  </head>
  <body>
 <jsp:include page="/jsp/header/header.jsp"/>
    <div class="select-movie">
      <div class="div">
        <div class="list">
          <div class="item">
            <div class="div-2">
              <div class="link">
                <div class="strong">
                  <div class="text-wrapper">01</div>
                  <div class="text-wrapper-2">상영시간</div>
                </div>
              </div>
              <div class="div-wrapper"><div class="text-wrapper-3">현재 단계</div></div>
            </div>
          </div>
          <div class="link-wrapper">
            <div class="div-2">
              <div class="strong-2">
                <div class="text-wrapper-4">02</div>
                <div class="text-wrapper-5">인원/좌석</div>
              </div>
            </div>
          </div>
          <div class="item-2">
            <div class="div-2">
              <div class="strong-2">
                <div class="text-wrapper-4">03</div>
                <div class="text-wrapper-6">결제</div>
              </div>
            </div>
          </div>
          <div class="item-3">
            <div class="div-2">
              <div class="strong-2">
                <div class="text-wrapper-4">04</div>
                <div class="text-wrapper-7">결제완료</div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="overlap">
            
            <div class="background-3">
              <div class="background-4"><div class="heading-2">영화 선택</div></div>
              <div class="vertical-border-2">
                <div class="horizontal-border"><div class="text-wrapper-10-1">영화목록</div>
                  <div class="container-2"><div class="text-wrapper-11">목</div></div>
                </div>
                <div class="container-wrapper">
                  <div class="list-3">
                      <div class="showMovie"></div>
                     </div>
                </div>
              </div>
            </div><div class="background">
              <div class="heading-wrapper"><div class="heading">영화관</div></div>
              <div class="list-2">
                  <div class="button"><div class="text-wrapper-10">상영관</div></div><div class="list-wrapper">
                        <div class="item-link-25 guan" style=""><div class="text-wrapper-24">쌍용 1관</div></div>
                      <div class="item-link-25 guan" style=""><div class="text-wrapper-24">쌍용 1관</div></div><div class="item-link-25 guan" style=""><div class="text-wrapper-24">쌍용 1관</div></div><div class="item-link-25 guan" style=""><div class="text-wrapper-24">쌍용 1관</div></div><div class="item-link-25 guan" style=""><div class="text-wrapper-24">쌍용 1관</div></div></div>
                  
                </div>
            </div>
            
            
            
            
            
            
          </div>
          <div class="background-5">
            <div class="background-6"><div class="heading-3">2024-07-08(오늘)</div></div>
            <div class="container-5">
              <div class="list-4">
                <div class="overlap-4">
                  <div class="container-6">
					<div class="calendar">
						<div class="month">
							<span id="current-month"></span>
						</div>
						<div class="days" id="days">
						<div class="day"><span class="day-name">일</span><span class="date" style="color: red;">7</span></div><div class="day selected"><span class="day-name now">오늘</span><span class="date today" style="color: white;">8</span></div><div class="day"><span class="day-name">화</span><span class="date" style="color: black;">9</span></div><div class="day"><span class="day-name">수</span><span class="date" style="color: black;">10</span></div><div class="day"><span class="day-name">목</span><span class="date" style="color: black;">11</span></div><div class="day"><span class="day-name">금</span><span class="date" style="color: black;">12</span></div><div class="day"><span class="day-name">토</span><span class="date" style="color: blue;">13</span></div></div>
					</div>
                  </div>
                </div>
              </div>
              <div class="list-5">
                <div class="item-5">
                  <div class="button-2"></div>
                  <div class="div-4">
                    <div class="div-wrapper"><div class="text-wrapper-9">전</div></div>
                    <div class="div-4">
                      <div class="container-7">
                      	<div class="showTime"></div>
                        <div><button id="btn" onclick="sendTime()">좌석선택</button></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item-6"></div>
              </div>
              
			<form id="goReservation" action="Controller?type=reservation" method="post">
				<input type="hidden" id="movieName" name="movieName" value="">
				<input type="hidden" id="text" name="text" value="">
				<input type="hidden" id="time" name="time" value="">
				<input type="hidden" id="date" name="date" value="">
			</form>
            </div>

          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/jsp/footer/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	let date;
	let text, movieName, time;
	let checkClick = null;
	let checkGuan = null;
	let checkMovie = null;
	let checkTime = null;
	let checkDate = null;
	
	function selectText(){
		$.ajax({    
			url:'${pageContext.request.contextPath}/Controller?type=selectTime', 
			type:'post',     
			data:{
				text : text
				},    
			success: function(res) {  
				 console.log(res)
				$(".showMovie").html(res);
			
				//영화 가져오기
				$(".name").click(function(){
					movieName = $(this).text()
					console.log(movieName)
				 	check(this, '.movie', '#C0C0C0',2); // 영화 선택 시 배경색 변경
				})
				$(".date").click(function(){
			       let day = $(this).text(); // 예: "20"
			
			       // 현재 날짜 정보를 가져옵니다.
			       let today = new Date();
			       let year = today.getFullYear(); // 현재 연도를 가져옵니다.
			       let month = today.getMonth() + 1; // 현재 월을 가져옵니다. (월은 0부터 시작하므로 +1을 해줍니다.)
			       
			       // 선택한 일자를 기반으로 Date 객체 생성
			       let selectedDate = new Date(year, month - 1, day); // month는 0부터 시작하므로 -1을 해줍니다.
			
			       let selectedYear = selectedDate.getFullYear(); // 선택한 일자의 연도를 가져옵니다.
			       let selectedMonth = selectedDate.getMonth() + 1; // 선택한 일자의 월을 가져옵니다.
			       
			       date = selectedYear + "-" + ('0' + selectedMonth).slice(-2) + "-" + ('0' + day).slice(-2);
			       console.log(date);
				   selectTime();
				});
			},    error: function(err) {        
				
			}
		});
			
	}
	  
	  function selectTime(){
		console.log("하이")
		  $.ajax({    
				url:'${pageContext.request.contextPath}/Controller?type=selectTime', 
				type:'post',     
				data:{
					date : date,
					movieName : movieName,
				},
				success: function(res) {
					console.log(res)
					$(".showTime").html(res)
					//시간 선택
					$(".time").click(function(){
						time = $(this).text();
						console.log(time)
					})
					
					$(".time").click(function() {
						check(this, '.time-seat-button', '#C0C0C0',3); // 영화 선택 시 배경색 변경
					});
					$('.time-seat-button').hover(function() {
				        if (this !== checkTime) { // 선택된 요소가 아닐 때만 hover 효과 적용
				            $(this).css('background-color', '#C0C0C0');
				        }
				    }, function() {
				        if (this !== checkTime) { // 선택된 요소가 아닐 때만 hover 효과 제거
				            $(this).css('background-color', ''); 
				        }
				    });
				},    error: function(err) {        
					
				}
		  });
	  }
	  
	  
	  
	//선택확인
	function check(element, selector, color, type){
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
$(function() {
	
	getToday();
	calendar();
	
	$(".guan").click(function() {
	    check(this, '.guan', '#C0C0C0',1); // 영화 선택 시 배경색 변경
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
    
  });

	function getToday(){
		  let today = new Date();
	      let year = today.getFullYear(); // 현재 연도를 가져옵니다.
	      let month = today.getMonth() + 1; // 현재 월을 가져옵니다. (월은 0부터 시작하므로 +1을 해줍니다.)
	      let day = today.getDate(); // 현재 일을 가져옵니다.

	      // 월과 일을 두 자리 수로 만들기 위해 앞에 '0'을 추가합니다.
	      month = month < 10 ? '0' + month : month;
	      day = day < 10 ? '0' + day : day;

	      // 형식을 "YYYY-MM-DD"로 만듭니다.
	      let formattedDate = year + '-' + month + '-' + day + "(오늘)";

	      // #date-display 요소에 날짜를 표시합니다.
	      $('.heading-3').text(formattedDate);
	}


	
	//상영관 1 , 2, 3, 4
	$(".text-wrapper-24").click(function(){
		text = $(this).text()
		console.log(text)
		selectText();
	})
	//상영관 특별관
	$(".text-wrapper-25").click(function(){
		text = $(this).text()
		console.log(text)
		selectText();
	})

	
	//시간 선택
	$(".text-wrapper-27").click(function(){
		time = $(this).text();
		console.log(time)
	})
	
	function sendTime(){
		$("#text").val(text)
		$("#movieName").val(movieName)
		$("#time").val(time)
		$("#date").val(date)
		
		let checkText = $("#text").val()
		let checkMovieName = $("#movieName").val()
		let checkTime = $("#time").val()
		let checkDate = $("#date").val()
		
		if( checkText != "" && checkMovieName != "" && checkTime != "" && checkDate != "" ){
			$("#goReservation").submit()
		} else {
			alert("다 선택해 주세요")
		}
	}
	
    function calendar() {
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

        // 오늘의 날짜가 두 번째 위치에 나타나도록 위치 조정
        for (let i = 0; i < 7; i++) {
          let dayDate = new Date(today);
          if (i == 1) {
              dayDate.setDate(currentDate);
          } else if (i < 1) {
              dayDate.setDate(currentDate - 1);
          } else {
              dayDate.setDate(currentDate + i - 1);
          }

          let $dayElement = $('<div></div>').addClass('day');
          
          let $dateElement = $('<span></span>').addClass('date').text(dayDate.getDate());

          if (dayDate.getDate() === currentDate && dayDate.getMonth() === currentMonth) { // 오늘 날짜일 경우
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
        }
        
        $daysContainer.on('click', '.date', function() {
          check(this,'date', '#C0C0C0', 4); // 마우스 오버 시 배경색 변경
        });
      }

</script>
</body>
</html>
