<%@page import="web.mybatis.vo.AudienceVO"%>
<%@page import="web.mybatis.vo.TheaterSeatVO"%>
<%@page import="web.mybatis.vo.ScreeningScheduleVO"%>
<%@page import="web.mybatis.vo.TheaterVO"%>
<%@page import="web.mybatis.vo.MovieListVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="web.mybatis.vo.IssuedCouponVO"%>
<%@page import="web.mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html>
<%
	boolean login = false;
	Object obj = request.getSession().getAttribute("mvo");
	MemberVO mvo = null;
	if (obj != null) {
	    mvo = (MemberVO) obj;
	    login = true;
	}
	
	String totalPrice = request.getParameter("totalPrice");
	String nTotalPrice = request.getParameter("nTotalPrice");
	System.out.println("나와줘" + nTotalPrice);
	System.out.println("나와줘" + totalPrice);
	int originalPrice = 0;
	int saleAmount = 0;
	int finalPrice = 0;
	
	if( totalPrice != null){
		originalPrice = Integer.parseInt(totalPrice);
	  	finalPrice = originalPrice;
	}
	
	if( nTotalPrice != null){
		originalPrice = Integer.parseInt(nTotalPrice);
		finalPrice = originalPrice;
	}

  String checkSeat = request.getParameter("checkSeat");
  String nCheckSeat = request.getParameter("nCheckSeat");
  String seat[];
  int seatLength = 0;
  if( checkSeat != null){
	   seat = checkSeat.split(",");
	  seatLength = seat.length;
	  
  }
  if( nCheckSeat != null){
		seat = nCheckSeat.split(",");
	  seatLength = seat.length;
	  
  }
