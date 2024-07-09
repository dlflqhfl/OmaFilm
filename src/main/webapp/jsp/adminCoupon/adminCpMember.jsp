<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html> 
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/adminCoupon/mem_globals.css" />
    <link rel="stylesheet" href="css/adminCoupon/mem_style.css" />
  </head>
  <body>
    <div class="div-wrapper">
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
            
            
            <select id="select" class="button-2">
			  <option value="u_code">회원 코드</option>
			  <option value="u_id">아이디</option>
			  <option value="u_name">이름</option>
			  <option value="u_birth">생년월일</option>
			  <option value="u_email">이메일</option>
			</select>
			
            <div class="heading">쿠폰 적용 회원</div>
            <div class="horizontal-border">
              <div class="table">
                <div class="header-row">
                  <div class="overlap-group">
                    <div class="cell"><div class="text-wrapper-5">회원코드</div></div>
                    <div class="cell-2"><div class="text-wrapper-5">아이디</div></div>
                  </div>
                  <div class="cell-3"><div class="text-wrapper-5">이름</div></div>
                  <div class="cell-4"><div class="text-wrapper-6">생년월일</div></div>
                  <div class="cell-5"><div class="text-wrapper-5">이메일</div></div>
                  <div class="cell-6"><input type="checkbox" id="all-check" class="text-wrapper-7"/></div>
                </div>
                <div class="body">
                	<c:set var="len" value="${fn:length(memlist)}" />
	                <c:if test="${page.end<=len}">
	                	<c:set var="end" value="${page.end}"/>
	                </c:if>
					<c:if test="${page.end>len}">
						<c:set var="end" value="${len}" />
					</c:if>
                	
                	<c:forEach var="i" begin="${page.begin}" end="${ end}" varStatus="status">
	                    <div class="row-${status.count}">
	                    	<c:set var="u_code" value="${String.valueOf(memlist[i-1].u_code) }" />
	                    	<c:if test="${ucodelist.contains(u_code)}">
	                    		<div class="rectangle-wrapper"><input type="checkbox" name="ck-box" value="${memlist[i-1].u_code }" class="rectangle" disabled checked/></div>
	                    	</c:if>
	                    	<c:if test="${!ucodelist.contains(u_code)}">
	                    		<div class="rectangle-wrapper"><input type="checkbox" name="ck-box" value="${memlist[i-1].u_code }" class="rectangle"/></div>
	                    	</c:if>
	                        <div class="data"><div class="text-wrapper-8">${memlist[i-1].u_code }</div></div>
	                        <c:if test="${ memlist[i-1].u_social == 1}">
	                        	<div class="data-3"><div class="text-wrapper-9">${memlist[i-1].u_id }</div></div>
	                        </c:if>
	                        <c:if test="${ memlist[i-1].u_social == 0}">
	                        	<div class="data-3"><div class="text-wrapper-9">소셜 로그인</div></div>
	                        </c:if>
		                    <div class="data-2"><div class="text-wrapper-8">${memlist[i-1].u_name }</div></div>
		                    <div class="data-4"><div class="text-wrapper-10">${memlist[i-1].u_birth }</div></div>
		                    <div class="data-5"><div class="text-wrapper-11">${memlist[i-1].u_email }</div></div>
		                </div>
                    </c:forEach>
                </div>
              </div>
              <div class="frame-2"><div class="text-wrapper-12">적용</div></div>
              <div class="frame-3"><div class="text-wrapper-13">취소</div></div>
            </div>
            
            
             <div class="nav">   <!-- 페이징 시작 -->
				<div>
					<ol class="paging">
						<c:if test="${page.startPage < page.pagePerBlock}">
							<li class="disable">&lt;</li>
						</c:if>
						<c:if test="${page.startPage >= page.pagePerBlock}">
							<li class=""><a
								href="Controller?type=adminCpMember&ci_code=${param.ci_code}&cPage=${page.nowPage - page.pagePerBlock}">&lt;</a></li>
						</c:if>
						<!-- <div class="nav"> -->
						<c:forEach begin="${page.startPage }" end="${page.endPage}" var="i">
							<c:if test="${i == page.nowPage}">
								<li class="now">${i}</li>
							</c:if>
							<c:if test="${i != page.nowPage}">
								<li class=" "><a
									href="Controller?type=adminCpMember&ci_code=${param.ci_code}&cPage=${i}">${i}</a></li>
							</c:if>
						</c:forEach>


						<c:if test="${page.endPage < page.totalPage}">
							<li class=""><a
								href="Controller?type=adminCpMember&ci_code=${param.ci_code}&ci_&cPage=${page.nowPage - page.pagePerBlock}">&gt;</a></li>
						</c:if>
						<c:if test="${page.endPage >= page.totalPage}">
							<li class=" disable">&gt;</li>
						</c:if>

					</ol>
				</div>
			</div>   <!-- 페이징 끝 -->
			
            <!-- <div class="nav">
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
            </div> -->
            
            <div class="border">
              <input type="text" class="input" placeholder="검색어를 입력해 주세요." />
              <button class="button-3">검색</button>
            </div>
            <div class="text-wrapper-16">총</div> 
            <p class="element"><span class="span">${fn:length(memlist) }</span> <span class="text-wrapper-17"> 명</span></p>
            
          </div>
          <div class="div-sidebar">
            <img class="element" src="img/adminMovie/1.png" />
            <div class="text-wrapper-19">관리자</div>
            <div class="list-2">
              <div class="item-link"><div class="text-wrapper-20"><a href="Controller?type=adminMovieDb">영화관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-21"><a href="Controller?type=adminEvent">이벤트/혜택 관리</a></div></div>
              <div class="item-link-3"><div class="text-wrapper-22"><a href="Controller?type=adminCpHome">쿠폰관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-23"><a href="Controller?type=adminNotice">고객센터 관리</a></div></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	  <script>
	  $(function(){
		  $(".button-3").click(function(){ //검색 버튼 클릭
		  		var value = $(".input").val().trim();
		  	    var searchType = $("#select").val();
		  	    console.log("검색어:", value);
		  	    console.log("검색타입:", searchType);
		  	  	location.href="Controller?type=adminCpMember&searchValue="+value+"&searchType="+searchType+"&ci_code=${param.ci_code}";
		  	});
		  
		  
			//tbody에 있는 모든 checkbox들 검색
			$('#all-check').click(function() {
				if ($('#all-check').is(':checked')) {
					$('input[type=checkbox]').prop('checked', true);
				} else {
					$('input[type=checkbox]').prop('checked', false);
				}
			});
			
			
			//체크된 정보를 가져와서 
			$('.frame-2').click(function() {
				var checked = $('input[name=ck-box]:checked:not(:disabled)');
			    var u_code = [];
			    checked.each(function(i) {
			        u_code.push($(this).val());
			    });
				    
			    var form = document.createElement('form');
			    
			    for (var i = 0; i < u_code.length; i++) {
			        var objs = document.createElement('input');
			        objs.setAttribute('type', 'hidden');
			        objs.setAttribute('name', 'insertU_code[]');
			        objs.setAttribute('value', u_code[i]);
			        form.appendChild(objs);
			    }

			    objs = document.createElement('input');
			   	objs.setAttribute('type', 'hidden');
			    objs.setAttribute('name', 'ci_code');
			    objs.setAttribute('value', ${param.ci_code});
			    form.appendChild(objs);
			    
			    form.setAttribute('method', 'post');
				form.setAttribute('action', 'Controller?type=adminCpMember');
				document.body.appendChild(form);
				form.submit();

			});
		});
	</script>
  </body>
</html>
