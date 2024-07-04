<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html> 
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/myCoupon/myCoupon.css" />
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
                  <div class="div-wrapper"><div class="div"><a href="Controller?type=myReservation">나의 예매 내역 조회</a></div></div>
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
          <thead> <!-- 발급일 | 내용 | 상태(2024-06-28 사용/ 사용 가능) | 만료일(-/2024-06-28) -->
            <tr>
              <th class="cell"><div class="text-wrapper-10">발급일</div></th>
              <th class="cell-2"><div class="text-wrapper-11">내용</div></th>
              <th class="cell-3"><div class="text-wrapper-12">상태</div></th>
              <th class="cell-3"><div class="text-wrapper-12">만료일</div></th>
            </tr>
          </thead>
          <tbody>
          		<c:if test="${fn:length(cvo)<1 }">
          		<tr>
					<td colspan="4">조회할 쿠폰이 없습니다.</td>
				</tr>
				</c:if>
				
				<c:if test="${fn:length(cvo)!=null and fn:length(cvo) > 0 }">
				    <c:forEach var="item" items="${requestScope.cvo}" varStatus="vs">
				    	<tr>
			              <td class="data"><div class="text-wrapper-13"> ${item.cp_date} </div></td>
			              <td class="link-wrapper"> ${item.c_item.ci_content} </td>
			              
			              <c:if test="${item.cp_status == 0 }">
				              <td class="data-2"><div class="text-wrapper-14"> 사용 가능 </div></td>
				              <td class="data-2"><div class="text-wrapper-14"> ${item.c_item.ci_time} </div></td>
			              </c:if>
			               <c:if test="${item.cp_status == 1 }">
				              <td class="data-2"><div class="text-wrapper-14"> ${item.cp_use} 사용</div></td>
				              <td class="data-2"><div class="text-wrapper-14"> - </div></td>
			              </c:if>
			            </tr>
				    </c:forEach>
				</c:if>
      
          </tbody>
        </table>          
          
          
          </div>
          <div class="heading">나의 쿠폰 조회</div>
          <div class="bar">
            <div>
              <select class="select" id="searchType">
	              
	              <option class="item" value="usable">사용 가능</option>
	              <option class="item" value="used">사용 완료</option>
	              <option class="item" value="all">전체</option>
	            </select>
	         </div>
         <div>
           <button type="button" class="button" id="search-bt">조회</button>
           </div>
            <div class="label-wrapper"><div class="label">사용 상태</div></div>
          </div>
          <div class="overlap-2">
            <div ></div>
            <p class="element"><span class="text-wrapper-19">총</span><span class="span">3</span> <span class="text-wrapper-20"> 매</span></p>
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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  
    <script>
    $(function(){
    	$('#search-bt').click(function(){
    		console.log("바보야");
    		let selectedType = $("#searchType").val();
    		
    		var form = document.createElement('form');
            var objs;
            objs = document.createElement('input');
            objs.setAttribute('type', 'hidden');
            objs.setAttribute('name', 'selectedType');
            
    		if(selectedType == "usable"){ //사용 가능한 쿠폰 조회
    			objs.setAttribute('value', 'usable');
    		}else if(selectedType == "used"){ //사용 불가능한 쿠폰 조회
    			objs.setAttribute('value', 'used');
    		}else{
    			objs.setAttribute('value', 'all');
    		}
    		
    		form.appendChild(objs);
            form.setAttribute('method', 'post');
            form.setAttribute('action', 'Controller?type=myCoupon');
            document.body.appendChild(form);
            form.submit();
                
    	});
    });
    </script>
  </body>
</html>
    