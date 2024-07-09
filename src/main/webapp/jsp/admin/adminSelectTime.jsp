<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminSelectTimeStyle.css" />
    <div class="screen">
      <div class="div">
        <div class="frame">
          <div class="text-wrapper-20">시간 추가</div>
          <div class="text-wrapper-21">✕</div>
        </div>
		<div class="calendar">
			<div class="month">
				<span id="current-month">6월</span>
			</div>
			<div class="days" id="days">
			</div>
		</div>
        <div class="overlap">
          <div class="border-2">
            <div class="vertical-border">
              <div class="container"></div>
              <div class="label">극장</div>
            </div>
            <div class="overlap-2">
              <div class="data"></div>
              <div class="data"><div class="text-wrapper-10 time">14:00</div></div>
            </div>
            <div class="overlap-3">
              <div class="data"><div class="text-wrapper-10 time">15:00</div></div>
            </div>
            <div class="overlap-4">
              <div class="data"><div class="text-wrapper-10 time">16:00</div></div>
            </div>
            <div class="overlap-5">
              <div class="data"><div class="text-wrapper-10 time">17:00</div></div>
            </div>
            <div class="overlap-6">
              <div class="data"><div class="text-wrapper-10 time">18:00</div></div>
            </div>
            <div class="overlap-7">
              <div class="data"><div class="text-wrapper-10 time">19:00</div></div>
            </div>
            <div class="overlap-8">
              <div class="data"><div class="text-wrapper-10 time">20:00</div></div>
            </div>
            <div class="overlap-9">
              <div class="data-2"><div class="text-wrapper-10 time">21:00</div></div>
            </div>
            <div class="overlap-10">
              <div class="data-3"><div class="text-wrapper-10 time">22:00</div></div>
            </div>
            <div class="overlap-11">
              <div class="cell"><div class="text-wrapper-11 time">오후</div></div>
            </div>
            <div class="data-4"><div class="text-wrapper-13 time">13:00</div></div>
            <div class="data-5"><div class="text-wrapper-14 time">10:00</div></div>
            <div class="data-6"><div class="text-wrapper-15 time">11:00</div></div>
            <div class="data-7"><div class="text-wrapper-15 time">12:00</div></div>
            <div class="cell-2"><div class="text-wrapper-16">오전</div></div>
            <div class="data-8"><div class="text-wrapper-17 time">09:00</div></div>
            <div class="label-2">시간</div>
          </div>
          <div class="item-button guan">쌍용 1관</div>
          <div class="item-button-2 guan">쌍용 2관</div>
          <div class="item-button-3 guan">쌍용 3관</div>
          <div class="item-button-4 guan">쌍용 4관</div>
          <div class="item-button-5 guan">프리미엄 오경주관</div>
          <div class="vertical-divider"></div>
          <button class="button-12"><div class="text-wrapper-18">전체</div></button>
          <button class="button-13"><div class="text-wrapper-19">특별관</div></button>
        </div>
        <button class="button-14"><div class="text-wrapper-22" id="sb">등록</div></button>
      </div>
    </div>

<script>
    //오늘 기준으로 달력을 만들어주는 함수 일주일치만 만들어줌 양 옆에 화살표 누르면 저번 일주일 다음 일주일 나오게 만들어야함
    function makeCalendar() {
      //토요일은 파란색 공휴일은 빨간색으로 표시
        var today = new Date();
        var year = today.getFullYear();
        var month = today.getMonth();
        var date = today.getDate();
        var day = today.getDay();
        var days = document.getElementById("days");
        var dayArr = ["일", "월", "화", "수", "목", "금", "토"];
        var lastDate = new Date(year, month + 1, 0).getDate();
        var firstDay = new Date(year, month, 1).getDay();
        var lastDay = new Date(year, month, lastDate).getDay();
        var dayCount = 1;
        var dayCount2 = 1;

        for (var i = 0; i < 7; i++) {
            var dayDiv = document.createElement("div");
            dayDiv.className = "day";
            dayDiv.innerHTML = dayArr[i];
            days.appendChild(dayDiv);
        }

        for (var i = 0; i < 42; i++) {
            var dayDiv = document.createElement("div");
            dayDiv.className = "day";
            if (i < firstDay || i >= lastDate + firstDay) {
                dayDiv.innerHTML = "";
            } else {
                dayDiv.innerHTML = dayCount;
                dayCount++;
            }
            if (i % 7 == 0) {
                dayDiv.style.color = "red";
            } else if (i % 7 == 6) {
                dayDiv.style.color = "blue";
            }
            days.appendChild(dayDiv);
        }

        document.getElementById("current-month").innerHTML = month + 1 + "월";


    }

</script>