%>
<head>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment/globals.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment/style.css" />
</head>
<body>
<div class="payment">
  <div class="overlap-wrapper">
    <div class="overlap">
      <!-- 메뉴 시작 -->
      <div class="menu">
        <div class="menu-list">
          <div class="watchbt">
            <div class="div">
              <div class="link">
                <div class="strong">
                  <div class="text-wrapper">01</div>
                  <div class="text-wrapper-2">상영시간</div>
                </div>
              </div>
              <div class="container"><div class="text-wrapper-3">현재 단계</div></div>
            </div>
          </div>
          <div class="seatbt">
            <div class="div">
              <div class="strong-2">
                <div class="text-wrapper-4">02</div>
                <div class="text-wrapper-5">인원/좌석</div>
              </div>
            </div>
          </div>
          <div class="paybt">
            <div class="div">
              <div class="strong-2">
                <div class="text-wrapper-6">03</div>
                <div class="text-wrapper-7">결제</div>
              </div>
            </div>
          </div>
          <div class="paycompbt">
            <div class="div">
              <div class="strong-2">
                <div class="text-wrapper-8">04</div>
                <div class="text-wrapper-9">결제완료</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 여기까지 메뉴  -->
      <div class="total-container">
        <div class="infor-back"><div class="infor-text">예매정보</div></div>
        <div class="pay-meth-back"><div class="pay-meth-text">결제수단</div></div>
        <div class="pay-background"><div class="pay-back-text">결제하기</div></div>
      </div>
      <div class="infor-frame">
        <div class="seat-frame">
          <div class="seat-text">좌석</div>
          <div class="seat-num">
          	<c:if test="${param.checkSeat != null}">
	          	${param.checkSeat.replace(",", ", ") }
          	</c:if>
          	<c:if test="${param.nCheckSeat != null}">
	          	${param.nCheckSeat.replace(",", ", ") }
          	</c:if>
          </div>
        </div>
        <div class="movie-image"></div>
        <c:if test="${requestScope.movieVO.watchGradeNm == '전체관람가' }">
          <img class="age-image" src="img/payment/age_all_img.png" />
        </c:if>
        <c:if test="${param.movieVO.watchGradeNm == '12세이상관람가' }">
          <img class="age-image" src="img/payment/age_12_img.png" />
        </c:if>
        <c:if test="${param.movieVO.watchGradeNm == '15세이상관람가' }">
          <img class="age-image" src="img/payment/age_15_img.png" />
        </c:if>
        <c:if test="${param.movieVO.watchGradeNm == '청소년관람불가' }">
          <img class="age-image" src="img/payment/age_18_img.png" />
        </c:if>
        <div class="movie-name">${ movieVO.getMovieNm()}</div>
        <div class="date-text">일시</div>
        <div class="theater-text">영화관</div>
        <div class="peo-num-text">인원</div>

        <p class="watch-date">
        	<c:if test="${param.date != null && param.time != null}">
	        	${param.date } ${param.time }
        	</c:if>
        	<c:if test="${param.nDate != null && param.nTime != null}">
	        	${param.nDate } ${param.nTime }
        	</c:if>
        </p>
        <div class="theater-num">
        	<c:if test="${param.text != null}">
	        	${param.text}
        	</c:if>
        	<c:if test="${param.nText != null}">
	        	${param.nText}
        	</c:if>
        </div>
        <div class="people-num">
	        <c:if test="${param.totalCount != null }">
		        ${param.totalCount.replace(":", " ").replace("/", " / ") }
	        </c:if>
			<c:if test="${param.nTotalCount != null }">
				${param.nTotalCount.replace(":", " ").replace("/", " / ") }
			</c:if>
        </div>

      </div>
      <div class="pay-meth-frame">
        <div class="point-pay-method">

          <div class="ticket-pay">
            <div class="coupon-pay">
              <div class="text-wrapper-10">쿠폰</div>
            </div>
          </div>
          <div class="text-wrapper-11">쿠폰</div>
          <div class="overlap-group">
            <div class="frame" id="coupon-frame">
              <div class="frame-2">
                <div class="text-wrapper-23">쿠폰</div>
                <div class="div-wrapper"><div class="text-wrapper-14">✕</div></div>
              </div>
              <div class="overlap-2">
                <div class="text-wrapper-20">사용 가능한 쿠폰</div>
                <div class="text-wrapper-21">(<span> ${fn:length(cvo)}</span>)</div>
              </div>

              <div class="frame-8">
                <div class="text-wrapper-24">
                  <c:if test="${fn:length(cvo)<1 }">
                    사용 가능한 쿠폰이 없습니다.
                  </c:if>
                  <c:if test="${fn:length(cvo)!=null and fn:length(cvo) > 0 }">
                    <c:forEach var="item" items="${requestScope.cvo}" varStatus="vs">
                      <div class="coupon" id="${vs.index}">
                          ${item.c_item.ci_content}
                        <input type="hidden" id="form${vs.index}" value="${item.c_item.ci_discount}">
                        <input type="hidden" id="couponform${vs.index}" value="${item.cp_no}">
                      </div>
                    </c:forEach>
                    <div class="coupon" id="${vs.index}">선택 안 함</div>
                  </c:if>
                </div>
              </div>
              <!--
                                <div class="frame-5"><div class="text-wrapper-17">취소</div></div>
                                <div class="frame-6"><div class="text-wrapper-18">등록</div></div> -->
            </div>
          </div>
        </div>
        <div class="final-pay-method">
          <div class="card-pay-bt button" id="kakaopay-bt">
            <div class="overlap-group-2">
              <div class="text-wrapper-26">카카오페이</div>
              <img class="element" src="img/payment/easy_payment_img.png" />
            </div>
          </div>
          <div class="div-2 button" id="card-bt">
            <div class="text-wrapper-27">카드 결제</div>
            <img class="img" src="img/payment/easy_payment_img.png" />
          </div>
          <div class="text-wrapper-28">최종 결제수단</div>
        </div>
      </div>
      <div class="ori-pay">
        <div class="text-wrapper-29">상품금액</div>
        <div class="overlap-3">
          <div class="ori-price"><%=originalPrice%></div>
          <div class="ori-won">원</div>
        </div>
      </div>
      <div class="discount">
        <div class="text-wrapper-29">할인금액</div>
        <div class="overlap-4">
          <div class="minus">-</div>
          <div class="dis-price"><%=saleAmount%></div>
          <div class="dis-won">원</div>
        </div>
      </div>
      <div class="total-pay">
        <div class="text-wrapper-29">결제금액</div>
        <div class="overlap-5">
          <div class="total-won">원</div>
          <div class="total">총</div>
          <div class="total-price"><%=finalPrice %></div>
        </div>
      </div>
      <div class="pay-button"><div class="pay-text">결제하기</div></div>
    </div>
  </div>
</div>

<form action="" method="post">
  <!-- 원래 가격 -->
  <input type="hidden" id="OriginalPrice" name="hiddenOriginalPrice" value="<%= originalPrice%>" >
  <!-- 할인 금액 -->
  <input type="hidden" id="Discount" name="hiddenDiscount" value="<%=saleAmount%>">
  <!-- 쿠폰 코드 -->
  <input type="hidden" id="coupon_id" name="hiddenDiscount" value="">
  <!-- 최종 금액 -->
  <input type="hidden" id="FinalPrice" name="hiddenFinalPrice" value="<%=finalPrice%>">
</form>

