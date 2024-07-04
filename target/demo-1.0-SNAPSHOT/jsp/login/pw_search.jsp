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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pw_search.css" />
</head>
<body>
<div class="frame">
    <div class="background-wrapper">
        <div class="background">
            <div class="heading"><img class="link" src="https://c.animaapp.com/stWbIcl1/img/link@2x.png" /></div>
            <div class="container">
                <div class="text-wrapper">아이디/비밀번호 찾기</div>
                <div class="list-wrapper">
                    <div class="list">
                        <div class="overlap-group">
                            <div class="item">
                                <div class="div-wrapper"><a class="div" href="${pageContext.request.contextPath}/jsp/login/id_search.jsp">아이디찾기</a></div>
                            </div>
                            <div class="link-wrapper">
                                <div class="link-2"><div class="text-wrapper-2">비밀번호 찾기</div></div>
                            </div>
                            <div class="horizontal-divider"></div>
                        </div>
                    </div>
                </div>
                <div class="heading-2">간편찾기</div>
                <div class="overlap">
                    <p class="element">
                        <br/><br/>
                        ※ 가입한 이메일을 잊으신 고객께서는 고객센터에 문의 바랍니다
                    </p>
                    <div class="horizontal-border">
                        <button class="button" type="button">비밀번호 찾기</button>
                    </div>
                </div>
                <div class="table-body-wrapper">
                    <div class="table-body">
                        <div class="row">
                            <div class="cell"><div class="label">아이디</div></div>
                            <div class="data">
                                <input type="text" class="input" placeholder="아이디를 입력하세요"/>
                            </div>
                        </div>
                        <div class="row-2">
                            <div class="cell"><div class="label-2">이름</div></div>
                            <div class="data">
                                <input type="text" class="input" placeholder="이름을 입력하세요"/>
                            </div>
                        </div>
                        <div class="row-3">
                            <div class="cell"><div class="label-3">이메일</div></div>
                            <div class="data">
                                <input type="text" class="container-wrapper" placeholder="이메일을 입력하세요"/>
                                <button class="button-2">인증요청</button>
                            </div>
                        </div>
                        <div class="row-4">
                            <div class="label-wrapper"><div class="label-4">인증번호</div></div>
                            <div class="data-2">
                                <div class="background-border">
                                    <input type="text" class="input-2" placeholder="인증번호를 입력하세요"/>
                                    <div class="text-wrapper-8">3:00</div>
                                </div>
                                <button class="button-3">인증확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--제이쿼리 곧갑니다--%>
<script src="jquaery-3.6.0.min.js"></script>
<script>
    window.onload = function (){
        //인증요청 인증확인 비밀번호 찾기 다 막혀있고 색 변경
        const button = document.querySelector('.button');
    }
</script>
</body>
</html>
