<%--
  Created by IntelliJ IDEA.
  User: 무능호
  Date: 2024-06-28
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pw_update.css" />
</head>
<body>
<div class="frame">
    <div class="background-wrapper">
        <a class="background">
            <a href="${pageContext.request.contextPath}/Controller" class="heading"> <img class="link" src="https://c.animaapp.com/rgkaVLXU/img/link@2x.png" /></a>
            <div class="container">
                <div class="text-wrapper">비밀번호 재설정</div>
                <p class="div">보안인증이 완료되었습니다. 새로 사용하실 비밀번호를 입력해주세요.</p>
                <div class="text-wrapper-2">비밀번호는 3개월마다 변경해주세요</div>
                <p class="p">
                    비밀번호 변경시 로그인된 모든 디바이스에서 로그아웃됩니다. 변경 비밀번호로 다시 로그인 후 이용해주세요.
                </p>
                <p class="text-wrapper-3">
                    생년월일, 휴대폰번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 사용을 자제해 주세요
                </p>
                <div class="horizontal-border">
                    <button type="button" class="button">확인</button>
                </div>
                <div class="table-body-wrapper">
                    <div class="table-body">
                        <div class="row">
                            <div class="cell"><div class="label">아이디</div></div>
                            <div class="data">
                                <div class="input">
                                    <div class="div-wrapper"><div class="text-wrapper-5">아이디</div></div>
                                </div>
                            </div>
                        </div>
                        <div class="row-2">
                            <div class="cell"><div class="label-2">새 비밀번호</div></div>
                            <div class="data">
                                <div class="input">
                                    <div class="div-wrapper"><div class="text-wrapper-6">이름</div></div>
                                </div>
                            </div>
                        </div>
                        <div class="row-3">
                            <div class="cell"><div class="label-3">새 비밀번호 확인</div></div>
                            <div class="data">
                                <div class="container-wrapper">
                                    <div class="div-wrapper"><div class="text-wrapper-7">이메일을 입력하세요</div></div>
                                </div>
                                <div class="text-wrapper-8">일치하지 않음</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

