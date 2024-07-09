<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/admin/adminInquiryGlobals.css" />
    <link rel="stylesheet" href="css/admin/adminInquiryStyle.css" />
  </head>
  <body>
    <div class="div-wrapper">
      <div class="overlap-wrapper">
        <div class="overlap">
                  <div class="div-sidebar">
            <img class="img" src="img/adminNotice/1.png" />
            <div class="text-wrapper-20">관리자</div>
            <div class="list-2">
              <div class="item-link"><div class="text-wrapper-21"><a href="Controller?type=adminMovieDb">영화관리</a></div></div>
              <div class="item-link-2"><a href="Controller?type=adminEvent" class="text-wrapper-22">이벤트/혜택 관리</a></div>
              <div class="item-link-2"><div class="text-wrapper-23"><a href="Controller?type=adminCpHome">쿠폰관리</a></div></div>
              <div class="item-link-3"><div class="text-wrapper-24"><a href="Controller?type=adminNotice">고객센터 관리</a></div></div>
            </div>
          </div>
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
            <div class="frame-2">
              <div class="strong"><div class="text-wrapper-2">1</div></div>
              <div class="link-2"><div class="text-wrapper-3">2</div></div>
              <div class="link-3"><div class="text-wrapper-3">3</div></div>
              <div class="link-4"><div class="text-wrapper-3">4</div></div>
              <div class="link-5"><div class="text-wrapper-3">5</div></div>
              <div class="link-6"><div class="text-wrapper-3">6</div></div>
              <div class="link-7"><div class="text-wrapper-3">7</div></div>
              <div class="link-8"><div class="text-wrapper-3">8</div></div>
              <div class="link-9"><div class="text-wrapper-3">9</div></div>
              <div class="link-10"><div class="text-wrapper-4">10</div></div>
              <div class="link-11"></div>
              <div class="link-12"></div>
            </div>
            <form id="searchForm" method="post" action="Controller?type=adminSearchInquiry">
           		<div class="button">
						<select id="searchCategory" name="searchCategory" class="text-wrapper-5">
							<option value="iq_title">제목</option>
							<option value="iq_content">내용</option>
						</select>
				</div>
            <div class="border">
              <div class="input">
                <div class="container-2">
                <input type="text" name="searchTerm" placeholder="검색어를 입력해 주세요."
               class="text-wrapper-6" /></div>
              </div>
              <button type="button" onclick="executeSearch()" class="button-2">검색</button>
            </div>
            </form>
            <div class="cell">
            
            <button type="button" onclick="checkAnswer()" class="text-wrapper-7">답변 등록</button>
            
            </div>
            <div class="bar">
            <div class="view-3"><div class="text-wrapper-11">1:1 문의</div></div>
            <a href="Controller?type=adminFrequently" class="view"><div class="text-wrapper-9">자주 묻는 질문</a></div>
            <a href="Controller?type=adminNotice" class="element"><div class="text-wrapper-10">공지사항</a></div>
			</div>

            <div class="heading">고객센터 관리</div>
            <div class="table">
              <div class="header-row">
                <div class="overlap-group">
                  <div class="cell-2"><div class="text-wrapper-12">번호</div></div>
                  <div class="cell-3"><div class="text-wrapper-13">선택</div></div>
                </div>
                <div class="cell-4"><div class="text-wrapper-14">제목</div></div>
                <div class="cell-5"><div class="text-wrapper-15">작성자</div></div>
                <div class="cell-6"><div class="text-wrapper-16">접수상태</div></div>
                <div class="cell-7"><div class="text-wrapper-15">등록일</div></div>
              </div>
              <div class="body">
              <!-- row 뒤 숫자에 신경쓸 필요 없음 -->
              <c:forEach var="inquiry" items="${inquiryList}" varStatus="status">
    				
            		<div class="row-${status.index+1}">
    				<div class="overlap-group-3">
                      <div class="data"><div class="text-wrapper-17" name="iq_idx">${inquiry.iq_idx}</div></div>
                       <div class="data-2"><a href="Controller?type=adminComment&iq_idx=${inquiry.iq_idx}" class="p" name="title">${inquiry.iq_title}</a></div>
                      <div class="data-4"><div class="text-wrapper-19">${inquiry.u_code } </div></div>
                      
                      <c:if test="${inquiry.icvo == null}">
						    <div class="data-5"><div class="text-wrapper-19">답변 미완료</div></div>
						</c:if>
						<c:if test="${inquiry.icvo != null}">
						    <div class="data-5"><div class="text-wrapper-19">답변 완료</div></div>
						</c:if>
						
						
						
                    <div class="data-3"><div class="text-wrapper-8">${inquiry.iq_time}</div></div>
                    </div>
                    <div class="rectangle-wrapper">
                    
                    	<c:if test="${inquiry.icvo == null}">
						    <input type="radio" class="rectangle" name="deleteiqIds" value="${inquiry.iq_idx}"/></div>
						</c:if>
						<c:if test="${inquiry.icvo != null}">
						    <input type="radio" class="rectangle" name="deleteiqIds" value="${inquiry.iq_idx}" disabled/></div>
						</c:if>
                    
                    
                    </div>

                     </c:forEach>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script>
      function executeSearch() {
    	    document.getElementById("searchForm").submit();
    	}
      function checkAnswer() {
          var checkboxes = document.querySelectorAll('input[name="deleteiqIds"]:checked');
          if (checkboxes.length == 1) {
            var iq_idx = checkboxes[0].value;
            window.location.href = 'Controller?type=adminComment&iq_idx=' + iq_idx;
          } else if (checkboxes.length > 1) {
            alert("두 개이상 동시에 등록 할 수 없습니다.");
          } else {
            alert("항목을 선택해주세요.");
          }
      }
      </script>
  </body>
</html>