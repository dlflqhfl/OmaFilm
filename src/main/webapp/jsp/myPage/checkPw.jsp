<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/checkPw.css" />
  </head>
  <body>
    <div class="container">
      <img class="footer" src="https://c.animaapp.com/e7SMZiYc/img/footer.png" />
      <div class="heading">본인 확인</div>
      <div class="frame">
        <div class="navbar">
          <div class="link"><div class="text-wrapper">회원가입</div></div>
          <div class="div-wrapper"><div class="text-wrapper">고객센터</div></div>
          <div class="div"><div class="text-wrapper-2">관리자</div></div>
          <div class="text-wrapper-3">로그인</div>
          <div class="link-2"><div class="text-wrapper">빠른예매</div></div>
          <img class="img" src="https://c.animaapp.com/e7SMZiYc/img/link-5@2x.png" />
          <img class="link-3" src="https://c.animaapp.com/e7SMZiYc/img/link-6@2x.png" />
          <img class="link-4" src="https://c.animaapp.com/e7SMZiYc/img/link-7@2x.png" />
          <div class="text-wrapper-4">예매</div>
          <a href="www.naver.com" target="_blank" rel="noopener noreferrer"><div class="text-wrapper-5">영화</div></a>
          <div class="text-wrapper-6">이벤트</div>
          <a href="www.naver.com" target="_blank" rel="noopener noreferrer"><div class="text-wrapper-7">혜택</div></a>
          <img class="heading-link" src="https://c.animaapp.com/e7SMZiYc/img/heading-1---link-1@2x.png" />
          <div class="link-5"></div>
        </div>
      </div>
      <div class="background">
        <div class="overlap">
          <div class="link-6"><div class="text-wrapper-8">마이페이지</div></div>
          <div class="list">
            <div class="overlap-group">
              <div class="item-link"><div class="text-wrapper-9"><a href="Controller?type=myHome">마이페이지 홈</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-10"><a href="Controller?type=myReservation">나의 예매 내역 조회</a></div></div>
              <div class="link-7"><div class="text-wrapper-11"><a href="Controller?type=inquiry">나의 문의 내역</a></div></div>
              <div class="link-8"><div class="text-wrapper-12"><a href="Controller?type=myCoupon">나의 쿠폰 조회</a></div></div>
              <div class="item-link-3"><div class="text-wrapper-13"><a href="Controller?type=editInfor">개인정보 수정</a></div></div>
            </div>
          </div>
        </div>
      </div>
      <p class="p">회원님의 개인정보 보호를 위해 본인인증을 하셔야 합니다.</p>
      
     <form action="Controller?type=checkPw" method="post">
      <div class="overlap-2">
        <div class="overlap-wrapper">
          <div class="overlap-3">
            <div class="frame-2"><div class="text-wrapper-15">${mvo.u_id }</div></div>
            <div class="frame-3"><div class="text-wrapper-16">아이디</div></div>
          </div>
        </div>
        <div class="frame-4"><div class="text-wrapper-15"><input class="pwtext" name="inputpw" type="password" placeholder="비밀번호를 입력하세요"/></div></div>
        <div class="frame-5"><div class="text-wrapper-16">비밀번호</div></div>
      </div>
      <div class="frame-6"><button type="submit" class="okbtn">확인</button></div></form>
      <div class="frame-7"><button type="button" class="delbtn" onclick="Controller?type=myHome">취소</button></div>
    </div>
  </body>
</html>
