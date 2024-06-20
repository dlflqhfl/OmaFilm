<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/admin/adminMovieGlobals.css" />
    <link rel="stylesheet" href="css/admin/adminMovieStyle.css" />
  </head>
  <body>
    <div class="DB">
      <div class="div-contents">
        <div class="div-con-wrap">
          <div class="horizontal-border">
           <table class="table">
              <thead>
                <tr>
                  <th class="cell"><div class="text-wrapper">번호</div></th>
                  <th class="div-wrapper"><div class="text-wrapper">선택</div></th>
                  <th class="cell-2"><div class="text-wrapper-2">영화 제목</div></th>
                  <th class="cell-3"><div class="text-wrapper-3">개봉일</div></th>
                </tr>
              </thead>
              <tbody>
                <tr class="row">
                  <td class="data"><div class="text-wrapper-4">2</div></td>
                  <td class="data-2"></td>
                  <td class="link-wrapper">
                    <div class="link"><div class="text-wrapper-5">타짜 23: 예림이 그 패 봐바 혹시 장이야?</div></div>
                  </td>
                  <td class="data-3"><div class="text-wrapper-6">2024.06.14</div></td>
                </tr>
                <tr class="row-1">
                  <td class="data"><div class="text-wrapper-4">3</div></td>
                  <td class="data-2"></td>
                  <td class="link-wrapper">
                    <div class="link"><div class="text-wrapper-7">노무현과 바보들</div></div>
                  </td>
                  <td class="data-3"><div class="text-wrapper-6">2024.06.14</div></td>
                </tr>
                <tr class="row-2">
                  <td class="data-4"><div class="text-wrapper-8">4</div></td>
                  <td class="data-5"></td>
                  <td class="cell-4">
                    <div class="link-2"><div class="text-wrapper-5">해리포터와 마법사의 돌</div></div>
                  </td>
                  <td class="data-6"><div class="text-wrapper-9">2024.06.14</div></td>
                </tr>
                <tr class="row-3">
                  <td class="data-4"><div class="text-wrapper-8">5</div></td>
                  <td class="data-5"></td>
                  <td class="cell-4">
                    <div class="link-2"><div class="text-wrapper-5">토르 : 다크월드</div></div>
                  </td>
                  <td class="data-6"><div class="text-wrapper-9">2024.06.14</div></td>
                </tr>
                <tr class="row-4">
                  <td class="data-4"><div class="text-wrapper-8">6</div></td>
                  <td class="data-5"></td>
                  <td class="cell-4">
                    <div class="link-2"><div class="text-wrapper-5">변신</div></div>
                  </td>
                  <td class="data-6"><div class="text-wrapper-9">2024.06.14</div></td>
                </tr>
                <tr class="row-5">
                  <td class="data-4"><div class="text-wrapper-8">7</div></td>
                  <td class="data-5"></td>
                  <td class="cell-4">
                    <div class="link-2"><div class="text-wrapper-5">나쁜녀석들</div></div>
                  </td>
                  <td class="data-6"><div class="text-wrapper-9">2024.06.14</div></td>
                </tr>
                <tr class="row-6">
                  <td class="data-4"><div class="text-wrapper-8">8</div></td>
                  <td class="data-5"></td>
                  <td class="cell-4">
                    <div class="link-2"><div class="text-wrapper-5">인터스텔라</div></div>
                  </td>
                  <td class="data-6"><div class="text-wrapper-9">2024.06.14</div></td>
                </tr>
                <tr class="row-7">
                  <td class="data-4"><div class="text-wrapper-8">9</div></td>
                  <td class="data-5"></td>
                  <td class="cell-4">
                    <div class="link-2"><div class="text-wrapper-5">위대한 쇼맨</div></div>
                  </td>
                  <td class="data-6"><div class="text-wrapper-9">2024.06.14</div></td>
                </tr>
                <tr class="row-8">
                  <td class="data-4"><div class="text-wrapper-10">10</div></td>
                  <td class="data-5"></td>
                  <td class="cell-4">
                    <div class="link-2"><div class="text-wrapper-5">탑건</div></div>
                  </td>
                  <td class="data-6"><div class="text-wrapper-9">2024.06.14</div></td>
                </tr>
              </tbody>
            </table>


          </div>
          <button class="button">
            <div class="container"><div class="text-wrapper-14">영화 제목</div></div>
            <img class="image" src="img/image.png" />
          </button>
          <div class="border">
            <div class="input">
              <div class="container-2"><div class="text-wrapper-15">검색어를 입력하세요.</div></div>
            </div>
            <div class="button-2"></div>
          </div>
          <div class="span-name"><div class="text-wrapper-16">관리자 님</div></div>
          <div class="list">
            <div class="item">
              <div class="link-14">
                <div class="text-wrapper-17">로그아웃</div>
                <div class="pseudo"></div>
              </div>
            </div>
          </div>
          <div class="overlap-2">
            <img class="rectangle-10" src="/img/adminMovieImg/rectangle-2.png"/>
            <img class="rectangle-11" src="/img/adminMovieImg/rectangle-2.png"/>
          </div>
          <div class="cell-5"><div class="text-wrapper-18">삭제</div></div>
          <div class="cell-6"><div class="text-wrapper-19">시간추가</div></div>
          <div class="heading">영화 관리</div>
          <div class="overlap-3">
            <div class="view"><div class="text-wrapper-20">API</div></div>
            <div class="view-2"><div class="text-wrapper-21">DB</div></div>
          </div>
        </div>
      </div>
		<jsp:include page="/jsp/admin/menu/menu.jsp"></jsp:include>
      <div class="div-wrap"></div>
    </div>
  </body>
</html>
