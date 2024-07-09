<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/admin/adminAddEventglobals.css" />
    <link rel="stylesheet" href="css/admin/adminAddEventstyle.css" />
  </head>
  <body>
    <div class="screen">
      <div class="overlap-group-wrapper">
        <div class="overlap-group">
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
            <form action="Controller?type=adminAddEvent" method="post" enctype="multipart/form-data">
            <div class="horizontal-border">
              <div class="table-body">
                <div class="row">
                  <div class="cell">
                    <p class="label">
                      <span class="span">이벤트/혜택 유형선택 </span> <span class="text-wrapper-2">*</span>
                    </p>
                  </div>
                  <div class="data">
                    <div class="button">
                      <select name="eventType" id="eventType" class="container">
                      <option value="3">이벤트</option>
                      <option value="4">혜택</option>
                    </select>
                    </div>
                   </div>
                    <!--
                    <select name="eventType" id="eventType" class="container">
                      <option value="3">이벤트</option>
                      <option value="4">혜택</option>
                    </select>
                      -->
                  
                </div>
                <div class="row-2">
                  <div class="cell">
                    <p class="p"><span class="span">제목 </span> <span class="text-wrapper-2">*</span></p>
                  </div>
                   <div class="input-wrapper"><input type="text" name="title" class="input" /></div>
                </div>
                <div class="row-3">
                  <div class="cell"><div class="label-2">첨부파일</div></div>

                  <div class="data">
                    <button class="input-2"><input type = "file" name="file"  class="text-wrapper-4"/></button>
                  	</div>
                </div>
                <div class="row-3-1">
                	<div class="cell"><div class="label-2-1">배너첨부파일</div></div>
                	<div class="data">
                	<button class="input-3"><input type = "file" name="file1" class="text-wrapper-4-1"/></button>
                 </div>
                </div>
                <div class="row-4">
                  <div class="label-wrapper">
                    <p class="label-3"><span class="span">내용 </span> <span class="text-wrapper-2">*</span></p>
                  </div>
                  <div class="border-wrapper">
                    <div class="border">
                        <textarea name="content" id="content" class="textarea" oninput="updateCharCount()" required></textarea>
                        <div class="container-2"><div id="char-count" class="text-wrapper-5"> 0 / 2000</div></div>
                      </div>
                  </div>
                </div>
              <button type="submit" class="button-2"
             onclick="return handleSubmit()" value="adminAddEvent"><div class="text-wrapper-6">등록</div></button>
                 <button class="button-3" id="list-link"><div class="text-wrapper-7">목록</div></button>
              </div>
            </div>
            </form>
            
            <div class="text-wrapper-8">이벤트/혜택 추가</div>
            <div class="heading">이벤트 관리</div>
          </div>
          <div class="div-sidebar">
            <img class="element" src="img/adminNotice/1.png" />
            <div class="text-wrapper-9">관리자</div>
            <div class="list-2">
              <div class="item-link"><div class="text-wrapper-10"><a href="Controller?type=adminMovieDb">영화관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-11"><a href="Controller?type=adminEvent">이벤트/혜택 관리</a></div></div>
              <div class="item-link-3"><div class="text-wrapper-12"><a href="Controller?type=adminCpHome">쿠폰관리</a></div></div>
              <div class="item-link-3"><div class="text-wrapper-12"><a href="Controller?type=adminNotice">고객센터 관리</a></div></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
    function handleSubmit() {
        alert("제출되었습니다");
        return true; // 폼 제출을 계속 진행
    }
    function updateCharCount() {
    	 var content = document.getElementById('content');
         var charCount = content.value.length;
         document.getElementById('char-count').textContent = charCount + " / 2000";
      }
    function ListClick() {
	    window.location.href = 'Controller?type=adminEvent';
	  }
    window.onload = function() {
        updateCharCount();
        document.getElementById('list-link').addEventListener('click',ListClick);
      }
    </script>
  </body>
</html>
