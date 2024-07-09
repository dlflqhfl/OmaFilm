<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<!DOCTYPE html>
<html> 
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/adminCoupon/add_globals.css" />
    <link rel="stylesheet" href="css/adminCoupon/add_style.css" />
  </head>
  <body>
    <div class="screen">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="div-con-wrap">
            <div class="frame">
              <div class="span-name"></div>
              <div class="text-wrapper">관리자 님</div>
              <div class="list">
                <div class="item">
                  <div class="link">
                    <div class="div">로그아웃</div>
                    <div class="pseudo"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="heading">쿠폰 추가</div>
            <div class="frame-2">
              <div class="overlap-group">
              <form action="Controller?type=adminCpAdd" method="post">
               <!--  <div class="frame-wrapper">
                 <input class="div-wrapper" type="text" placeholder="20240617"/>
                </div> -->
                <div class="frame-3">
                  <input class="frame-4" type="text" name="ci_content" placeholder="신규 가입 축하 50% 할인 쿠폰"/>
                </div>
                <div class="frame-5">
                  <input class="frame-6" type="text" name="ci_discount" placeholder="10"/>
                  <div class="text-wrapper-5">%</div>
                </div>
                <div class="frame-7">
                	<c:set var="today" value="<%= new java.util.Date() %>" />
                	<fmt:formatDate var="todayString" value="${today}" pattern="yyyy-MM-dd"/>
					<input class="frame-8" type="text" id="ci_regi_time" name="ci_regi_time" value="${todayString}"/>
                </div>
                <div class="frame-9">
                  <input class="frame-8" type="text" name="ci_time" placeholder="2024-07-10"/>
                </div>
                <!-- <div class="frame-10"><div class="text-wrapper-7">쿠폰코드</div></div> -->
                <div class="frame-15">
                  <input class="frame-16" type="text" name="ci_summary" placeholder="신규가입 한 회원들에 한해 지급되는 총 결제 금액 50% 할인 쿠폰입니다."/>
                </div>
               </form>
                <div class="frame-10"><div class="text-wrapper-7">비고</div></div>
                <div class="frame-11"><div class="text-wrapper-7">쿠폰명</div></div>
                <div class="frame-12"><div class="text-wrapper-7">할인율</div></div>
                <div class="frame-13"><div class="text-wrapper-7">발급일</div></div>
                <div class="frame-14"><div class="text-wrapper-7">만료일</div></div>
              </div>
              
            </div>
           
            <div class="frame-17"><div class="text-wrapper-8">등록</div></div>
            <div class="frame-18"><div class="text-wrapper-9">취소</div></div>
          </div>
          <div class="div-sidebar">
            <img class="element" src="img/adminMovie/1.png" />
            <div class="text-wrapper-10">관리자</div>
            <div class="list-2">
              <div class="item-link"><div class="text-wrapper-11"><a href="Controller?type=adminMovieDb">영화관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-12"><a href="Controller?type=adminEvent">이벤트/혜택 관리</a></div></div>
              <div class="item-link-3"><div class="text-wrapper-13"><a href="Controller?type=adminCpHome">쿠폰관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-14"><a href="Controller?type=adminNotice">고객센터 관리</a></div></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
    	$(function(){
    		$('.frame-17').click(function() {
    			var confirmation = confirm("등록하시겠습니까?");
                if (confirmation) {
                	$('form').submit();
                    alert("등록되었습니다.");
                } else {
                    alert("취소되었습니다.");
                }
    	    });
    		
    		$('.frame-18').click(function() { //취소 버튼
    	        location.href="Controller?type=adminCpHome";
    	    });
    	});
    </script>
  </body>
</html>
    