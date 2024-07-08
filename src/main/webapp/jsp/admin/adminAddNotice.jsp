<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/admin/adminAddNoticeGlobals.css" />
    <link rel="stylesheet" href="css/admin/adminAddNoticeStyle.css" />
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
            <div class="heading">공지사항 등록</div>
            <form action="Controller?type=adminAddEvent" method="post">
            
            <div class="frame-2">
            <button type="submit" class="text-wrapper-2"
             onclick="return handleSubmit()" value="adminAddNotice">등록</button></div>
            <div class="frame-3" id="list-link"><div class="text-wrapper-3">목록</div></div>
            <div class="row">
              <div class="cell">
                <p class="label"><span class="span">제목 </span> <span class="text-wrapper-4">*</span></p>
              </div>
              <div class="overlap-group">
              <input type="text" class="input" name="title" required />
              </div>
            </div>
            <div class="row-2">
              <div class="label-wrapper">
                <p class="p"><span class="span">등록일 </span> <span class="text-wrapper-4">*</span></p>
              </div>
              <div class="data"><div class="input-2" id="current-date"></div></div>
            </div>
            <div class="row-3">
              <div class="cell-2">
                <p class="label-2"><span class="span">내용 </span> <span class="text-wrapper-4">*</span></p>
              </div>
              <div class="border-wrapper">
                <div class="border">
                  <textarea class="textarea" id="content" name="content" maxlength="2000" oninput="updateCharCount()" required></textarea>
                  <div class="container"><div class="text-wrapper-5" id="char-count"> 0 / 2000</div></div>
                </div>
              </div>
            </div>
            </form>
          </div>
          <div class="div-sidebar">
            <img class="element" src="img/adminNotice/1.png" />
            <div class="text-wrapper-6">관리자</div>
            <div class="list-2">
              <div class="item-link"><div class="text-wrapper-7"><a href="Controller?type=adminMovieDb">영화관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-8"><a href="Controller?type=adminEvent">이벤트/혜택 관리</a></div></div>
              <div class="item-link-2"><div class="text-wrapper-9"><a href="Controller?type=adminCpHome">쿠폰관리</a></div></div>
              <div class="item-link-3"><div class="text-wrapper-10"><a href="Controller?type=adminNotice">고객센터 관리</a></div></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <script>
    //등록시 alert 하기
    function handleSubmit() {
        alert("제출되었습니다");
        return true; // 폼 제출을 계속 진행
    }
      // 실시간 현재 날짜
      function setCurrentDate() {
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        today = yyyy + '-' + mm + '-' + dd;
        document.getElementById('current-date').textContent = today;
      }
      //입력 textarea값 실시간 변경
      function updateCharCount() {
          var content = document.getElementById('content');
          var charCount = content.value.length;
          document.getElementById('char-count').textContent = charCount + " / 2000";
        }
      function ListClick() {
    	    window.location.href = 'Controller?type=adminNotice';
    	  }
        window.onload = function() {
          setCurrentDate();
          updateCharCount();
          document.getElementById('list-link').addEventListener('click',ListClick);
        }
    </script>
  </body>
</html>
