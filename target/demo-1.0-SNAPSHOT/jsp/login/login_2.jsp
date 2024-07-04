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
                <div class="text"></div>
                <div class="text-wrapper-10">이름 :</div>
            </div>
            <div class="input-2">
                <div class="text-2"></div>
                <div class="text-wrapper-11">생년월일 :</div>
            </div>
            <div class="input-3">
                <div class="text-3"></div>
                <div class="text-wrapper-12">휴대폰 번호 :</div>
            </div>
            <div class="input-4">
                <div class="text-4"></div>
                <div class="text-wrapper-13">예매 비밀번호 :</div>
            </div>
            <div class="input-5">
                <div class="text-wrapper-14">예매 비밀번호 확인 :</div>
                <div class="text-5"></div>
            </div>
        </div>
        <div class="submit"><div class="text-wrapper-15">로그인</div></div>
    </div>
    <div class="link-7"><div class="text-wrapper-16"><a href="register.jsp">회원가입</a></div></div>
</div>
<%@ include file="/jsp/footer/footer.jsp"%>
</body>
</html>

