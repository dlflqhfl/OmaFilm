<%--
  Created by IntelliJ IDEA.
  User: dlflq
  Date: 2024-06-22
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />

</head>
<body>
<div class="container">
    <div class="div">로그인</div>
    <jsp:include page="/jsp/header/header.jsp"/>
    <span class="button"><div class="text-wrapper-8">회원</div></span>
    <span class="button-2"><div class="text-wrapper-9"><a href="login_2.jsp">비회원</a></div></span>
    <div class="link-7">
        <div class="text-wrapper-10">회원가입</div>
        <div class="vertical-divider"></div>
    </div>
    <c:if test="${not empty loginErrorMessage}">
    <script>
        alert("${loginErrorMessage}");
    </script>
    <% session.removeAttribute("loginErrorMessage"); %> 
	</c:if>
    <div class="overlap">
        <form class="form" id="login_form" name="login_form" action="../../Controller?type=login" method="post">
            <label class="text-wrapper-13" for="login_id">ID :</label>
            <input type="text" class="input" id="login_id" name="login_id" placeholder="아이디 또는 이메일을 입력해주세요"/>
            <div class="text-wrapper-14" for="login_pw">PW :</div>
            <input type="password" id="login_pw" class="container-wrapper" name="login_pw" placeholder="비밀번호를 입력해주세요"/>


            <label class="overlap-group"><input type="radio" id="remember_id" name="remember_id">아이디 저장</label>
            <button class="button-3" onclick="login()">로그인</button>
        </form>
    </div>
    <div class="link-8"><div class="text-wrapper-16">ID/PW 찾기</div></div>
    <img class="image" src="https://c.animaapp.com/s5cVxUlg/img/image-5@2x.png" />
    <img class="image-2" src="https://c.animaapp.com/s5cVxUlg/img/image-6@2x.png" />
</div>
<%@ include file="../footer/footer.jsp"%>
<%--jquery--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    /*로그인 버튼을 눌렀을때 폼객체를 컨트롤러로 보냄*/
    function login(){
        var id = $("#login_id").val();
        var pw = $("#login_pw").val();

        if(id == ""){
            alert("아이디를 입력해주세요");
            $("#login_id").focus();
            return;
        }
        if(pw == ""){
            alert("비밀번호를 입력해주세요");
            $("#login_pw").focus();
            return;
        }

        $("#login_form").submit();
    }

    window.onload = function(){<c:if test="${not empty errorMessage}">
        alert("${errorMessage}");
        $("#login_id").focus();
    </c:if>}
</script>
</body>
</html>

