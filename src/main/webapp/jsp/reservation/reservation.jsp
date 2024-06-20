<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String text = request.getParameter("text");
    	String movieName = request.getParameter("movieName");
    	String time = request.getParameter("time");
    %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/reservation/reservationGlobals.css" />
    <link rel="stylesheet" href="css/reservation/reservationStyle.css" />
  </head>
  <body>
    <div class="selectseat">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="overlap-group">
            <div class="list">
              <div class="item">
                <div class="div">
                  <div class="link">
                    <div class="strong">
                      <div class="text-wrapper">01</div>
                      <div class="text-wrapper-2">상영시간</div>
                      <div class="frame"></div>
                    </div>
                    <div class="frame-2"></div>
                  </div>
                  <div class="container"><div class="text-wrapper-3">현재 단계</div></div>
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
            <div class="price-frame">
              <div class="pay-button"><div class="pay-text">결제하기</div></div>
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
          <div class="s-CREEN">Screen</div>
          <div class="list-5">
            <div class="overlap-3">
              <div class="overlap-group-wrapper-2">
                <div class="overlap-group-5"><div class="text-wrapper-10" id="adult">0</div></div>
              </div>
              <div class="div-wrapper-3"><div class="text-wrapper-11 aPlus">+</div></div>
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
                <div class="overlap-group-5"><div class="text-wrapper-10" id="teen">0</div></div>
              </div>
              <div class="plus-teen-bt"><div class="text-wrapper-11 tPlus">+</div></div>
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
                <div class="overlap-group-5"><div class="text-wrapper-10" id="old">0</div></div>
              </div>
              <div class="div-wrapper-3"><div class="text-wrapper-11 oPlus">+</div></div>
            </div>
          </div>
          <div class="seat-background"><div class="select-seat-text">인원 / 좌석 선택</div></div>
        </div>
        <form action="Controller?type=payment" id="goPayment">
        	<input type="hidden" name="text" value=<%=text %>>
        	<input type="hidden" name="movieName" value=<%=movieName %>>
        	<input type="hidden" id="time" name=<%=time %>>
        	<input type="hidden" id="adultCount" name="adultCount">
        	<input type="hidden" id="teenCount" name="teenCount">
        	<input type="hidden" id="oldCount" name="oldCount">
        	<input type="hidden" id="checkSeat" name="checkSeat">
        </form>
      </div>
    </div>
    
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	
	let adult = parseInt($("#adult").text());
	let teen = parseInt($("#teen").text());
	let old = parseInt($("#old").text());
	let checkSeat = new Set();
	
	let num = 0;
	//좌석선택
	$(".rectangle").click(function(){
		
		let length = adult + teen + old;
		if(length > 0){
			let value = $(this).attr("value")
			if( checkSeat.has(value)){
				alert("이미 선택한 좌석입니다")
			} else {
				console.log(value)
				num++;
			}
		} else {
			alert("인원을먼저 선택해줭~~")
		}
		
		if( length == (num-1)){
			checkClick(num)
		}
	})
	
	$('.rectangle').hover(function() {
        // 마우스가 올라갔을 때
        $(this).css('background-color', '#2CC7E9');
        },
        function() {
            // 마우스가 벗어났을 때
            $(this).css('background-color', '#999999');
        }
	);
	
	//성인관객 수 +
	$(".aPlus").click(function(){
		adult = parseInt(adult) + 1;
		$("#adult").text(adult);
		updatePrice()
		
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
		teen = parseInt(teen) + 1;
		let res = $("#teen").text(teen);
		updatePrice()
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
		old = parseInt(old) + 1;
		$("#old").text(old);
		console.log("왜 안되냐고")
		updatePrice()
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
		let totalPrice = (adult * 13000) + (teen * 10000) + (old * 8000);
		$(".total-price-text").text(totalPrice)
	}
	
	let adultCount = "성인" + adult
	let teenCount = "청소년" + teen
	let oldCount = "경로" + old
	
	//결제하기로 넘기기
	$(".pay-button").click(function(){
		console.log(adultCount)
		
	})
	
	
	
	
	

</script>

  </body>
</html>
