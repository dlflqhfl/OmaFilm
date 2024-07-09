<%--
  Created by IntelliJ IDEA.
  User: dlflq
  Date: 2024-06-22
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>
<div class="login_2">
    <div class="div">로그인</div>
    <jsp:include page="../header/header.jsp"/>
    <button class="button"><div class="text-wrapper-8"><a href="login_1.jsp">회원</a></div></button>
    <button class="button-2"><div class="text-wrapper-9">비회원</div></button>
    <div class="overlap-group">
        <div class="form">
            <div class="input">
                <input type="text" id="name" name="name" class="text">
                <div class="text-wrapper-10">이름 :</div>
            </div>
            <div class="input-2">
                <input type="text" id="birth" name="birth" class="text-2">
                <div class="text-wrapper-11">생년월일 :</div>
            </div>
            <div class="input-3">
                <input type="email" id="email" name="email" class="text-3">
                <div class="text-wrapper-12">이메일 :</div>
            </div>
            <div class="input-4">
                <input type="password" id="password" name="password" class="text-4">
                <div class="text-wrapper-13">예매 비밀번호 :</div>
            </div>
        </div>
        <div class="submit" id="noReserverLogin"><div class="text-wrapper-15">로그인</div></div>
    </div>
    <div class="link-7"><div class="text-wrapper-16"><a href="register.jsp">회원가입</a></div></div>
</div>
<%@ include file="/jsp/footer/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#noReserverLogin").click(function(){
		let name = $("#name").val();
		let birth = $("#birth").val();
		let email = $("#email").val();
		let password = $("#password").val();
		$.ajax({
			url: "${pageContext.request.contextPath}/Controller?type=noReservationCheck" //호출하고자 하는 URL
			, type: "post" //요청 타입
			, data: {
				name : name,
				birth : birth,
				email : email,
				password : password
			}, //인자전달
			}).done(function(res){//서버로부터 전달되어오는 결과를 //인자로 받는다.
				if( res > 0){
					console.log("로그인성공")
					location.href="${pageContext.request.contextPath}/Controller?type=noReservationCheck&res=1";
				} else {
					console.log("로그인 실패")
					alert("입력하신 정보가 맞지 않습니다.")
				}
			});	
		});
})
</script>
</body>
</html>

