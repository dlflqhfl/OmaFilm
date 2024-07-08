<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html>
  <head> 
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/" />
  </head>
  <body>
    <div class="API">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="div-sidebar">
            <img class="element" src="img/adminAddMovie/1.png" />
            <div class="text-wrapper">관리자</div>
            <div class="list">
              <div class="item-link"><div class="div">영화관리</div></div>
              <div class="div-wrapper"><div class="text-wrapper-2">이벤트/혜택 관리</div></div>
              <div class="item-link-2"><div class="text-wrapper-3">쿠폰관리</div></div>
              <div class="item-link-2"><div class="text-wrapper-4">고객센터 관리</div></div>
            </div>
          </div>
          <div class="div-con-wrap">
            <div class="frame">
              <div class="span-name"></div>
              <div class="text-wrapper-5">관리자 님</div>
              <div class="item-wrapper">
                <div class="item">
                  <div class="link">
                    <div class="text-wrapper-6">로그아웃</div>
                    <div class="pseudo"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="heading">영화관리</div>
            <div class="overlap-group">
              <div class="row">
                <div class="cell"><div class="label">첨부파일</div></div>
                <div class="data">
                  <div class="input"></div>
                  <button class="button"><div class="text-wrapper-7">첨부파일 등록</div></button>
                </div>
              </div>
              <div class="row-2">
                <div class="cell"><div class="label">전체 상영관</div></div>
                <div class="data-2">
                  <div class="overlap-group-2">
                    <div class="input-2"></div>
                    <div class="label-wrapper"><div class="label-2">전체 상영시간표</div></div>
                  </div>
                  <div class="input-3"></div>
                  <button class="button-2"><div class="text-wrapper-7">시간 추가하기</div></button>
                </div>
              </div>
              <div class="row-3">
                <div class="cell"><div class="label">장르</div></div>
                <div class="data-3">
                  <div class="overlap-group-3">
                    <div class="input-4"></div>
                    <div class="cell-2"><div class="label">감독</div></div>
                  </div>
                  <div class="overlap-2">
                    <div class="input-5"></div>
                    <div class="cell-3"><div class="label">출연</div></div>
                  </div>
                  <div class="input-6"></div>
                </div>
              </div>
              <div class="row-4">
                <div class="cell"><div class="label">개봉일</div></div>
                <div class="overlap-3">
                  <div class="cell-4"><div class="label-3">상영시간</div></div>
                  <div class="cell-5"><div class="label-3">관람등급</div></div>
                  <div class="cell-6"><div class="label-4">누적관람객 수</div></div>
                  <div class="data-4">
                    <div class="input-7"></div>
                    <div class="input-8"></div>
                    <div class="input-9"></div>
                    <div class="input-10"></div>
                  </div>
                </div>
              </div>
              <div class="row-5">
                <div class="cell-7"><div class="label">영화명</div></div>
                <div class="input-wrapper"><div class="input-11"></div></div>
              </div>
              <div class="row-6">
                <div class="cell-8">
                  <p class="p"><span class="span">줄거리 </span> <span class="text-wrapper-8">*</span></p>
                </div>
                <div class="border-wrapper">
                  <div class="border">
                    <div class="overlap-group-4">
                      <div class="container"><div class="text-wrapper-9">0 / 2000</div></div>
                      <div class="text-wrapper-10">내용을 작성하세요.</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <button class="button-3"><div class="text-wrapper-11">등록</div></button>
            <button class="button-4"><div class="text-wrapper-12">목록</div></button>
            <img class="line" src="img/adminAddMovie/line-2.svg" />
            <div class="text-wrapper-13">영화 추가</div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
