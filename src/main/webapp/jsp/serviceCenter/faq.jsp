<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>        
<!DOCTYPE html>
<html>
  <head> 
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/serviceCenter/faq_style.css" />
  </head>
  <body>
      <div class="overlap-header">
        <img class="overlay" src="${pageContext.request.contextPath}/img/serviceCenter/home/overlay.svg" />
       <jsp:include page="/jsp/header/header.jsp"/>
      </div>
    <div class="screen">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="container">
            <div class="overlap-group">
              <div class="div">
                <div class="overlap-2">
                  <jsp:include page="/jsp/footer/footer.jsp"/>
                  <div class="list">
                    <c:forEach items="${far}" var="faq" varStatus="vs">
					    <div class="item">
					        <div class="horizontal-border">
					            <div class="overlap-group-2">
					                <div class="link content" onclick="toggleAnswer('answer${vs.index}')">
					                    <div class="text-wrapper-2">Q.${faq.n_title}</div>
					                    <img class="image" src="${pageContext.request.contextPath}/img/serviceCenter/faq/image.png" />
					                </div>
					            </div>
					        </div>
					        <div class="paragraph-background title" id="answer${vs.index}" style="display: none;"> 
					            <div class="text-wrapper-7">A.${faq.n_content}</div> 
					        </div>
					    </div>
					</c:forEach>
                  </div>
                  <div class="strong">
                    <p class="element-2">
                      <span class="span">전체 </span>
                      <span class="text-wrapper-16">${cnt }</span>
                      <span class="span">건</span>
                    </p>
                  </div>
                </div>
                
                <div class="nav1">
		            <ol class="paging">
		           	 
					
						<c:set var="page" value="${requestScope.page}"/>
						
						<c:if test="${page.startPage < page.pagePerBlock }">
							<li class="disable">&lt;</li>
						</c:if>
					
						<c:if test="${page.startPage >= page.pagePerBlock }">
						
						<li><a href="Controller?type=faq&cPage=${page.nowPage-page.pagePerBlock }">&lt;</a></li>
						</c:if>
					
						<c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="vs">
						<c:if test="${vs.index eq page.nowPage }">
						<li class="now">${vs.index}</li>
					    </c:if> 
					    <c:if test="${vs.index ne page.nowPage }">
						<li><a href="Controller?type=faq&cPage=${vs.index}">${vs.index}</a></li>
						</c:if>
						</c:forEach>
					
					
						<c:if test="${page.endPage < page.totalPage }">
							
							<li><a href="Controller?type=faq&cPage=${page.nowPage+page.pagePerBlock}">&gt;</a></li>
						</c:if>
						
						<c:if test="${page.endPage > page.totalPage }">	
							<li class="disable">&gt;</li>
						</c:if>	
		
		              </ol>
		          </div>
                
                <div class="background">
                  <div class="overlap-3">
                    <div class="link-2"><div class="text-wrapper-17">고객센터</div></div>
                    <div class="list-2">
                      <div class="overlap-group-3">
                        <div class="item-link"><div class="text-wrapper-18"><a href="Controller?type=home">고객센터 홈</a></div></div>
                        <div class="item-link-2"><div class="text-wrapper-19"><a href="Controller?type=directions">오시는 길</a></div></div>
                        <div class="link-4"><div class="text-wrapper-20"><a href="Controller?type=notice">공지사항</a></div></div>
                        <div class="item-link-3"><div class="text-wrapper-21"><a href="Controller?type=faq"><%--자주 묻는 질문--%></a></div></div>
                        <div class="link-5"><div class="text-wrapper-22"><a href="Controller?type=sinquiry">1:1문의</a></div></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="heading">자주 묻는 질문</div>
              <div class="container-wrapper">
                <div class="container-2">
                  <div class="label">빠른검색</div>
                  <div class="border">
                     <form id="searchForm" action="Controller?type=faqsearch" method="post">
	                	<input type="text" name="n_title" class="text-wrapper-9" placeholder="검색어를 입력해 주세요."/>  
		           		 <button class="button"></button>
	           		 </form>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
    <script>
	    var originalMarginTops = {};
	    $(document).ready(function() {
	        $('.item').each(function() {
	            var $this = $(this);
	            originalMarginTops[$this.index()] = parseInt($this.css('margin-top'));
	        });
	    });
	
	    function toggleAnswer(answerId) {
	        // 현재 열려 있는 답변 찾기
	        var openAnswer = $('.paragraph-background.title:visible');
	
	        // 현재 열려 있는 답변이 있고, 클릭한 답변과 다를 경우 닫기
	        if (openAnswer.length && openAnswer.attr('id') !== answerId) {
	            openAnswer.slideUp(150, function() { // 애니메이션 속도 조정
	                var arrowImage = openAnswer.prev().find('.image');
	                arrowImage.removeClass('rotated');
	
	                var container = openAnswer.closest('.item');
	                var nextItem = container.next('.item');
	
	                if (nextItem.length > 0) {
	                    nextItem.css('margin-top', originalMarginTops[nextItem.index()] + 'px');
	                }
	            });
	        }
	
	        // 클릭한 답변 토글
	        var answer = $('#' + answerId);
	        answer.slideToggle(150, function () { 
	            var arrowImage = answer.prev().find('.image');
	            arrowImage.toggleClass('rotated');
	
	            var container = answer.closest('.item');
	            var nextItem = container.next('.item');
	
	            if (nextItem.length > 0) {
	                var originalMarginTop = originalMarginTops[nextItem.index()];
	                if (answer.is(':visible')) {
	                    nextItem.css('margin-top', (originalMarginTop + 150) + 'px');
	                } else {
	                    nextItem.css('margin-top', originalMarginTop + 'px');
	                }
	            }
	        });
	    }
    </script>
    
    
  </body>
</html>
