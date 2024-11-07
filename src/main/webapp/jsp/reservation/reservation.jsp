<%@page import="web.mybatis.vo.MemberVO"%>
<%@page import="web.mybatis.vo.SelectSeatVO"%>
<%@page import="web.mybatis.vo.ScreeningScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Object mvo = request.getSession().getAttribute("mvo");
	boolean isLogin = (mvo != null);

	Object obj = request.getAttribute("svo");
	SelectSeatVO[] svo = null;
	if( obj != null){
		svo = (SelectSeatVO[])obj;
	}
%> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation/reservationGlobals.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation/reservationStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation/noReservationGlobals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation/noReservationStyle.css" />
</head>
<body>
<jsp:include page="/jsp/header/header.jsp"/>
<div class="selectseat">
    <div class="overlap-wrapper">
        <div class="overlap">
            <div class="overlap-group">
                <div class="seat-background">
                <div class="select-seat-text">인원 / 좌석 선택</div>
            </div><div class="frame"> 
							          <div class="list-5">
							              <div class="overlap-3">
							                  <div class="overlap-group-wrapper-2">
							                      <div class="overlap-group-5">
							                          <div class="text-wrapper-10" id="adult">0</div>
							                      </div>
							                  </div>
							                  <div class="div-wrapper-3">
							                      <div class="text-wrapper-11 aPlus">+</div>
							                  </div>
							              </div>
							              <div class="overlap-4">
							                  <div class="minus-adult-bt">
							                      <div class="div-2"></div>
							                      <div class="text-wrapper-12 aMinus">-</div>
							                  </div>
							                  <div class="text-wrapper-13">성인</div>
							              </div>
							              <div class="overlap-5">
							                  <div class="teen-count">
							                      <div class="overlap-group-5">
							                          <div class="text-wrapper-10" id="teen">0</div>
							                      </div>
							                  </div>
							                  <div class="plus-teen-bt">
							                      <div class="text-wrapper-11 tPlus">+</div>
							                  </div>
							                  <div class="minus-senior-bt">
							                      <div class="div-2"></div>
							                      <div class="text-wrapper-12 oMinus">-</div>
							                  </div>
							                  <div class="senior-text">경로</div>
							              </div>
							              <div class="overlap-6">
							                  <div class="minus-teen-bt">
							                      <div class="div-2"></div>
							                      <div class="text-wrapper-12 tMinus">-</div>
							                  </div>
							                  <div class="text-wrapper-13">청소년</div>
							              </div>
							              <div class="overlap-7">
							                  <div class="overlap-group-wrapper-2">
							                      <div class="overlap-group-5">
							                          <div class="text-wrapper-10" id="old">0</div>
							                      </div>
							                  </div>
							                  <div class="div-wrapper-3">
							                      <div class="text-wrapper-11 oPlus">+</div>
							                  </div>
							              </div>
							          </div>
                                    </div><div class="list">
                    <div class="item">
                        <div class="div">
                            <div class="link a" style="background-color: white;">
                                <div class="strong">
                                    <div class="text-wrapper text" style="color: rgb(102, 102, 102);">01</div>
                                    <div class="text-wrapper-2 text" style="color: rgb(102, 102, 102);">상영시간</div>
                                    
                                </div>
                            </div>
                            <div class="container">
                                <div class="text-wrapper-3">현재 단계</div>
                            </div>
                        </div>
                    </div>
                    <div class="link-wrapper">
                        <div class="div">
                            <div class="strong-2">
                                <div class="text-wrapper-4">02</div>
                                <div class="text-wrapper-5">인원/좌석</div>
                            </div>
                        </div>
                    </div>
                    <div class="div-wrapper">
                        <div class="div">
                            <div class="strong-2">
                                <div class="text-wrapper-6">03</div>
                                <div class="text-wrapper-7">결제</div>
                            </div>
                        </div>
                    </div>
                    <div class="item-2">
                        <div class="div">
                            <div class="strong-2">
                                <div class="text-wrapper-6">04</div>
                                <div class="text-wrapper-8">결제완료</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="frame-2"><div class="s-CREEN">Screen</div></div>
                <div class="price-frame">
                    <div class="pay-button">
                        <div class="pay-text">결제하기</div>
                    </div>
                    <div class="price-list">
                        <div class="overlap-group-2">
                            <div class="total-text">총 금액</div>
                            <div class="total-price-text">0</div>
                            <div class="won-text">원</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="seat-alpha-list">
                <div class="a">A</div>
                <div class="b">B</div>
                <div class="c">C</div>
                <div class="d">D</div>
            </div>
            <div class="seat-count-list">
                <div class="list-2">
                    <div class="component">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="B1">1</div>
                        </div>
                    </div>
                    <div class="overlap-group-wrapper">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="C1">1</div>
                        </div>
                    </div>
                    <div class="component-2">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="D1">1</div>
                        </div>
                    </div>
                    <div class="div-wrapper-2">
                        <div class="component-3">
                            <div class="overlap-group-4">
                                <div class="rectangle" value="A1">1</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-3">
                    <div class="component">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="B2">2</div>
                        </div>
                    </div>
                    <div class="overlap-group-wrapper">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="C2">2</div>
                        </div>
                    </div>
                    <div class="component-2">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="D2">2</div>
                        </div>
                    </div>
                    <div class="div-wrapper-2">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="A2">2</div>
                        </div>
                    </div>
                </div>
                <div class="overlap-2">
                    <div class="list-4"></div>
                    <div class="component-4">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="B3">3</div>
                        </div>
                    </div>
                    <div class="component-5">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="C3">3</div>
                        </div>
                    </div>
                    <div class="component-6">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="D3">3</div>
                        </div>
                    </div>
                    <div class="component-7">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="A3">3</div>
                        </div>
                    </div>
                    <div class="list-3"></div>
                    <div class="component-8">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="B4">4</div>
                        </div>
                    </div>
                    <div class="component-9">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="C4">4</div>
                        </div>
                    </div>
                    <div class="component-10">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="D4">4</div>
                        </div>
                    </div>
                    <div class="component-11">
                        <div class="overlap-group-3">
                            <div class="rectangle" value="A4">4</div>
                        </div>
                    </div>
                </div>
                <div class="component-12">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="B5">5</div>
                    </div>
                </div>
                <div class="component-13">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="B7">7</div>
                    </div>
                </div>
                <div class="component-14">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="B6">6</div>
                    </div>
                </div>
                <div class="component-15">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="B8">8</div>
                    </div>
                </div>
                <div class="component-16">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="A5">5</div>
                    </div>
                </div>
                <div class="component-17">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="A7">7</div>
                    </div>
                </div>
                <div class="component-18">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="A6">6</div>
                    </div>
                </div>
                <div class="component-19">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="A8">8</div>
                    </div>
                </div>
                <div class="component-20">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="C5">5</div>
                    </div>
                </div>
                <div class="component-21">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="C7">7</div>
                    </div>
                </div>
                <div class="component-22">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="C6">6</div>
                    </div>
                </div>
                <div class="component-23">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="C8">8</div>
                    </div>
                </div>
                <div class="component-24">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="C5">5</div>
                    </div>
                </div>
                <div class="component-25">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="C7">7</div>
                    </div>
                </div>
                <div class="component-26">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="D6">6</div>
                    </div>
                </div>
                <div class="component-27">
                    <div class="overlap-group-3">
                        <div class="rectangle" value="D8">8</div>
                    </div>
                </div>
            </div>
            
