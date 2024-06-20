<%@page import="web.mybatis.vo.IssuedCouponVO"%>
<%@page import="web.mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<%
		MemberVO mvo = (MemberVO)request.getAttribute("mvo");
		IssuedCouponVO[] cvo = (IssuedCouponVO[])request.getAttribute("cvo");
		int point = (int)request.getAttribute("point");
		int cvoLength = cvo.length;
		request.setAttribute("cvoLength", cvoLength);
		
		int originalPrice = 35000;
		int saleAmount = 0;
		int finalPrice = 35000;
		
	%>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/payment/globals.css" />
    <link rel="stylesheet" href="css/payment/style.css" />
  </head>
  <body>
    <div class="payment">
      <div class="overlap-wrapper">
        <div class="overlap">
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
          <div class="total-container">
            <div class="infor-back"><div class="infor-text">예매정보</div></div>
            <div class="pay-meth-back"><div class="pay-meth-text">결제수단</div></div>
            <div class="pay-background"><div class="pay-back-text">결제하기</div></div>
          </div>
          <div class="infor-frame">
            <div class="seat-frame">
              <div class="seat-text">좌석</div>
              <div class="seat-num">A1</div>
            </div>
            <div class="movie-image"></div>
            <img class="age-image" src="img/payment/age_15_img.png" />
            <div class="movie-name">드라이브</div>
            <div class="date-text">일시</div>
            <div class="theater-text">영화관</div>
            <div class="peo-num-text">인원</div>
            <p class="watch-date">2024-06-15 (토) 20:05 ~ 21:51</p>
            <div class="theater-num">쌍용 2관</div>
            <div class="people-num">성인1</div>
          </div>
          <div class="pay-meth-frame">
            <div class="point-pay-method">
              <div class="div-2"><div class="text-wrapper-10">포인트</div></div>
              <div class="ticket-pay">
                <div class="coupon-pay">
                  <div class="coupon-num"><div class="coupon-count">1</div></div>
                  <div class="text-wrapper-10">쿠폰</div>
                </div>
              </div>
              <div class="text-wrapper-11">쿠폰/포인트</div>
              <div class="overlap-group">
                <div class="frame" id="point-frame">
                  <div class="text-wrapper-12">사용 가능한 포인트</div>
                  <div class="frame-2">
                  	<div class="point-num"><div class="point-count">2</div></div>
                    <div class="text-wrapper-13">포인트</div>
                    <div class="div-wrapper"><div class="text-wrapper-14">✕</div></div>
                  </div>
                  <div class="frame-3"><div class="text-wrapper-15">${requestScope.point}</div></div>
                  <input type="text" class="frame-4"/>
                  <div class="frame-5"><div class="text-wrapper-17">취소</div></div>
                  <div class="frame-6"><div class="text-wrapper-18">적용</div></div>
                  <div class="frame-7"><div class="text-wrapper-19">최대 적용</div></div>
                </div>
                <div class="frame" id="coupon-frame">
                <div class="frame-2">
                    <div class="text-wrapper-23">쿠폰</div>
                    <div class="div-wrapper"><div class="text-wrapper-14">✕</div></div>
                  </div>
                  <div class="overlap-2">
                    <div class="text-wrapper-20">사용 가능한 쿠폰</div>
                    <div class="text-wrapper-21">(<span> <%=cvoLength %> </span>)</div>
                  </div>
                  
                  
                  <div class="frame-8">
						<div class="text-wrapper-24">
							<c:if test="${cvoLength<1 }">
								사용 가능한 쿠폰이 없습니다.
							</c:if>
							<c:if test="${cvoLength!=null and cvoLength > 0 }">
							    <c:forEach var="item" items="${requestScope.cvo}" varStatus="vs">
							        <div class="coupon" id="${vs.index}">
							            ${item.c_item.ci_content}
							            <input type="hidden" id="form${vs.index}" value="${item.c_item.ci_discount}">
							        </div>
							    </c:forEach>
							</c:if>
					    </div>
				  </div>

                  <div class="frame-5"><div class="text-wrapper-17">취소</div></div>
                  <div class="frame-6"><div class="text-wrapper-18">등록</div></div>
                </div>
              </div>
            </div>
            <div class="final-pay-method">
              <div class="card-pay-bt">
                <div class="overlap-group-2">
                  <div class="text-wrapper-26">카드결제</div>
                  <img class="element" src="img/payment/card_payment_img.png" />
                </div>
              </div>
              <div class="div-2">
                <div class="text-wrapper-27">간편결제</div>
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
        <!-- 최종 금액 -->
        <input type="hidden" id="FinalPrice" name="hiddenFinalPrice" value="<%=finalPrice%>">
    </form>
    
  </body>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
  <script>
  	
  	$(function(){
		let originalPrice = <%= originalPrice %>;
		let saleAmount = <%= saleAmount %>;
		let finalPrice = <%= finalPrice %>;
		
		$('#OriginalPrice').val(originalPrice);
  		$('#Discount').val(saleAmount);
  		$('#FinalPrice').val(finalPrice);
		
		$('.coupon').on('click', function() {
		    let clickedElement = $(this);
		    let couponIndex = clickedElement.attr('id');
		    let discountPercent = parseFloat($('#form' + couponIndex).val());
		
		    console.log(discountPercent);
		    
		    // 할인된 가격 계산
		    let discountedPrice = originalPrice * (1 - (discountPercent / 100));
		    finalPrice = discountedPrice;
		    console.log(finalPrice);
		    
		    //finalPrice = discountedPrice.toFixed(2); // 소수점 두 자리까지 표시
		
		    // 표시되는 가격 업데이트
		    $('.dis-price').text(originalPrice - finalPrice);
		    $('.total-price').text(finalPrice);
		
		    // 서버 측 처리를 위한 숨겨진 폼 필드 업데이트 (선택 사항)
		    
		    $('#Discount').val(originalPrice - finalPrice);
		    $('#FinalPrice').val(finalPrice);
		
		    // 선택된 쿠폰에 대한 시각적 피드백 적용 (선택 사항)
		    $('.coupon').removeClass('selected');
		    clickedElement.addClass('selected');
		  
		    $('#coupon-frame').hide();
		});
		
		// 쿠폰 선택 취소
	    $('.text-wrapper-17').click(function() {
	        $('.coupon').removeClass('selected');
	    });
	  		
	  		
  		//'포인트' 버튼 눌렀을 때 포인트 적용 창 열림 //호버 있으면 좋겠다
  		$('.div-2').click(function(){
  			$('#coupon-frame').hide();
  			$('#point-frame').show();
  		});
  		
  		//결제 버튼
  		$('.pay-button').click(function(){
  			var IMP = window.IMP;
  			IMP.init('imp40288328');
  			IMP.request_pay({
  			    pg : 'kakaopay',
  			    pay_method : 'card', //카드결제
  			    merchant_uid : 'merchant_' + new Date().getTime(),
  			    name : '주문명:결제테스트',
  			    amount : 100, //판매가격
  			    buyer_email : '구매자 아이디',
  			    buyer_name : '구매자 이름',
  			    buyer_tel : '연락처',
  			    buyer_addr : '주소',
  			    buyer_postcode : '우편번호'
  			},  function(rsp) {
  			    if ( rsp.success ) {
  			    	 // 결제 성공 시 로직,
  			        var msg = '결제가 완료되었습니다.';
  			        msg += '고유ID : ' + rsp.imp_uid;
  			        msg += '상점 거래ID : ' + rsp.merchant_uid;
  			        msg += '결제 금액 : ' + rsp.paid_amount;
  			        msg += '카드 승인번호 : ' + rsp.apply_num;
  			        
  			        console.log(rsp);
  			        console.log(msg);
  			        //pay_info(rsp);
  			        
  			  
  	              	alert('결제 성공');
  			        
  			        
  			    } else {
  			    	 // 결제 실패 시 로직,
  			        var msg = '결제에 실패하였습니다.';
  			        msg += '에러내용 : ' + rsp.error_msg;
  			      	console.log(rsp);
			        console.log(msg);
  			        //location.href="goods_pay_fail.do?error_msg="+rsp.error_msg;
			        alert('결제 실패');
		            console.log(rsp);
  			    }
  			} );
  		});
  		
  		/* 
  		function pay_info(rsp){
  	      var form = document.createElement('form');
  	      var objs;
  	 
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buyer_name');
  	      objs.setAttribute('value', rsp.buyer_name);
  	      form.appendChild(objs);
  	 
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buyer_phone');
  	      objs.setAttribute('value', rsp.buyer_tel);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'member_email');
  	      objs.setAttribute('value', rsp.buyer_email);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buy_addr');
  	      objs.setAttribute('value', rsp.buyer_addr);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buy_product_name');
  	      objs.setAttribute('value', rsp.name);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buyer_buyid');
  	      objs.setAttribute('value', rsp.imp_uid);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buyer_merid');
  	      objs.setAttribute('value', rsp.merchant_uid);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'amount');
  	      objs.setAttribute('value', rsp.paid_amount);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buyer_card_num');
  	      objs.setAttribute('value', rsp.apply_num);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buyer_pay_ok');
  	      objs.setAttribute('value', rsp.success);
  	      form.appendChild(objs);
  	      
  	      objs = document.createElement('input');
  	      objs.setAttribute('type', 'hidden');
  	      objs.setAttribute('name', 'buyer_postcode');
  	      objs.setAttribute('value', rsp.buyer_postcode);
  	      form.appendChild(objs);
  	 
  	      form.setAttribute('method', 'post');
  	      form.setAttribute('action', "goods_pay_success.do");
  	      document.body.appendChild(form);
  	      form.submit();
  	} */
  		
	  		
 //-------[hover]-------------------------------------------------------------------------------------------
  		$('.coupon-pay').hover(function() {
  	        // 마우스가 올라갔을 때
  	        $(this).css('background-color', '#C0C0C0');
  	        },
  	        function() {
  	            // 마우스가 벗어났을 때
  	            $(this).css('background-color', '#F8F8F8');
  	        }
  	   	); 
        
        $('.div-2').hover(function() {
      	        // 마우스가 올라갔을 때
      	     $(this).css('background-color', '#C0C0C0');
      	     },
      	     function() {
      	        // 마우스가 벗어났을 때
      	        $(this).css('background-color', '#F8F8F8');
      	     }
      	);
  		
        $('.coupon').hover(function() {
  	        // 마우스가 올라갔을 때
  	        $(this).css('background-color', '#C0C0C0');
  	        },
  	        function() {
  	            // 마우스가 벗어났을 때
  	            $(this).css('background-color', '#F8F8F8');
  	        }
  		);
		
      //쿠폰, 포인트 적용창 닫기 버튼 
  		$('.text-wrapper-14').click(function(){
  			$('#coupon-frame').hide();
  			$('#point-frame').hide();
  		});
        
        //맨 처음 닫힌 상태
  		$('#coupon-frame').hide();
		$('#point-frame').hide();
		
		//'쿠폰' 버튼 눌렀을 때 쿠폰 적용 창 열림 //호버 있으면 좋겠다
  		$('.coupon-pay').click(function(){
  			$('#coupon-frame').show();
  			$('#point-frame').hide();
  		});
		
  		 var selectedButton = null;

		  $('.card-pay-bt, .div-2').click(function(){
		    if (selectedButton !== null) {
		      selectedButton.removeClass('selected');
		    }
		    $(this).addClass('selected');
		    selectedButton = $(this);
		  });
  	}); 
  </script>
</html>
