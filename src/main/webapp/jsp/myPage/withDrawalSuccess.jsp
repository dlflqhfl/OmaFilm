<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/withDrawalSuccess.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container">
		<jsp:include page="/jsp/header/header.jsp"/>
        <img class="line" src="${pageContext.request.contextPath}/img/myPage/withDrawalSuccess/line-3.svg" />
        <img class="image" src="${pageContext.request.contextPath}/img/myPage/withDrawalSuccess/image-19.png" />
        <div class="text-wrapper-8">회원탈퇴</div>
        <div class="text-wrapper-9">회원 탈퇴가 완료되었습니다</div>
        <div class="overlap-group">
          <p class="p">그동안 오마카세 시네마를 이용해 주셔서 감사합니다</p>
          <p class="text-wrapper-10">앞으로 더욱 좋은 모습으로 찾아뵙겠습니다</p>
          <div class="rectangle"></div>
          <a href="Controller?type=home"><button type="button" class="text-wrapper-11">첫 페이지로 돌아가기</button></a>
        </div>
      </div>
    </div>
    <jsp:include page="/jsp/footer/footer.jsp"/>
  </body>
</html>
