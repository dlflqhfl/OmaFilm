<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
  String iqIdx = request.getParameter("iq_idx");
  // iq_idx를 이용한 데이터 조회 및 처리
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/admin/adminCommentglobals.css" />
    <link rel="stylesheet" href="css/admin/adminCommentstyle.css" />
  </head>
  <body>
    <div class="element">
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
            <div class="heading">1:1 답변</div>
            <form action="Controller?type=adminAddComment" method="post">
            <input type="hidden" name="iq_idx" value="${param.iq_idx}" />
            <input type="hidden" name="title" value="${inquiry.iq_title}" /> 
            <div class="div-wrapper">
            
            <c:if test="${inquiry.icvo != null && inquiry.icvo.comm_content != null}">
	            <button type="submit" disabled style="background-color: #ffffff;">
	            <div class="text-wrapper-2" style="color: #000000;">등록</div></button></div>
            </c:if>
            <c:if test="${inquiry.icvo == null}">
	            <button type="submit">
	            <div class="text-wrapper-2">등록</div></button></div>
            </c:if>
            
            
            <div class="frame-2" id="list-link"><div class="text-wrapper-3">목록</div></div>
            <div class="row">
              <div class="cell">
                <p class="label"><span class="span">제목 </span> <span class="text-wrapper-4">*</span></p>
              </div>
              <div class="overlap-group"><div class="input">${inquiry.iq_title}</div></div>
            </div>
            <div class="row-2">
              <div class="label-wrapper">
                <p class="p"><span class="span">등록일 </span> <span class="text-wrapper-4">*</span></p>
              </div>
              <div class="data"><div class="input-2">${inquiry.iq_time} </div></div>
            </div>
            <div class="cell-2">
              <p class="label-2"><span class="span">내용 </span> <span class="text-wrapper-4">*</span></p>
            </div>
            <div class="border-wrapper">
              <div class="border">
                <div class="textarea">
                  ${inquiry.iq_content}
                  
                  <div class="container"><div class="text-wrapper-5">${inquiry.iq_content.length()} / 2000</div></div>
                </div>
              </div>
            </div>
            <div class="cell-3">
              <p class="label-2"><span class="text-wrapper-6">답변</span> <span class="text-wrapper-4"> *</span></p>
            </div>
            <div class="data-2">
              <div class="border">
                <div class="textarea-answer">
                
                <c:choose>
				    <c:when test="${inquiry.icvo != null && inquiry.icvo.comm_content != null}">
				        <textarea id="answer" name="answer" readonly>${inquiry.icvo.comm_content}</textarea>
				    </c:when>
				    <c:otherwise>
				        <textarea id="answer" name="answer" placeholder="답변을 입력해주세요."></textarea>
				    </c:otherwise>
				</c:choose>
				
                  <div class="container-answer"><div class="text-wrapper-5-answer">0 / 2000</div></div>
                </div>
              </div>
            </div>
            </form>
          </div>
          <div class="div-sidebar">
            <img class="img" src="img/adminNotice/1.png" />
            <div class="text-wrapper-7">관리자</div>
            <div class="list-2">
              <div class="item-link"><div class="text-wrapper-8"><a href="Controller?type=adminMovieDb">영화관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-9"><a href="Controller?type=adminEvent">이벤트/혜택 관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-10"><a href="Controller?type=adminCpHome">쿠폰관리</a></div></div>
              <div class="item-link-3"><div class="text-wrapper-11"><a href="Controller?type=adminNotice">고객센터 관리</a></div></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
      
      var answerTextarea = document.getElementById('answer');
      var charCountElement = document.querySelector('.text-wrapper-5-answer');

      // textarea에 이벤트 추가
      answerTextarea.addEventListener('input', function() {
        var currentLength = answerTextarea.value.length;
        charCountElement.textContent = currentLength + ' / 2000';
      });
      function ListClick() {
  	    window.location.href = 'Controller?type=adminInquiry';
  	  }
      window.onload = function() {
        document.getElementById('list-link').addEventListener('click',ListClick);
      }
      
    </script>
  
</html>
