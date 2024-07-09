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
             <jsp:include page="/jsp/header/header.jsp"/>
          <div class="heading">오시는 길</div>
          <p class="text-wrapper">주소 : 서울 강남구 테헤란로 132 한독약품빌딩 8층 (우)06235</p>
          <div id="map"></div>
          <img class="img" src="${pageContext.request.contextPath}/img/serviceCenter/directions/image8.png" />
          <div class="background">
            <div class="overlap">
              <div class="link-8"><div class="text-wrapper-8">고객센터</div></div>
              <div class="list">
                <div class="overlap-group">
                  <div class="item-link"><div class="text-wrapper-9"><a href="Controller?type=home">고객센터 홈</a></div></div>
                  <div class="item-link-2"><div class="text-wrapper-10"><a href="Controller?type=faq">자주 묻는 질문</a></div></div>
                  <div class="link-10"><div class="text-wrapper-11"><a href="Controller?type=notice">공지사항</a></div></div>
                  <div class="item-link-3"><div class="text-wrapper-12"><a href="Controller?type=directions"><%--오시는 길--%></a></div></div>
<<<<<<< HEAD
                  <div class="link-11"><div class="text-wrapper-13"><a href="${pageContext.request.contextPath}/jsp/serviceCenter/inquiry.jsp" id="my_12">1:1문의</a></div></div>
=======
                  <div class="link-11"><div class="text-wrapper-13"><a href="Controller?type=sinquiry" id="my_7">1:1문의</a></div></div>
>>>>>>> 7a752cc29947dfde14c775ecab6b9b2bcdb9c259
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
	<jsp:include page="/jsp/footer/footer.jsp"/> 
  </body>
</html>
