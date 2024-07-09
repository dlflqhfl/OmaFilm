<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head> <!-- !1정보전략1! -->
  <meta charset="utf-8" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment/complete_globals.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment/complete_style.css" />
</head>
<% 
  String name = request.getParameter("buyer_name");
  System.out.println(name);%>
<body>
<div class="pay-complt">
  <div class="overlap-wrapper">
    <div class="overlap">
      <div class="overlap-group">
        <div class="list">
          <div class="item">
            <div class="link">
              <div class="strong">
                <div class="text-wrapper">01</div>
                <div class="div">상영시간</div>
              </div>
            </div>
          </div>
          <div class="link-wrapper">
            <div class="link">
              <div class="strong-2">
                <div class="text-wrapper-2">02</div>
                <div class="text-wrapper-3">인원/좌석</div>
              </div>
            </div>
          </div>
          <div class="div-wrapper">
            <div class="link">
              <div class="strong-2">
                <div class="text-wrapper-4">03</div>
                <div class="text-wrapper-5">결제</div>
              </div>
            </div>
          </div>
          <div class="item-2">
            <div class="link">
              <div class="strong-2">
                <div class="text-wrapper-6">04</div>
                <div class="text-wrapper-7">결제완료</div>
              </div>
            </div>
          </div>
        </div>
        <div class="pay-complt-frame div">
          <div class="text">
            <c:if test="${sessionScope.mvo != null }">
              <div class="pay-id">${sessionScope.mvo.u_name }</div>
            </c:if>
            <c:if test="${sessionScope.mvo == null }">
              <div class="pay-id">${param.non_phone }</div>
            </c:if>
            <div class="pay-complt-text">회원님, 결제가 성공적으로 완료되었습니다.</div>

          </div>
          <div class="text-warrning"><!--
                <div class="flexcontainer">
                  <p class="span-wrapper">
                    <span class="text-wrapper"><br /></span>
                  </p>
                  <p class="span-wrapper">
                    <span class="span">적립 예정 포인트는 예매 이후 바로 적립 됩니다.<br /></span>
                  </p>
                  <p class="span-wrapper">
                    <span class="span">예고편 상영 등 사정에 의해 본 영화 시작이 10여분 정도 차이날 수 있습니다.<br /></span>
                  </p>
                  <p class="span-wrapper">
            <span class="span"
            >개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다. 꼭 예매 번호를 확인해 주세요.<br
            /></span>
                  </p>
                  <p class="span-wrapper">
                    <span class="span">예매 내역은 마이페이지 &gt; 예매내역에서 확인하실 수 있습니다.<br /></span>
                  </p>
                  <p class="span-wrapper"><span class="span"></span></p>
                </div>
                <div class="flexcontainer-2">
                  <p class="p">
            <span class="text-wrapper-2"
            >온라인 예매 내역 취소는 상영 시작 20분 전까지 온라인에서 가능합니다.<br
            /></span>
                  </p>
                  <p class="p">
                    <span class="text-wrapper-2">상영시작 20 분 이후 부터는 영화관 현장에서만 취소 가능합니다.</span>
                  </p>
                </div>-->
          </div>
          <div class="pay-key"><div class="text-wrapper-3">예매내역</div></div>
          <div class="home-key"><div class="text-wrapper-4">홈으로 바로가기</div></div>
          <div class="frame">
            <div class="discount-text">할인금액</div>
            <div class="movie-image"><img width="128px" src="${param.poster }"></div>
            <div class="date-text">상영일시</div>
            <div class="peo-num-text">관람인원</div>
            <p class="watch-date">
            <c:if test="${param.date != null && param.time != null }">
            	${param.date } ${param.time } 
            </c:if>
            <c:if test="${param.nDate != null && param.nTime != null }">
            	${param.nDate } ${param.nTime } 
            </c:if>
            </p>
            <div class="people-num">
            <c:if test="${param.totalCount != null}">
            	${param.totalCount.replace(":", " ") }
            </c:if>
            <c:if test="${param.nTotalCount != null}">
            	${param.nTotalCount.replace(":", " ") }
            </c:if>
            </div>
            <div class="theaters">
              <div class="theater-text">상영관</div>
              <div class="theater-num">${param.t_name }</div>
            </div>
            <img class="line" src="img/payment/line-1.svg" />
            <img class="img" src="img/payment/line-2.svg" />
            <div class="seat-text">좌석</div>
            <div class="seat-num">
            <c:if test="${param.checkSeat != null }">
            	${param.checkSeat.replace(",", ", ")}
            </c:if>
            <c:if test="${param.nCheckSeat != null }">
            	${param.checkSeat.replace(",", ", ")}
            </c:if>
            </div>
            <div class="minus">
              <div class="overlap-group">
                <img class="line-2" src="img/payment/line-4.svg" />
                <img class="ellipse" src="img/payment/ellipse-3.svg" />
                <div class="text-wrapper-5">-</div>
              </div>
            </div>
            <div class="equal">
              <div class="overlap">
                <img class="line-3" src="img/payment/line-4.svg" />
                <img class="ellipse-2" src="img/payment/ellipse-3.svg" />
                <div class="text-wrapper-6">=</div>
              </div>
            </div>
            <div class="dis-won">원</div>
            <div class="total-won">원</div>
            <div class="total-price-text">총 결제 금액</div>
            <div class="price">
              <div class="sel-price-text">주문금액</div>
              <div class="select-won">원</div>
              <div class="select-price">${param.p_ex_price }</div>
            </div>
            <div class="dis-price">
            	${param.saleprice}
            </div>
            <div class="total-price">${param.p_tt_price }</div>
            <div class="text-wrapper-7">예매번호 ${rs_num }</div>
            <div class="text-wrapper-8">
            <c:if test="${param.payContent != null }">
              ${param.payContent }
            </c:if>
            <c:if test="${param.nPayContent != null }">
              ${param.nPayContent }
            </c:if>
            </div>
          </div>
        </div>

      </div>
      <div class="seat-background"><div class="select-seat-text">결제완료</div></div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>

$(function(){
	var mvo = '<%= session.getAttribute("mvo") %>';

    $(".pay-key").click(function() {
        if(mvo == null || mvo == 'null'){
        	location.href = "Controller?type=noReservationCheck";
        }else{
            location.href = "Controller?type=myReservation";
        }
    });

    $(".home-key").click(function() {
        location.href = "Controller?type=index";
    });
	
});
</script>
</body>
</html>
