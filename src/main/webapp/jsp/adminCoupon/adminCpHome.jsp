<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
  <head> 
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/adminCoupon/home_globals.css" />
    <link rel="stylesheet" href="css/adminCoupon/home_style.css" />
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
            <div class="overlap-group">
            <table>
              <div class="table">
                <div class="thead">
                  <div class="overlap-group-2">
                    <div class="th"><div class="text-wrapper-2">쿠폰코드</div></div>
                    <div class="div-wrapper"><div class="text-wrapper-3">선택</div></div>
                  </div>
                  <div class="th-2"><div class="text-wrapper-4">쿠폰명</div></div>
                  <div class="th-3"><div class="text-wrapper-4">할인율</div></div>
                  <div class="th-4"><div class="text-wrapper-5">발급일</div></div>
                  <div class="th-5"><div class="text-wrapper-4">만료일</div></div>
                </div>
                <div class="tbody">
                
	                <c:forEach var="item" items="${cpItemArr }"  varStatus="i">
	                	<div class="td-${i.index+1}">
		                    <div class="data"><div class="text-wrapper-6">${item.ci_code }</div></div>
		                    <div class="rectangle-wrapper"><input type="radio" name="option" value="${item.ci_code }" class="rectangle"/></div>
		                    <div class="data-2"><div class="text-wrapper-22">${item.ci_discount }%</div></div>
		                    <div class="data-3"><div class="text-wrapper-7">${item.ci_content }</div></div>
		                    <div class="data-4"><div class="text-wrapper-8">${item.ci_regi_time }</div></div>
		                    <div class="data-5"><div class="text-wrapper-9">${item.ci_time }</div></div>
	                	</div>
	                </c:forEach>
	                
                </div>
              </div>
              </table>
              <div class="nav">
                <div class="strong"><div class="text-wrapper-10">1</div></div>
                <div class="link-2"><div class="text-wrapper-11">2</div></div>
                <div class="link-3"><div class="text-wrapper-11">3</div></div>
                <div class="link-4"><div class="text-wrapper-11">4</div></div>
                <div class="link-5"><div class="text-wrapper-11">5</div></div>
                <div class="link-6"><div class="text-wrapper-11">6</div></div>
                <div class="link-7"><div class="text-wrapper-11">7</div></div>
                <div class="link-8"><div class="text-wrapper-11">8</div></div>
                <div class="link-9"><div class="text-wrapper-11">9</div></div>
                <div class="link-10"><div class="text-wrapper-12">10</div></div>
                <div class="link-11"></div>
                <div class="link-12"></div>
              </div>
            </div>
            <button class="button">
              <div class="container"><div class="text-wrapper-13">구분</div></div>
              <img class="image" src="img/image.png" />
            </button>
            <div class="border">
              <div class="input">
                <div class="container-2"><div class="text-wrapper-14">검색어를 입력해 주세요.</div></div>
              </div>
              <div class="button-2"></div>
            </div>
            <div class="cell"><div class="text-wrapper-15">추가</div></div>
            <div class="cell-2"><div class="text-wrapper-15">삭제</div></div>
            <div class="cell-3"><div class="text-wrapper-16">적용회원 선택</div></div>
            <div class="heading">쿠폰 관리</div>
          </div>
          <div class="div-sidebar">
            <img class="element" src="img/1.png" />
            <div class="text-wrapper-17">관리자</div>
            <div class="list-2">
              <div class="item-link"><div class="text-wrapper-18">영화관리</div></div>
              <div class="item-link-2"><div class="text-wrapper-19">이벤트/혜택 관리</div></div>
              <div class="item-link-3"><div class="text-wrapper-20">쿠폰 관리</div></div>
              <div class="item-link-2"><div class="text-wrapper-21">고객센터 관리</div></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script>
  $(function(){
	  	$(".cell").click(function(){ //추가 버튼
      		location.href="Controller?type=adminCpAdd";
      	});
	  	$(".cell-2").click(function(){ //삭제 버튼
	  		var checkedValue = $('input[name="option"]:checked').val();

	  	    if (checkedValue) {
	  	    	if (confirm("선택된 쿠폰 (쿠폰코드: " + checkedValue + ")을 정말 삭제하시겠습니까?")) {
	  	          console.log("쿠폰 삭제:", checkedValue);
	  	          location.href="Controller?type=adminCpHome&delCode="+checkedValue;
	  	    	}
	  	    } else {// 선택된 쿠폰이 없을 때의 처리
	  	    	alert("삭제할 쿠폰을 선택해주세요.");
	  	    }
      	});
	  	$(".cell-3").click(function(){ //적용 회원 선택 버튼
	  		var checkedValue = $('input[name="option"]:checked').val();

	  	    if (checkedValue) {
	  	    	location.href="Controller?type=adminCpMember&ci_code="+checkedValue;
	  	    } else {// 선택된 쿠폰이 없을 때의 처리
	  	    	alert("적용할 쿠폰을 선택해주세요.");
	  	    }
	  	});
	  	
  });
  
  </script>
</html>
