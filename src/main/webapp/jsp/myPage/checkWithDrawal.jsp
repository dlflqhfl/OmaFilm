<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/checkWithDrawal.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container">
        <img class="footer" src="${pageContext.request.contextPath}/img/footer.png" />
        <div class="frame">
          <div class="navbar">
            <div class="link"><div class="text-wrapper">회원가입</div></div>
            <div class="div-wrapper"><div class="text-wrapper">고객센터</div></div>
            <div class="div"><div class="text-wrapper-2">관리자</div></div>
            <div class="text-wrapper-3">로그인</div>
            <div class="link-2"><div class="text-wrapper">빠른예매</div></div>
            <img class="img" src="img/link.png" />
            <img class="link-3" src="${pageContext.request.contextPath}/img/myPage/checkWithDrawal/link-1.png" />
            <img class="link-4" src="${pageContext.request.contextPath}/img/myPage/checkWithDrawal/link-2.png" />
            <div class="text-wrapper-4">예매</div>
            <a href="www.naver.com" target="_blank" rel="noopener noreferrer"><div class="text-wrapper-5">영화</div></a>
            <div class="text-wrapper-6">이벤트</div>
            <a href="www.naver.com" target="_blank" rel="noopener noreferrer"><div class="text-wrapper-7">혜택</div></a>
            <img class="heading-link" src="${pageContext.request.contextPath}/img/myPage/checkWithDrawal/heading-1-link.png" />
            <div class="link-5"></div>
          </div>
        </div>
        <div class="background">
          <div class="overlap">
            <div class="link-6"><div class="text-wrapper-8">마이페이지</div></div>
            <div class="list">
              <div class="overlap-group">
                <div class="item-link"><div class="text-wrapper-9">마이페이지 홈</div></div>
                <div class="item-link-2"><div class="text-wrapper-10">나의 예매 내역 조회</div></div>
                <div class="link-7"><div class="text-wrapper-11">나의 문의 내역</div></div>
                <div class="link-8"><div class="text-wrapper-12">나의 쿠폰 조회</div></div>
                <div class="item-link-3"><div class="text-wrapper-13">개인정보 수정</div></div>
              </div>
            </div>
          </div>
        </div>
        <div class="heading">회원 탈퇴</div>
        <p class="p">회원 탈퇴 전 다음 내용을 확인해주세요</p>
        <div class="frame-2">
        <a href="Controller?type=withDrawalSuccess">
        <button type="button" class="text-wrapper-14">탈퇴</button>
        </a>
        </div>
        <div class="frame-3"><button type="button" class="text-wrapper-15">취소</button></div>
        <div class="overlap-2">
          <p class="div-2">
            <span class="span">아이디 재사용 및 복구 불가 안내<br /></span>
            <span class="text-wrapper-16"
              >회원 탈퇴 후 본인을 포함한 타인 모두 아이디 재사용이나 복구가 불가능합니다.<br />신중히 선택하신 후
              결정해 주세요.<br
            /></span>
            <span class="text-wrapper-17"><br /></span>
            <span class="span">내 정보 및 서비스 이용<br /></span>
            <span class="text-wrapper-16"
              >내 정보 및 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br
            /></span>
            <span class="text-wrapper-17"><br /></span>
            <span class="span">혜택 및 쿠폰 소멸 안내<br /></span>
            <span class="text-wrapper-16">회원 탈퇴 시 소지한 쿠폰은 소멸됩니다. 확인해 주세요.<br /></span>
            <span class="text-wrapper-17"><br /><br /><br /><br /></span>
          </p>
          <img class="image" src="${pageContext.request.contextPath}/img/myPage/checkWithDrawal/image-17.png" />
          <img class="image-2" src="${pageContext.request.contextPath}/img/myPage/checkWithDrawal/image-17.png" />
          <img class="image-3" src="${pageContext.request.contextPath}/img/myPage/checkWithDrawal/image-17.png" />
        </div>
        <div class="text-wrapper-18">정말 탈퇴하시겠습니까?</div>
      </div>
    </div>
  </body>
</html>