<jsp:include page="/jsp/footer/footer.jsp"/>
</div>
        <form id="goPayment" action="Controller?type=payment" method="post">
            <input type="hidden" id="movieName" name="movieName" value="탈주">
            <input type="hidden" id="text" name="text" value="쌍용 1관">
            <input type="hidden" id="time" name="time" value="14:00">
            <input type="hidden" id="totalCount" name="totalCount" value="">
            <input type="hidden" id="checkSeat" name="checkSeat" value="">
            <input type="hidden" id="date" name="date" value="2024-07-09">
            <input type="hidden" id="totalPrice" name="totalPrice" value="">
        </form>
        
        <div>
       
		  <div id="modal" class="modal" style="display: none;">
		    <div class="modal-content">
              	
    <div class="background">
      <div class="modal_overlap-group-wrapper">
          <div class="modal_container">
            <div class="modal_frame"><div class="modal_text-wrapper">비회원 로그인</div></div>
          </div>
          <div class="form">
            <button class="button"><div class="div" onclick="noReservation()">확인</div></button>
            <div class="form-2">
              <div class="row-2">
                <div class="cell"><div class="label-2">인증번호</div></div>
                <div class="data">
                  <button class="button-2" id="checkButton"><div class="text-wrapper-6">인증확인</div></button>
                  <div class="background-border">
                    <input type="text" id="emailCheck" name="emailCheck" class="input-3">
                    <div class="text-wrapper-7" id="timer">3:00</div>
                  </div>
                </div>
              </div>
              <div class="row-3">
                <div class="label-wrapper"><div class="label-3">이메일</div></div>
                <div class="data-2">
                  <input class="input-4" placeholder="이메일을 입력해주세요" type="email" id="email" name="email">
                  <button class="button-3" onclick="sendEmail()"><div class="text-wrapper-8">인증요청</div></button>
                </div>
              </div>
              <div class="row-4">
                <div class="label-wrapper"><div class="label-4">생년월일</div></div>
                <div class="data-2">
                  <input type="text" id="birth" name="birth" class="input-5" placeholder="생년월일 앞 6자리">
                </div>
              </div>
              <div class="row-5">
                <div class="label-wrapper"><div class="label-5">이름</div></div>
                <div class="data-2">
                  <input type="text" id="name" name="name" class="input-5" placeholder="이름을 입력해주세요">
                </div>
              </div>
              <div class="row-6">
                <div class="label-wrapper"><div class="label-4">비밀번호</div></div>
                <div class="data-2">
                  <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" class="input-5">
                </div>
              </div>
              <div class="row-7">
                <div class="data1"><div class="dd">비밀번호 확인</div></div>
                <div class="data22">
                  <input type="password" id="pw1" name="pw1" placeholder="비밀번호를 다시 입력해주세요" class="input-5"><br>
                  <span class="checkPw"></span>
                </div>
              </div>
              
			<form id="nonReserver" action="Controller?type=payment" method="post">
				<input type="hidden" id="movieName" name="movieName" value="탈주">
			 	<input type="hidden" id="nText" name="nText" value="쌍용 1관">
            	<input type="hidden" id="nTime" name="nTime" value="14:00">
            	<input type="hidden" id="nDate" name="nDate" value="2024-07-09">
				<input type="hidden" id="nTotalCount" name="nTotalCount" value="">
				<input type="hidden" id="nCheckSeat" name="nCheckSeat" value="">
				<input type="hidden" id="nTotalPrice" name="nTotalPrice" value="">
				<input type="hidden" id="non_name" name="non_name" value="">
				<input type="hidden" id="non_email" name="non_email" value="">
				<input type="hidden" id="non_pw" name="non_pw" value="">
			</form>
            </div>
          </div>
      </div>
    </div>
		    </div>
		  </div>
		
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
<script type="text/javascript">

