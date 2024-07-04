<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<!DOCTYPE html>
<html> 
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/myReservation/globals.css" />
    <link rel="stylesheet" href="css/myReservation/style.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container-wrapper">
        <div class="container">
          <img class="footer" src="https://c.animaapp.com/G7hSAD2g/img/footer.png" />
          <div class="frame">
            <div class="navbar">
              <div class="link"><div class="text-wrapper">회원가입</div></div>
              <div class="div-wrapper"><div class="text-wrapper">고객센터</div></div>
              <div class="div"><div class="text-wrapper-2">관리자</div></div>
              <div class="text-wrapper-3">로그인</div>
              <div class="link-2"><div class="text-wrapper">빠른예매</div></div>
              <img class="img" src="https://c.animaapp.com/G7hSAD2g/img/link-9@2x.png" />
              <img class="link-3" src="https://c.animaapp.com/G7hSAD2g/img/link-10@2x.png" />
              <img class="link-4" src="https://c.animaapp.com/G7hSAD2g/img/link-11@2x.png" />
              <div class="text-wrapper-4">예매</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-5">영화</div></a
              >
              <div class="text-wrapper-6">이벤트</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-7">혜택</div></a
              >
              <img class="heading-link" src="https://c.animaapp.com/G7hSAD2g/img/heading-1---link-1@2x.png" />
              <div class="link-5"></div>
            </div>
          </div>
          <div class="background">
            <div class="overlap">
              <div class="link-6"><div class="text-wrapper-8">마이페이지</div></div>
              <div class="list">
                <div class="overlap-group">
                  <div class="item-link"><div class="text-wrapper-9">개인 정보 수정</div></div>
                  <div class="item-link-2"><div class="text-wrapper-10">마이페이지 홈</div></div>
                  <div class="link-7"><div class="text-wrapper-11">나의 문의 내역</div></div>
                  <div class="link-8"><div class="text-wrapper-12"><a href="Controller?type=myCoupon">나의 쿠폰 조회</a></div></div>
                  <div class="item-link-3"><div class="text-wrapper-13"></div></div>
                  <div class="link-9"><div class="text-wrapper-14">나의 포인트 조회</div></div>
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
                	<c:forEach var="item" items="${rvo}" varStatus="status">
					  <div class="tr-${status.index + 1}">
					    <div class="data-1"><div class="text-wrapper-24">${item.rs_time.split(" ")[0]}</div></div>
					    <div class="data-2"><div class="text-wrapper-25">${item.rs_num}</div></div>
					    <c:if test="${item.ssvo != null}">
					      <div class="data-3"><div class="text-wrapper-26">${item.ssvo.t_name}</div></div>
					      <div class="data-4"><div class="text-wrapper-27">${item.ssvo.ss_time.split(" ")[0]}</div></div>
					      <div class="data-5"><div class="text-wrapper-28">${item.ssvo.mvo.movieNm }</div></div>
					    </c:if>
					    <c:if test="${item.pvo != null}">            
					      <div class="data-6"><div class="text-wrapper-27">${item.pvo.p_tt_price}</div></div>
					    </c:if><!-- rs_num, p_code -->
					    <div class="th-8"><div class="text-wrapper-23"><button class="cancel-bt" value="${item.rs_num} ${item.pvo.p_code}">취소</button></div></div>
					  </div>
					</c:forEach>
                	
                  <div class="nav">
                    <div class="strong"><div class="text-wrapper-29">1</div></div>
                    <div class="link-11"><div class="text-wrapper-30">2</div></div>
                    <div class="link-12"><div class="text-wrapper-30">3</div></div>
                    <div class="link-13"><div class="text-wrapper-30">4</div></div>
                    <div class="link-14"><div class="text-wrapper-30">5</div></div>
                    <div class="link-15"><div class="text-wrapper-30">6</div></div>
                    <div class="link-16"><div class="text-wrapper-30">7</div></div>
                    <div class="link-17"><div class="text-wrapper-30">8</div></div>
                    <div class="link-18"><div class="text-wrapper-30">9</div></div>
                    <div class="link-19"><div class="text-wrapper-31">10</div></div>
                    <div class="link-20"></div>
                    <div class="link-21"></div>
                  </div>
                </div>
              </div>
              <div class="heading-2">예매 내역</div>
            </div>
          </div>
          <div class="overlap-wrapper">
            <div class="overlap-4">
              <div class="table-2">
                <div class="thead-2">
                  <div class="th-9"><div class="text-wrapper-32">취소 일시</div></div>
                  <div class="th-10"><div class="text-wrapper-33">예매번호</div></div>
                  <div class="th-11"><div class="text-wrapper-20">영화명</div></div>
                  <div class="th-12"><div class="text-wrapper-21">극장/상영관</div></div>
                  <div class="th-13"><div class="text-wrapper-22">상영일시</div></div>
                  <div class="th-14"><div class="text-wrapper-22">환불 금액</div></div>
                </div>
                <div class="tbody-2">
                
                <c:forEach var="item" items="${rvo_cancel}" varStatus="status">
					  <div class="tr-${status.index + 11}">
					    <div class="data-7"><div class="text-wrapper-27">${item.rs_time.split(" ")[0]}</div></div>
					    <div class="data-8"><div class="text-wrapper-27">${item.rs_num}</div></div>
					    <c:if test="${item.ssvo != null}">
					      <div class="data-9"><div class="text-wrapper-26">${item.ssvo.t_name}</div></div>
					      <div class="data-10"><div class="text-wrapper-27">${item.ssvo.ss_time.split(" ")[0]}</div></div>
					      <div class="data-11"><div class="text-wrapper-28">${item.ssvo.mvo.movieNm }</div></div>
					    </c:if>
					    <c:if test="${item.pvo != null}">
					      <div class="data-12"><div class="text-wrapper-27">${item.pvo.p_tt_price}</div></div>
					    </c:if>
					  </div>
					</c:forEach>
                
                    <div class="nav-2">
                      <div class="strong"><div class="text-wrapper-29">1</div></div>
                      <div class="link-11"><div class="text-wrapper-30">2</div></div>
                      <div class="link-12"><div class="text-wrapper-30">3</div></div>
                      <div class="link-13"><div class="text-wrapper-30">4</div></div>
                      <div class="link-14"><div class="text-wrapper-30">5</div></div>
                      <div class="link-15"><div class="text-wrapper-30">6</div></div>
                      <div class="link-16"><div class="text-wrapper-30">7</div></div>
                      <div class="link-17"><div class="text-wrapper-30">8</div></div>
                      <div class="link-18"><div class="text-wrapper-30">9</div></div>
                      <div class="link-19"><div class="text-wrapper-31">10</div></div>
                      <div class="link-20"></div>
                      <div class="link-21"></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="heading-2">예매 취소 내역</div>
              
              
              <!-- 
              
              div class="label-wrapper"><div class="label-2">기간</div></div>
               
				
				<select class="text-wrapper-16" id="reservationValue">
				    <option value=""> ::선택하세요:: </option>
				    <% for(int i = 0; i < 12; i++) { %>
				        <% String formattedDate = sdf.format(cal.getTime()); %>
            			<option value="<%=formattedDate%>"><%=formattedDate%></option>
            			<%
                		cal.add(java.util.Calendar.MONTH, -1);
           				 } %>
				</select>
				
               -->
               <div class="overlap-2">
             
              <div class="label-wrapper"><div class="label-2">기간</div></div>
               		<%
				    java.util.Calendar cal2 = java.util.Calendar.getInstance();
				%>
				<select class="text-wrapper-16" id="cancelMonth">
				    <option value=""> ::선택하세요:: </option>
				    <% for(int i = 0; i < 12; i++) { %>
				        <% String formattedDate = sdf.format(cal2.getTime()); %>
            			<option value="<%=formattedDate%>"><%=formattedDate%></option>
            			<%
                		cal2.add(java.util.Calendar.MONTH, -1);
           				 } %>
				</select>
              <button class="link-10" id="cancelSearch">조회</button>
            </div>
          </div>
          <img class="line" src="https://c.animaapp.com/G7hSAD2g/img/line-1.svg" />
        </div>
      </div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script>
		$(function(){
			//필요한 거 : rs_num, p_code
			$(".cancel-bt").click(function() {
				var confirmCancel = confirm("예매를 취소하시겠습니까?");
		        
		        if (confirmCancel) {
		        	var buttonValue = $(this).val();   // 클릭된 버튼의 value 속성 값
			        console.log(buttonValue); //19 23
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
			 
			 //예매 취소 내역 기간 검색 버튼
			 $("#cancelSearch").click(function() {
				    const selectedMonth = $("#cancelMonth").val(); // 선택된 월 값
		
				    var form = document.createElement('form');
			        var objs;
		            
		            objs = document.createElement('input');
		            objs.setAttribute('type', 'hidden');
		            objs.setAttribute('name', 'cancelMonth');
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

