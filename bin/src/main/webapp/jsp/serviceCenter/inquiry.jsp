<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>  
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/serviceCenter/Inquiry_style.css" /> 
  </head>
  <body>
    <div class="element">
      <div class="container-wrapper">
        <div class="container">
          <jsp:include page="/jsp/header/header.jsp"/>
          <div class="overlap">
            <div class="list">
              <div class="item">
                <p class="div">
                  <span class="text-wrapper">고객님의 문의에 답변하는 직원은 </span>
                  <span class="span">고객 여러분의 가족 중 한 사람일 수 있습니다.</span>
                </p>
                <div class="background"></div>
                <p class="p">
                  고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br />관련 법에 따라
                  수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.
                </p>
              </div>
              <div class="item-2">
                <div class="background"></div>
                <p class="text-wrapper-2">문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</p>
              </div>
            </div>
           <form action="Controller?type=inquirywrite" method="post">
           <div class="horizontal-border">
              <div class="table-body">
                <div class="row-3">
                  <div class="cell">
                    <p class="label"><span class="text-wrapper">제목 </span> <span class="text-wrapper-3">*</span></p>
                  </div>
                  <div class="data-3"><input type="text" class="input-5" name="title" data-str="제목" size="45"/></div>
                </div>
                <div class="row-4">
                  <div class="cell-2">
                    <p class="label-4"><span class="text-wrapper">내용 </span> <span class="text-wrapper-3">*</span></p>
                  </div>
                  <div class="border-wrapper">
                    <div class="border">
                       <label for="content" class="placeholder-label list-2">
                        - 문의내용에 개인정보(이름,연락처,카드번호 등)가 포함되지 않도록 유의하시기 바랍니다.<br />-
                        회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다.
                      </label>
                      <textarea name="content" class="textarea" cols="50" data-str="내용" 
                     id="content" rows="8"></textarea>
                      <div class="container-2"><div class="text-wrapper-5">0 / 2000</div></div>
                    </div>
                  </div>
                </div>
                <button type="button" class="button" onclick="sendData()"><div class="text-wrapper-6">등록</div></button>
              </div>
            </div>
<<<<<<< HEAD
         </form>
          </div>
=======
           </form>
          </div>

>>>>>>> 7a752cc29947dfde14c775ecab6b9b2bcdb9c259

          <div class="heading">1:1 문의</div>
          <div class="overlap-wrapper">
            <div class="overlap-2">
              <div class="link-8"><div class="text-wrapper-14">고객센터</div></div>
              <div class="overlap-group-wrapper">
                <div class="overlap-group-3">
                  <div class="item-link"><div class="text-wrapper-15"><a href="${pageContext.request.contextPath}/Controller?type=home">고객센터 홈</a></div></div>
                  <div class="item-link-2"><div class="text-wrapper-16"><a href="${pageContext.request.contextPath}/Controller?type=faq">자주 묻는 질문</a></div></div>
                  <div class="link-10"><div class="text-wrapper-17"><a href="${pageContext.request.contextPath}/Controller?type=notice">공지사항</a></div></div>
                  <div class="item-link-3">
                  <div class="text-wrapper-18">
<<<<<<< HEAD
                  <a href="${pageContext.request.contextPath}/jsp/serviceCenter/inquiry.jsp" id="my_11"><%--1:1 문의--%></a>
=======
                  <a href="Controller?type=sinquiry" id="my_10"><%--1:1 문의--%></a>
>>>>>>> 7a752cc29947dfde14c775ecab6b9b2bcdb9c259
                  </div>
                  </div>
                  <div class="link-11"><div class="text-wrapper-19"><a href="${pageContext.request.contextPath}/Controller?type=directions">오시는 길</a></div></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>   
   <script>
      function sendData(){
         let isValid = true;
         
      for(var i=0 ; i<document.forms[0].elements.length ; i++){
         var element = document.forms[0].elements[i];
          // 공백 제거
        if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA'){
           
          var trimmedValue = element.value.trim();

          if (trimmedValue === "") { // 공백 제거 후에도 비어있는지 확인
            element.value = "";   
            alert(element.dataset.str + "을 입력하세요");
            element.focus();
            isValid = false;
          }
        }
      }    

      if (!isValid) {
         location.href = "Controller?type=sinquiry";
        }else {
           document.forms[0].submit();
        }
   }
      
      const textarea = document.getElementById('content');
      const placeholderLabel = textarea.previousElementSibling;

      textarea.addEventListener('focus', () => {
        placeholderLabel.style.display = 'none';
        textarea.setSelectionRange(0, 0);
      });

      textarea.addEventListener('blur', () => {
        if (textarea.value === '') {
          placeholderLabel.style.display = 'block';
        }
      });
   </script>
    <jsp:include page="/jsp/footer/footer.jsp"/>
  </body>
</html>