timer = null;

function sendEmail() {
    var email = $('#email').val();

    //유효성 검사
    if (email == "") {
        alert("이메일을 입력해주세요.");
        return;
    }

    // jQuery AJAX를 사용하여 서버에 이메일을 보냅니다.
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/Controller?type=send_2",
        data: {email: email},
        success: function () {
            alert("이메일이 성공적으로 전송되었습니다.");
            time = 180;
            timer = setInterval(function () {
                var minutes = Math.floor(time / 60);
                var seconds = time % 60;
                $("#timer").text(minutes + ":" + (seconds < 10 ? "0" : "") + seconds);
                if (time <= 0) {
                    clearInterval(timer);
                    alert("3분이 지났습니다. 인증번호를 다시 요청해주세요.");
                    $(".input-3").prop("readonly", true);
                    $(".background-border").css("background-color", "#f2f2f2");
                    $(".input-3").val("");
                    $(".input-3").css("background-color", "#f2f2f2");
                    $(".text-wrapper-9").css("display", "none");
                }
                time--;
            }, 1000);

            setTimeout(function () {
                alert("3분이 지났습니다. 인증번호를 다시 요청해주세요.");
            }, 3 * 60 * 1000);
        }
    });
}

//인증번호 확인 버튼을 눌렀을때 인증번호 검증 함수
$("#checkButton").on("click", function () {
    //만약 인증번호 칸이 막혔을때 버튼을 누르면 이메일을 입력하라는 경고창
    if ($("#email").prop("readonly") === true) {
        alert("이메일을 입력해주세요.");
        $(".input-2").focus();
        return;
    } else {
        if ($("#emailCheck").val() === "") {
            alert("인증번호를 입력해주세요.");
            $("#emailCheck").focus();
            return;
        }
    }
    var code = $("#emailCheck").val();
    console.log(code);
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/Controller?type=check",
        data: {code_user: code},
        success: function (data) {
            var success = data.success;
            if (success === "1") {
                $("#checkButton").css("background-color", "#0e2128");
                $("#checkButton").css("color", "#ffffff");
                $("#checkButton").prop("disabled", false);
                alert("인증이 완료되었습니다.");
                $("#checkButton").prop("readonly", true);
                $("#checkButton").attr("placeholder", "인증이 완료되었습니다");
                $("#checkButton").css("background-color", "#f2f2f2");
                clearInterval(timer);
                sessionStorage.setItem("emailVerified", "true");
            } else if (success === "0") {
                alert("인증번호가 유효하지 않습니다");
                $(".input-3").val("");
                $(".input-3").focus();
            }
        }
    });
});

