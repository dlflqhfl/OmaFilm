<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation/noReservationCheckModalStyle.css"/>
    <div class="modal-wrapper">
      <div class="modal">
        <div class="modal-button"><div class="text-wrapper">닫기</div></div>
        <div class="modal-header">
          <div class="text-wrapper-2">알림</div>
          <img class="multiply" src="https://c.animaapp.com/eKbCsvgN/img/multiply@2x.png" />
        </div>
        <div class="txt-comon"><div class="text-wrapper-3">결제정보</div></div>
        <div class="txt-comon-2">
          <div class="frame">
            <div class="div-wrapper"><div class="text-wrapper-4">상품금액</div></div>
            <div class="frame-2"><div class="text-wrapper-5" id="t_ex_price"></div></div>
          </div>
          <div class="frame-3">
            <div class="div-wrapper"><div class="text-wrapper-4">할인금액</div></div>
            <div class="frame-2"><div class="text-wrapper-5" id="t_tt_price"></div></div>
          </div>
          <div class="frame-4">
            <div class="div-wrapper"><div class="text-wrapper-4">최종 결제금액</div></div>
            <div class="frame-2"><div class="text-wrapper-5" id="totalPrice1"></div></div>
          </div>
          <div class="frame-5">
            <div class="div-wrapper"><div class="text-wrapper-4">결제일시</div></div>
            <div class="frame-2"><div class="text-wrapper-5" id="ppTime"></div></div>
          </div>
        </div>
      </div>
    </div>