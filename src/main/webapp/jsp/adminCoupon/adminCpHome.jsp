<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html>
  <head> 
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/globals.css" /> 
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
            
            <table class="table">
            	<thead class="thead">
					<tr class="">
						<th class="th-0">선택</th>
						<th class="th-1">쿠폰코드</th>
						<th class="th-2">쿠폰명</th>
						<th class="th-3">할인율</th>
						<th class="th-4">발급일</th>
						<th class="th-5">만료일</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="len" value="${fn:length(cpItemArr)}" />
	                <c:if test="${page.end<=len}">
	                	<c:set var="end" value="${page.end}"/>
	                </c:if>
					<c:if test="${page.end>len}">
						<c:set var="end" value="${len}" />
					</c:if>
						
					<c:forEach var="i" begin="${page.begin}" end="${ end}" varStatus="status">
	                	<tr>
	                		<td class="rectangle"><input type="radio" name="option" value="${cpItemArr[i-1].ci_code }"/></td>
		                    <td class="data">${cpItemArr[i-1].ci_code }</td>
		                    <td class="data-3">${cpItemArr[i-1].ci_content }</td>
		                    <td class="data-2">${cpItemArr[i-1].ci_discount }%</td>
		                    <td class="data-4">${cpItemArr[i-1].ci_regi_time.split(" ")[0] }</td>
		                    <td class="data-5">${cpItemArr[i-1].ci_time.split(" ")[0] }</td>
	                	</tr>
	                </c:forEach>
				</tbody>
			</table>
			
			
              <!-- <div class="nav">
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
              </div> -->
              
            
              <div class="nav">   <!-- 페이징 시작 -->
				<div>
					<ol class="paging">
						<c:if test="${page.startPage < page.pagePerBlock}">
							<li class="disable">&lt;</li>
						</c:if>
						<c:if test="${page.startPage >= page.pagePerBlock}">
							<li class=""><a
								href="Controller?type=adminCpHome&cPage=${page.nowPage - page.pagePerBlock}">&lt;</a></li>
						</c:if>
						<!-- <div class="nav"> -->
						<c:forEach begin="${page.startPage }" end="${page.endPage}" var="i">
							<c:if test="${i == page.nowPage}">
								<li class="now">${i}</li>
							</c:if>
							<c:if test="${i != page.nowPage}">
								<li class=" "><a
									href="Controller?type=adminCpHome&cPage=${i}">${i}</a></li>
							</c:if>
						</c:forEach>


						<c:if test="${page.endPage < page.totalPage}">
							<li class=""><a
								href="Controller?type=adminCpHome&cPage=${page.nowPage - page.pagePerBlock}">&gt;</a></li>
						</c:if>
						<c:if test="${page.endPage >= page.totalPage}">
							<li class=" disable">&gt;</li>
						</c:if>

					</ol>
				</div>
			</div>   <!-- 페이징 끝 -->
              
            </div>
            
           	<select id="select" class=" button">
			  <option value="ci_code">쿠폰 코드</option>
			  <option value="ci_content">쿠폰명</option>
			  <option value="ci_discount">할인율</option>
			  <option value="ci_regi_time">등록일</option>
			  <option value="ci_time">만료일</option>
			</select>
			
            <div class="border">
              <input type="text" class="input" placeholder="검색어를 입력해 주세요." />
              <button class="button-2">검색</button>
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
	  	$(".button-2").click(function(){ //검색 버튼 클릭
	  		var value = $(".input").val().trim();
	  	    var searchType = $("#select").val();
	  	    console.log("검색어:", value);
	  	    console.log("검색타입:", searchType);
	  	  	location.href="Controller?type=adminCpHome&searchValue="+value+"&searchType="+searchType;
	  	});
	  	
  });
  
  </script>
</html>
