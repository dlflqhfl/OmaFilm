<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReservation/style.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container-wrapper">
        <div class="container">
          <jsp:include page="/jsp/header/header.jsp"/>
          <div class="background">
            <div class="overlap">
              <div class="link-6"><div class="text-wrapper-8">마이페이지</div></div>
              <div class="list">
                <div class="overlap-group">
                  <div class="item-link-2"><div class="text-wrapper-10"><a href="Controller?type=myHome">마이페이지 홈</a></div></div>
                  <div class="item-link-3"><div class="text-wrapper-13"><a href="Controller?type=myReservation">나의 예매 내역 조회</a></div></div>
                  <div class="link-8"><div class="text-wrapper-14"><a href="Controller?type=myCancelReservation">나의 예매 취소 내역 조회</a></div></div>
                  <div class="link-9"><div class="text-wrapper-12"><a href="Controller?type=myCoupon">나의 쿠폰 조회</a></div></div>
                  <div class="link-7"><div class="text-wrapper-11"><a href="Controller?type=inquiry">나의 문의 내역</a></div></div>
                  <div class="item-link"><div class="text-wrapper-9"><a href="Controller?type=checkPw">개인 정보 수정</a></div></div>
                </div>
              </div>
            </div>
          </div>
          <div class="heading">나의 예매 내역 조회</div>
          <div class="background-2">
            <div class="container-2">
              <div class="label">영화명</div>
              <div class="border">
                
                  <input type="text" id="searchKey" class="input" placeholder="검색어를 입력해 주세요."/>
                
              </div>
            </div>
            <div class="overlap-2">
             
              <div class="label-wrapper"><div class="label-2">기간</div></div>
               <%
				    java.util.Calendar cal = java.util.Calendar.getInstance();
				    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM");
				%>
				
				<select class="text-wrapper-16" id="reservationValue">
				    <option value=""> ::선택하세요:: </option>
				    <% for(int i = 0; i < 12; i++) { %>
				        <% String formattedDate = sdf.format(cal.getTime()); %>
            			<option value="<%=formattedDate%>"><%=formattedDate%></option>
            			<%
                		cal.add(java.util.Calendar.MONTH, -1);
           				 } %>
				</select>
              <button class="link-10" id="reservationSearch">조회</button>
            </div>
          </div>
          <div class="horizontal-border">
            <div class="overlap-3">
              <div class="table">
                <div class="thead">
                  <div class="th"><div class="text-wrapper-18">예매 일시</div></div>
                  <div class="th-2"><div class="text-wrapper-19">예매번호</div></div>
                  <div class="th-3"><div class="text-wrapper-20">영화명</div></div>
                  <div class="th-4"><div class="text-wrapper-21">상영관</div></div>
                  <div class="th-5"><div class="text-wrapper-22">상영일시</div></div>
                  <div class="th-6"><div class="text-wrapper-22">예매금액</div></div>
                  <div class="th-7"><div class="text-wrapper-23">취소</div></div>
                </div>
                
                <div class="tbody">
                <c:set var="len" value="${fn:length(rvo)}" />
                <c:if test="${page.end<=len}">
                	<c:set var="end" value="${page.end}"/>
                </c:if>
				<c:if test="${page.end>len}">
					<c:set var="end" value="${len}" />
				</c:if>
					 <c:forEach var="i" begin="${page.begin}" end="${ end}" varStatus="status">
						<div class="tr-${status.index}">
							<div class="data-1">
								<div class="text-wrapper-24">${rvo[i-1].rs_time.split(" ")[0]}</div>
							</div>
							<div class="data-2">
								<div class="text-wrapper-25">${rvo[i-1].rs_num}</div>
							</div>
							<c:if test="${rvo[i-1].ssvo != null}">
								<div class="data-3">
									<div class="text-wrapper-26">${rvo[i-1].ssvo.t_name}</div>
								</div>
								<div class="data-4">
									<div class="text-wrapper-27">${rvo[i-1].ssvo.ss_time.split(" ")[0]}</div>
								</div>
								<div class="data-5">
									<div class="text-wrapper-28">${rvo[i-1].ssvo.mvo.movieNm }</div>
								</div>
							</c:if>
							<c:if test="${rvo[i-1].pvo != null}">
								<div class="data-6">
									<div class="text-wrapper-27">${rvo[i-1].pvo.p_tt_price}</div>
								</div>
							</c:if>
							<div class="th-8">
							    <div class="text-wrapper-23">

									<fmt:parseDate var="showTime"
										value="${rvo[i-1].ssvo.ss_time}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<%
									java.util.Date showTimeDate = (java.util.Date) pageContext.getAttribute("showTime");
									request.setAttribute("showTime", showTimeDate);
									%>
	
									<%
									java.util.Date now = new java.util.Date();
									java.util.Calendar cal3 = java.util.Calendar.getInstance();
									cal3.setTime(now);
									cal3.add(java.util.Calendar.MINUTE, -10);
									request.setAttribute("currentTimeMinus10", cal3.getTime());
									%>
	
									<c:choose>
										<c:when test="${showTime.time > currentTimeMinus10.time}">
											<button class="cancel-bt"
												value="${rvo[i-1].rs_num} ${rvo[i-1].pvo.p_code}">취소</button>
										</c:when>
										<c:otherwise>
											<span>취소 불가</span>
										</c:otherwise>
									</c:choose>
	
								</div>
							</div>
						</div>
					</c:forEach>
                </div>
              </div>
            </div>
            <!-- 페이징 -->
					<div class="nav">
						<div>
							<ol class="paging">
								<c:if test="${page.startPage < page.pagePerBlock}">
									<li class="disable">&lt;</li>
								</c:if>
								<c:if test="${page.startPage >= page.pagePerBlock}">
									<li class=""><a
										href="Controller?type=myReservation&cPage=${page.nowPage - page.pagePerBlock}">&lt;</a></li>
								</c:if>
								<!-- <div class="nav"> -->
								<c:forEach begin="${page.startPage }" end="${page.endPage}" var="i">
									<c:if test="${i == page.nowPage}">
										<li class="now">${i}</li>
									</c:if>
									<c:if test="${i != page.nowPage}">
										<li class=" "><a
											href="Controller?type=myReservation&cPage=${i}">${i}</a></li>
									</c:if>
								</c:forEach>


								<c:if test="${page.endPage < page.totalPage}">
									<li class=""><a
										href="Controller?type=myReservation&cPage=${page.nowPage - page.pagePerBlock}">&gt;</a></li>
								</c:if>
								<c:if test="${page.endPage >= page.totalPage}">
									<li class=" disable">&gt;</li>
								</c:if>

							</ol>
						</div>
					</div>
					<!-- 페이징 끝-->
				</div>
          
            </div>
          </div>
          <img class="line" src="https://c.animaapp.com/G7hSAD2g/img/line-1.svg" />
        </div>
      </div>
    </div>
   <jsp:include page="/jsp/footer/footer.jsp"/> 
  </body>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script>
		$(function(){
			//필요한 거 : rs_num, p_code
			$(".cancel-bt").click(function() {
				var confirmCancel = confirm("예매를 취소하시겠습니까?");
		        
		        if (confirmCancel) {
		        	var buttonValue = $(this).val();   // 클릭된 버튼의 value 속성 값
			        console.log(buttonValue); //19 23 -> rs_num, p_code
			        var str = buttonValue.split(" ");
			        
			        var form = document.createElement('form');
			        var objs;
			        
			        objs = document.createElement('input');
		            objs.setAttribute('type', 'hidden');
		            objs.setAttribute('name', 'rs_num');
		            objs.setAttribute('value', str[0]);
		            form.appendChild(objs);
		            
		            objs = document.createElement('input');
		            objs.setAttribute('type', 'hidden');
		            objs.setAttribute('name', 'p_code');
		            objs.setAttribute('value', str[1]);
		            form.appendChild(objs);
		            
			        form.setAttribute('method', 'post');
		            form.setAttribute('action', 'Controller?type=paycancel');
		            document.body.appendChild(form);
		            form.submit();
		        }
		    });
		
			 $("#reservationSearch").click(function() {
			    const searchKey = $("#searchKey").val(); // 검색어 입력값
			    const selectedMonth = $("#reservationValue").val(); // 선택된 월 값
	
			    // 입력값과 선택값을 활용하여 원하는 작업 수행
			    console.log("검색어:", searchKey);
			    console.log("선택된 달:", selectedMonth);
	
			    var form = document.createElement('form');
		        var objs;
		        
		        objs = document.createElement('input');
	            objs.setAttribute('type', 'hidden');
	            objs.setAttribute('name', 'searchKey');
	            objs.setAttribute('value', searchKey);
	            form.appendChild(objs);
	            
	            objs = document.createElement('input');
	            objs.setAttribute('type', 'hidden');
	            objs.setAttribute('name', 'selectedMonth');
	            objs.setAttribute('value', selectedMonth);
	            form.appendChild(objs);
	            
	            form.setAttribute('method', 'post');
	            form.setAttribute('action', 'Controller?type=myReservation');
	            document.body.appendChild(form);
	            form.submit();
			    
			 });
			 
			 
		});
		
		
  </script>
</html>