</body>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script>
  let selectedPay;
  let login = <%= login %>;
  $(function(){
    let originalPrice = <%= originalPrice %>;
    let saleAmount = <%= saleAmount %>;
    let finalPrice = <%= finalPrice %>;
    
    $('#OriginalPrice').val(originalPrice);
    $('#Discount').val(saleAmount);
    $('#FinalPrice').val(finalPrice);

    // ---------------------- 결제 API ----------------------
    $('.pay-button').click(function(){
      console.log(selectedPay);
      if(selectedPay == null){
        alert("결제 방법을 선택해주세요.");
      }
      else{
        var IMP = window.IMP;
        IMP.init('imp40288328');

        IMP.request_pay({
          pg : selectedPay,
          pay_method : 'card', //카드결제
          merchant_uid : 'merchant_' + new Date().getTime(),
          name : '${movieVO.movieNm}',
          amount : finalPrice,
          buyer_email : '${mvo.u_email}',
          buyer_name : '${mvo.u_name}',
          buyer_tel : '${mvo.u_phone}',
          buyer_addr : '${mvo.u_address}',
          buyer_postcode : '${mvo.u_postcode}'
        },  function(rsp) {
          if ( rsp.success ) {
            // 결제 성공 시 로직,
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;

            alert('결제 성공');

            pay_info(rsp);

          } else {
            // 결제 실패 시 로직,
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            console.log(rsp);
            console.log(msg);
            //location.href="goods_pay_fail.do?error_msg="+rsp.error_msg;
            alert('결제 실패');
          }
        });
      }


    });
  });

  //-------------------- 결제 완료 시 PayCompleteAction으로 데이터 보내기---------------------

  var form = document.createElement('form');
  var objs;

  function input_info(name, value){
    objs = document.createElement('input');
    objs.setAttribute('type', 'hidden');
    objs.setAttribute('name', name);
    objs.setAttribute('value', value);
    form.appendChild(objs);
  }

  function pay_info(rsp){
    //예매자 저장 내용
    if(!login){ //비회원일 때
    	console.log("비회원")
      input_info('non_name', '${rvo.non_name}');
      input_info('non_email',  '${rvo.non_email}');
      input_info('non_pw', '${rvo.non_pw}');
      //결제 내역 저장 내용
      var coupon_no = $('#coupon_id').val()
      input_info('cp_no', coupon_no); //쿠폰 발급 번호
      input_info('p_method', rsp.pay_method);
      input_info('p_content', '${nDbContent}'); //DB 저장 내용
      input_info('p_ex_price', '${param.nTotalPrice}'); //할인 전 금액
      input_info('p_tt_price', rsp.paid_amount);
      input_info('merchant_uid', rsp.merchant_uid);

      //예매 내역 저장 내용
      input_info('ss_code', '${ssVO1.ss_code}'); //상영시간표 코드
      input_info('rs_count', '<%=seatLength%>'); //선택 좌석 개수

      //선택 좌석
      input_info('s_code', '${nCheckSeat}'); //좌석코드 문자열로
      input_info('a_code', '${nTotalCount}'); //관객 내용 문자열로
      input_info('t_name', '${thea.t_name}'); //상영관 코드

      input_info('checkSeat', '${param.nCheckSeat}'); //관객 내용 문자열로
      input_info('totalCount', '${param.nTotalCount}'); //관객 내용 문자열로

      input_info('date', '${param.nDate }');
      input_info('time', ' ${param.nTime }');

      var saleprice = $('#Discount').val()
      input_info('saleprice', saleprice);

      form.setAttribute('method', 'post');
      form.setAttribute('action', 'Controller?type=paycomplete');
      document.body.appendChild(form);
      form.submit();
      
    } else {
    	console.log("회원")
    	 //결제 내역 저장 내용
        var coupon_no = $('#coupon_id').val()
        input_info('cp_no', coupon_no); //쿠폰 발급 번호
        input_info('p_method', rsp.pay_method);
        input_info('np_content', "안녕"); //DB 저장 내용
        input_info('np_ex_price', 1); //할인 전 금액
        input_info('p_tt_price', rsp.paid_amount);
        input_info('merchant_uid', rsp.merchant_uid);

        //예매 내역 저장 내용
        input_info('ss_code', '${ssVO.ss_code}'); //상영시간표 코드
        input_info('rs_count', '<%=seatLength%>'); //선택 좌석 개수

        //선택 좌석
        input_info('s_code', '${checkSeat}'); //좌석코드 문자열로
        input_info('a_code', '${totalCount}'); //관객 내용 문자열로
        input_info('t_name', '${theaterVO.t_name}'); //상영관 코드

        input_info('checkSeat', '${param.checkSeat}'); //관객 내용 문자열로
        input_info('totalCount', '${param.totalCount}'); //관객 내용 문자열로

        input_info('date', '${param.date }');
        input_info('time', ' ${param.time }');

        var saleprice = $('#Discount').val()
        input_info('saleprice', saleprice);

        form.setAttribute('method', 'post');
        form.setAttribute('action', 'Controller?type=paycomplete');
        document.body.appendChild(form);
        form.submit();
    }
  }

  //----------------- 쿠폰 선택 시 금액 바꾸고 쿠폰 no 저장 -----------------
  $('.coupon').on('click', function() {
    let clickedElement = $(this);
    let couponIndex = clickedElement.attr('id');
    let discountPercent = parseFloat($('#form' + couponIndex).val());
    let cp_no = $('#couponform' + couponIndex).val();
    console.log(cp_no);

    console.log(discountPercent);

    // 할인된 가격 계산
    let discountedPrice = originalPrice * (1 - (discountPercent / 100));
    finalPrice = discountedPrice;

    //finalPrice = discountedPrice.toFixed(2); // 소수점 두 자리까지 표시
    // 표시되는 가격 업데이트
    $('.dis-price').text(originalPrice - finalPrice);
    $('.total-price').text(finalPrice);

    // 서버 측 처리를 위한 숨겨진 폼 필드 업데이트 (선택 사항)

    $('#Discount').val(originalPrice - finalPrice);
    $('#FinalPrice').val(finalPrice);
    $('#coupon_id').val(cp_no);

    // 선택된 쿠폰에 대한 시각적 피드백 적용 (선택 사항)
    $('.coupon').removeClass('selected');
    clickedElement.addClass('selected');

    $('#coupon-frame').hide();
  });

  // 쿠폰 선택 취소
  $('.text-wrapper-17').click(function() {
    $('.coupon').removeClass('selected');
  });

  //-------[hover]-------------------------------------------------------------------------------------------

  let checkPay = null;
  let checkCoupon = null;

  $('.coupon-pay').hover(function() {
            // 마우스가 올라갔을 때
            $(this).css('background-color', '#C0C0C0');
          },
          function() {
            // 마우스가 벗어났을 때
            $(this).css('background-color', '#FFFFFF');
          }
  );

  $('.coupon').hover(function() {
            // 마우스가 올라갔을 때
            $(this).css('background-color', '#C0C0C0');
          },
          function() {
            // 마우스가 벗어났을 때
            $(this).css('background-color', '#FFFFFF');
          }
  );
  //쿠폰, 포인트 적용창 닫기 버튼
  $('.text-wrapper-14').click(function(){
    $('#coupon-frame').hide();
  });

  //맨 처음 닫힌 상태
  $('#coupon-frame').hide();

  //'쿠폰' 버튼 눌렀을 때 쿠폰 적용 창 열림 //호버 있으면 좋겠다
  $('.coupon-pay').click(function(){
    $('#coupon-frame').show();
  });

  var selectedButton = null;

  /* $('#kakaopay-bt, #naverpay-bt').click(function(){
      if (selectedButton !== null) {
          selectedButton.removeClass('selected');
      }
      $(this).addClass('selected');
      selectedButton = $(this);
  });

  $('#naverpay-bt').click(function() {
          // 마우스가 올라갔을 때
          $(this).css('background-color', '#C0C0C0');
  }); */


  /*============= 간편 결제 호버 ======= */
  $('#kakaopay-bt').hover(function() {
    if (!$(this).hasClass('c')) { //선택되지 않았다면
      $(this).css('background-color', '#C0C0C0');
    }
  }, function() {
    if (!$(this).hasClass('c')) {
      $(this).css('background-color', '#ffffff');
    }
  }).click(function() {
    if ($(this).hasClass('c')) {
      $(this).removeClass('c').css('background-color', '#ffffff');
      selectedPay = '';
    } else {
      $(this).addClass('c').css('background-color', '#C0C0C0');
      $('#card-bt').removeClass('c').css('background-color', '#ffffff');
      selectedPay = 'kakaopay';
    }
  });

  $('#card-bt').hover(function() {
    if (!$(this).hasClass('c')) {
      $(this).css('background-color', '#C0C0C0');
    }
  }, function() {
    if (!$(this).hasClass('c')) {
      $(this).css('background-color', '#ffffff');
    }
  }).click(function() {
    if ($(this).hasClass('c')) {
      $(this).removeClass('c').css('background-color', '#ffffff');
      selectedPay = '';
    } else {
      $(this).addClass('c').css('background-color', '#C0C0C0');
      $('#kakaopay-bt').removeClass('c').css('background-color', '#ffffff');
      selectedPay = 'kcp';
    }
  });

</script>

</html>
