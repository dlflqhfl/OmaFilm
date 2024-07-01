<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/serviceCenter/directions_style.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container-wrapper">
        <div class="container">
          <img class="footer" src="${pageContext.request.contextPath}/img/serviceCenter/directions/footer.png" />
          <div class="heading">오시는 길</div>
          <p class="text-wrapper">주소 : 서울 강남구 테헤란로 132 한독약품빌딩 8층 (우)06235</p>
          <div id="map"></div>
          <img class="img" src="${pageContext.request.contextPath}/img/serviceCenter/directions/image8.png" />
          <div class="frame">
            <div class="navbar">
              <div class="link"><div class="div">회원가입</div></div>
              <div class="div-wrapper"><div class="div">고객센터</div></div>
              <div class="link-2"><div class="text-wrapper-2">관리자</div></div>
              <div class="text-wrapper-3">로그인</div>
              <div class="link-3"><div class="div">빠른예매</div></div>
              <img class="link-4" src="${pageContext.request.contextPath}/img/serviceCenter/directions/link.png" />
              <img class="link-5" src="${pageContext.request.contextPath}/img/serviceCenter/directions/link-1.png" />
              <img class="link-6" src="${pageContext.request.contextPath}/img/serviceCenter/directions/link-2.png" />
              <div class="text-wrapper-4">예매</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-5">영화</div></a
              >
              <div class="text-wrapper-6">이벤트</div>
              <a href="www.naver.com" target="_blank" rel="noopener noreferrer"
                ><div class="text-wrapper-7">혜택</div></a
              >
              <img class="heading-link" src="${pageContext.request.contextPath}/img/serviceCenter/directions/heading-1-link.png" />
              <div class="link-7"></div>
            </div>
          </div>
          <div class="background">
            <div class="overlap">
              <div class="link-8"><div class="text-wrapper-8">고객센터</div></div>
              <div class="list">
                <div class="overlap-group">
                  <div class="item-link"><div class="text-wrapper-9"><a href="Controller?type=home">고객센터 홈</a></div></div>
                  <div class="item-link-2"><div class="text-wrapper-10"><a href="Controller?type=faq">자주 묻는 질문</a></div></div>
                  <div class="link-10"><div class="text-wrapper-11"><a href="Controller?type=notice">공지사항</a></div></div>
                  <div class="item-link-3"><div class="text-wrapper-12"><a href="Controller?type=directions"><%--오시는 길--%></a></div></div>
                  <div class="link-11"><div class="text-wrapper-13"><a href="Controller?type=sinquiry">1:1문의</a></div></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ef2e683e23a5e204a33006079a1d014"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		      mapOption = {
		          center: new kakao.maps.LatLng(37.49952572986776, 127.03308981345488), // 지도의 중심좌표
		          level: 3 // 지도의 확대 레벨
		      };  

		  var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치
		  var markerPosition  = new kakao.maps.LatLng(37.499285, 127.0332008); // 원하는 위도, 경도

		  // 마커 생성
		  var marker = new kakao.maps.Marker({
		      position: markerPosition // 마커 위치를 고정 좌표로 설정
		  });

		  // 마커 지도 위에 셋칭
		  marker.setMap(map);
		});
	</script>    
  </body>
</html>