//비밀번호 확인
$('#pw1').keyup(function () {
    var pw = $('#pw').val();
    var pw_check = $('#pw1').val();
    if (pw == pw_check) {
        $('.checkPw').text('일치함').css('color', 'blue').show();
    } else {
        $('.checkPw').text('일치하지 않음').css('color', 'red').show();
    }
});

	let text = '<%= request.getParameter("text") %>';
	let movieName = '<%= request.getParameter("movieName") %>';
	let time = '<%= request.getParameter("time") %>';
	let date = '<%= request.getParameter("date") %>';
	let login = <%=isLogin %>;
	let modal = $("#modal");
	let totalCount;
	let totalPrice;
	
	function hoverEvent() {
	    $('.rectangle').not('[style*="background-color: black"]').hover(
	        function() {
	            // 마우스가 올라갔을 때
	            $(this).css('background-color', '#2CC7E9');
	        },
	        function() {
	            if (!checkSeat.has($(this).attr("value"))) {
	                $(this).css('background-color', '#999999');
	            }
	        }
	    );
	}
	
	function noReservation(){
		let name = $("#name").val()
		let email = $("#email").val()
		let pw = $("#pw").val()
		
		let adult = $("#adult").text();
		let teen = $("#teen").text();
		let old = $("#old").text();

		let adultCount = "성인:" + adult;
		let teenCount = "청소년:" + teen;
		let oldCount = "경로:" + old;

		totalCount = adultCount+"/" + teenCount+"/" + oldCount;
		console.log()
		$("#nTotalCount").val(totalCount);
		$("#nCheckSeat").val(seats);

		$("#non_name").val(name)
		$("#non_email").val(email)
		$("#non_pw").val(pw)
		
		$("#nonReserver").submit()
	}
	
	function paymentData(){
		let adult = $("#adult").text();
		let teen = $("#teen").text();
		let old = $("#old").text();

		let adultCount = "성인:" + adult;
		let teenCount = "청소년:" + teen;
		let oldCount = "경로:" + old;

		totalCount = adultCount+"/" + teenCount+"/" + oldCount;
		console.log()
		$("#totalCount").val(totalCount);
		$("#checkSeat").val(seats);
		$("#goPayment").submit();
	}

	
	//이미 예매된 좌석
	let noSeat;
    let selectedSeat = [];
    <% if (svo != null) {
        for (int i = 0; i < svo.length; i++) {
            SelectSeatVO ss = svo[i]; 
            String sr =  ss.getS_code();
            String trimSeat = sr.substring(1);
     %>
            selectedSeat.push("<%=trimSeat%>");
    <% }
    } %>
    console.log(selectedSeat)
    // 예매된 좌석에 대해 처리
    selectedSeat.forEach(function(seatCode) {
        let seatElement = $(".rectangle[value='" + seatCode + "']");
        seatElement.css("background-color", "black");
        seatElement.click(function(){
        	alert("이미 예매된 좌석입니다.")
        })
        
    });
    
	console.log(text)
	console.log(movieName)
	console.log(time)

	let adult = parseInt($("#adult").text());
	let teen = parseInt($("#teen").text());
	let old = parseInt($("#old").text());
	let checkSeat = new Set();
	let seatArray = [];
	let seats = "";
	let num = 0;
	let value;
	let length;
	
	//좌석선택
	 $('.rectangle').not('[style*="background-color: black"]').click(function(){
		length = adult + teen + old;
		if(length > 0){
			value = $(this).attr("value")
			if( checkSeat.has(value)){
				alert("이미 선택된 좌석 입니다.")
			} else {
				hoverEvent()
				checkSeat.add(value)
				clickSeat()
				console.log(value)
				num++;
				$(this).css('background-color', '#2CC7E9');
			}
		} else {
			alert("인원을먼저 선택해주세요")
		}

		if( length == (num-1)){
			checkClick(num)
		}
	})
	
	//성인관객 수 +
	$(".aPlus").click(function(){
		if( adult <= 8){
		adult = parseInt(adult) + 1;
		$("#adult").text(adult);
		updatePrice()
		} else{
			alert("최대 8명까지 가능합니다");
		}

	})

	//성인관객 수 -
	$(".aMinus").click(function(){
		adult = adult - 1;
	    if(adult < 0){
	        alert("0보다 작을 수 없습니다.");
	    } else {
	        $("#adult").text(adult);
	        updatePrice()
	    }
	});

	//청소년관객 수 +
	$(".tPlus").click(function(){
		if( teen <= 8){
			teen = parseInt(teen) + 1;
			let res = $("#teen").text(teen);
			updatePrice()
		} else{
			alert("최대 8명까지 가능합니다")
		}
	})

	//청소년관객 수 -
	$(".tMinus").click(function(){
		teen = teen - 1;
	    if(teen < 0){
	        alert("0보다 작을 수 없습니다.");
	    } else {
	        $("#teen").text(teen);
	        updatePrice()
	    }
	});

	//경로관객 수 +
	$(".oPlus").click(function(){
		if( old <= 8){
			old = parseInt(old) + 1;
			$("#old").text(old);
			updatePrice()
		} else {
			alert("최대 8명까지 가능합니다")
		}
	})

	//경로관객 수 -
	$(".oMinus").click(function(){
	    old = old - 1;
	    if(old < 0){
	        alert("0보다 작을 수 없습니다.");
	    } else {
	        $("#old").text(old);
	        updatePrice()
	    }
	});

	function checkClick(num){
		$(".text-wrapper-9").off("click");

		if( num != null){

			alert("최대"+(num-1) +"까지 선택할 수 있습니당")
			location.reload()
	   }

	}

	function updatePrice(){
		totalPrice = (adult * 13000) + (teen * 10000) + (old * 8000);
		$(".total-price-text").text(totalPrice)
		$("#totalPrice").val(totalPrice); // hidden input 필드 값 업데이트
		$("#nTotalPrice").val(totalPrice);
		console.log(totalPrice)
	}

    // 선택된 좌석 업데이트 함수
    function clickSeat() {
        seatArray = Array.from(checkSeat); // Set을 배열로 변환
        seats = seatArray.join(","); // 좌석 배열을 쉼표로 구분된 문자열로 변환
        console.log("Selected seats: " + seats); // 선택된 좌석 확인용 로그
    }


	//결제하기로 넘기기
	$(".pay-button").click(function(){
		 if (checkSeat.size === 0) { // 아무 좌석도 선택되지 않은 경우
	            alert("좌석을 먼저 선택해주세요.");
	            return; // 함수 실행 종료
	        }

	        if (length !== checkSeat.size) { // 선택한 인원수와 좌석수 불일치
	            alert("선택하신 인원수와 좌석수가 일치하지 않습니다.");
	            return; // 함수 실행 종료
	        }
		let result = confirm("선택하신 상영관은 "+text+" 영화제목은 "+ movieName +"날짜"+date +" 예매 시간 "+time +" 선택좌석은 "+seats+" 입니다 예매하시겠습니까?")
		if( result ){
			if(login){
				paymentData()
			} else{
				modal.css("display", "block")
			}
		} else {
			
		}
	});

	$(".a").click(function(){

		window.location.href = "Controller?type=selectTime";
	})

$('.a').hover(
    function() {
        // 마우스가 올라갔을 때
        $(this).css('background-color', '#3D4D55');
        $(".text").css('color', 'white');
    },
    function() {
        // 마우스가 내려갔을 때
        $(this).css('background-color', 'white');
        $(".text").css('color', '#666666'); // 원래 색상으로 되돌리기
    }
);
$(function(){
	  
	  // 페이지 로드 시 모달 표시
	  modal.css("display", "none")
	  
	  // 닫기 버튼 클릭 시 모달 숨기기
	  $(".div").click(function() {
	    modal.hide();
	  });
	  
	  // 모달 외부 클릭 시 모달 숨기기
	  $(window).click(function(event) {
	    if ($(event.target).is(modal)) {
	      modal.hide();
	    }
	  });
});
</script>

</body>
</html>
