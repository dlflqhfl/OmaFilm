<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<input type="hidden" id="movieName" name="movieName" value="${param.movieName }">
			 	<input type="hidden" id="nText" name="nText" value="${param.text }">
            	<input type="hidden" id="nTime" name="nTime" value="${param.time }">
            	<input type="hidden" id="nDate" name="nDate" value="${param.date }">
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