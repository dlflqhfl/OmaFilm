<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../../css/globals.css" />
    <link rel="stylesheet" href="../../css/myPage/couponList.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container-wrapper">
        <div class="container">
          <div class="nov">
            <div class="overlap">
              <div class="ul">
                <div class="overlap-group">
                  <div class="li"><div class="text-wrapper"><a href="../../jsp/myPage/personInfor.jsp">개인 정보 수정</a></div></div>
                  <div class="div-wrapper"><div class="div"><a href="../../jsp/myPage/ticket.jsp">나의 예매 내역 조회</a></div></div>
                  <div class="li-2"><div class="text-wrapper-2"><a href="../../jsp/myPage/inquiry.jsp">나의 문의 내역</a></div></div>
                  <div class="li-3"><div class="text-wrapper-3"><a href="../../jsp/myPage/couponList.jsp">나의 쿠폰 조회</a></div></div>
                  <div class="li-5"><div class="text-wrapper-5"><a href="../../jsp/myPage/myhome.jsp">마이페이지 홈</a></div></div>
                </div>
              </div>
              <div class="div-2"><div class="text-wrapper-6">마이페이지</div></div>
            </div>
          </div>
          <div>
			<table class="table">
          <thead>
            <tr>
              <th class="cell"><div class="text-wrapper-10">번호</div></th>
              <th class="cell-2"><div class="text-wrapper-11">제목</div></th>
              <th class="cell-3"><div class="text-wrapper-12">등록일</div></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="data"><div class="text-wrapper-13">1</div></td>
              <td class="link-wrapper"> [쿠폰]영화 한 번 무료 쿠폰! </td>
              <td class="data-2"><div class="text-wrapper-14">2024.06.14</div></td>
            </tr>
            <tr>
              <td class="data"><div class="text-wrapper-13">2</div></td>
              <td class="link-wrapper"> [쿠폰]팝콘 공짜!
              </td>
              <td class="data-2"><div class="text-wrapper-14">2024.06.14</div></td>
            </tr>
            <tr>
              <td class="data"><div class="text-wrapper-13">3</div></td>
              <td class="link-wrapper"> [쿠폰]배고파? 나도 배고파
              </td>
              <td class="data-2"><div class="text-wrapper-14">2024.06.14</div></td>
            </tr>
          </tbody>
        </table>          
          
          
          
          
          </div>
          <div class="heading">나의 쿠폰 조회</div>
          <div class="bar">
            <div>
            	<select class="select">
				  <option class="item" value="all">::선택::</option>
				  <option class="item" value="usable" selected>사용 가능</option>
				  <option class="item" value="used">사용 완료</option>
				</select>
			</div>
			<div>
           <button type="button" class="button">조회</button>
           </div>
            <div class="label-wrapper"><div class="label">사용 상태</div></div>
          </div>
          <div class="overlap-2">
            <div class="text-wrapper-19">총</div>
            <p class="element"><span class="span">3</span> <span class="text-wrapper-20"> 매</span></p>
          </div>
          <div class="frame">
            <div class="navbar">
              <div class="link"><div class="text-wrapper-21">회원가입</div></div>
              <div class="link-2"><div class="text-wrapper-21">고객센터</div></div>
              <div class="link-3"><div class="text-wrapper-22">관리자</div></div>
              <div class="text-wrapper-23">로그인</div>
              <div class="link-4"><div class="text-wrapper-21">빠른예매</div></div>
              <img class="img" src="https://c.animaapp.com/WCDFxYha/img/link-5@2x.png" />
              <img class="link-5" src="https://c.animaapp.com/WCDFxYha/img/link-6@2x.png" />
              <img class="link-6" src="https://c.animaapp.com/WCDFxYha/img/link-7@2x.png" />
              <div class="text-wrapper-24">예매</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-25">영화</div></a
              >
              <div class="text-wrapper-26">이벤트</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-27">혜택</div></a
              >
              <img class="heading-link" src="https://c.animaapp.com/WCDFxYha/img/heading-1---link-1@2x.png" />
              <div class="link-7"></div>
            </div>
          </div>
          <img class="footer" src="https://c.animaapp.com/WCDFxYha/img/footer.png" />
        </div>
      </div>
    </div>
  </body>
</html>
    