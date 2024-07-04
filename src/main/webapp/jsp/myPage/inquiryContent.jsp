<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/inquiryContent.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container-wrapper">
        <div class="container">
          <img class="footer" src="${pageContext.request.contextPath}/img/inquiryContent/footer.png" />
          <div class="frame">
            <div class="navbar">
              <div class="link"><div class="text-wrapper">회원가입</div></div>
              <div class="div-wrapper"><div class="text-wrapper">고객센터</div></div>
              <div class="div"><div class="text-wrapper-2">관리자</div></div>
              <div class="text-wrapper-3">로그인</div>
              <div class="link-2"><div class="text-wrapper">빠른예매</div></div>
              <img class="img" src="${pageContext.request.contextPath}/img/myPage/inquiryContent/link.png" />
              <img class="link-3" src="${pageContext.request.contextPath}/img/myPage/inquiryContent/link-1.png" />
              <img class="link-4" src="${pageContext.request.contextPath}/img/myPage/inquiryContent/link-2.png" />
              <div class="text-wrapper-4">예매</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-5">영화</div></a
              >
              <div class="text-wrapper-6">이벤트</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-7">혜택</div></a
              >
              <img class="heading-link" src="${pageContext.request.contextPath}/img/myPage/inquiryContent/heading-1-link.png" />
              <div class="link-5"></div>
            </div>
          </div>
          <div class="background">
            <div class="overlap">
              <div class="link-6"><div class="text-wrapper-8">마이페이지</div></div>
              <div class="list">
                <div class="overlap-group">
                  <div class="item-link"><div class="text-wrapper-9">개인 정보 수정</div></div>
                  <div class="item-link-2"><div class="text-wrapper-10">나의 예매 내역 조회</div></div>
                  <div class="link-7"><div class="text-wrapper-11">마이페이지 홈</div></div>
                  <div class="link-8"><div class="text-wrapper-12">나의 쿠폰 조회</div></div>
                  <div class="item-link-3"><div class="text-wrapper-13">나의 문의 내역</div></div>
                  <div class="link-9"><div class="text-wrapper-14">나의 포인트 조회</div></div>
                </div>
              </div>
            </div>
          </div>
          <div class="heading">나의 문의 내역</div>
          <div class="text-wrapper-15">상세보기</div>
          <div class="horizontal-border">
            <div class="row">
              <div class="cell">
                <p class="label"><span class="span">등록일 </span> <span class="text-wrapper-16">*</span></p>
              </div>
              <div class="data"><div class="input">${ivo.iq_time}</div></div>
            </div>
            <div class="label-wrapper">
              <p class="p"><span class="span">제목 </span> <span class="text-wrapper-16">*</span></p>
            </div>
            <div class="input-wrapper"><div class="input-2">${ivo.iq_title}</div></div>
            <div class="cell-2">
              <p class="label-2"><span class="span">내용 </span> <span class="text-wrapper-16">*</span></p>
            </div>
            <div class="border-wrapper">
              <div class="border">
                <div class="textarea">
                	${ivo.iq_content}
                </div>
              </div>
            </div>
            <div class="cell-3">
              <p class="label-2"><span class="text-wrapper-18">답변</span> <span class="text-wrapper-16"> *</span></p>
            </div>
            <div class="data-2">
              <div class="border">
                <div class="textarea">
				    ${comment.comm_content}
                </div>
              </div>
            </div>
            <a href="Controller?type=inquiry"><button class="button"><div class="text-wrapper-19">목록</div></button></a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
    