<%--
  Created by IntelliJ IDEA.
  User: 무능호
  Date: 2024-06-21
  Time: 오전 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/login.css" />
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="screen">
    <div class="div">
        <%--<jsp:include page="../header/header.jsp" />--%>
        <div class="container">
            <img class="overlay" src="https://c.animaapp.com/MoX7t2wW/img/overlay.png" />
            <div class="heading">회원가입</div>
            <div class="text-wrapper">회원님의 정보를 정확히 입력해주세요.</div>
            <form class="form">
                <div class="regist">
                    <div class="name">
                        <div class="overlap-group">
                            <div class="div-2">
                                <input type="text" class="frame" placeholder="이름을 입력하세요"/>
                            </div>
                            <div class="div-wrapper"><div class="text-wrapper-3">이름</div></div>
                        </div>
                    </div>
                    <div class="birth">
                        <div class="overlap-group">
                            <div class="div-2">
                                <select class="year">
                                    <option>::년도::</option>
                                </select>
                                <select class="month">
                                    <option>::월::</option>
                                </select>
                                <select class="day">
                                    <option>::날짜::</option>
                                </select>
                                <div class="text-wrapper-7">년</div>
                                <div class="text-wrapper-8">월</div>
                                <div class="text-wrapper-9">일</div>
                            </div>
                            <div class="div-wrapper"><div class="text-wrapper-3">생년월일</div></div>
                        </div>
                    </div>
                    <div class="phone">
                        <div class="overlap-group">
                            <div class="div-2">
                                <input type="text" class="phnum_1" placeholder="010"></input>
                                <div class="text-wrapper-11">-</div>
                                <input type="text" class="phnum_2" placeholder="0000"></input>
                                <div class="text-wrapper-12">-</div>
                                <input type="text" class="phnum_3" placeholder="0000"></input>
                            </div>
                            <div class="div-wrapper"><div class="text-wrapper-3">휴대폰</div></div>
                        </div>
                    </div>
                    <div class="overlap">
                        <div class="esend">
                            <div class="overlap-group">
                                <div class="div-2">
                                    <div class="overlap-group-2">
                                        <label class="label" for="agree"><input type="radio" id="agree">동의</label>
                                    </div>
                                    <label class="label-2" for="disagree"><input type="radio" id="disagree">비동의</label>
                                </div>
                                <div class="div-wrapper"><div class="text-wrapper-14">이메일 수신 여부</div></div>
                            </div>
                        </div>
                        <div class="adress">
                            <input type="text" class="textfield"></input>
                            <input class="frame-7" placeholder="상세주소"></input>
                            <input type="text" class="adnum-textfield" placeholder="우편번호"></input>
                            <button class="adnum">우편번호</button>
                            <div class="adress-name"><div class="text-wrapper-3">주소</div></div>
                        </div>
                    </div>
                    <div class="email">
                        <div class="overlap-group">
                            <div class="div">
                                <input type="text" class="id" placeholder="이메일을 입력하세요"/>
                                <div class="text-wrapper-4">@</div>
                                <select class="ad">
                                <option>::선택하세요::</option>
                                <option>naver.com</option>
                                <option>gmail.com</option>
                                <option>daum.net</option>
                                <option>kakao.com</option>
                                <option>hanmail.net</option>
                                <option>nate.com</option>
                                </select>
                                <button class="button">전송하기</button>
                            </div>
                            <div class="email-name"><div class="text-wrapper-5">이메일</div></div>
                        </div>
                    </div>
                    <div class="overlap-2">
                        <div class="pw">
                            <input type="password" class="frame-8" placeholder="비밀번호를 입력하세요"></input>
                            <div class="frame-9"><div class="text-wrapper-3">비밀번호</div></div>
                        </div>
                        <div class="id">
                            <div class="overlap-group">
                                <div class="frame-10">
                                    <input type="text" class="frame-11" placeholder="아이디를 입력하세요"></text>
                                    <button type="button" class="button-5">중복확인</button>
                                </div>
                                <div class="frame-13"><div class="text-wrapper-3">아이디</div></div>
                            </div>
                        </div>
                        <div class="pw-check">
                            <div class="overlap-group">
                                <div class="div-2">
                                    <input type= "text" class="frame-8" placeholder="비밀번호 확인"></input>
                                    <div class="text-wrapper-20">일치함</div>
                                </div>
                                <div class="div-wrapper"><div class="text-wrapper-21">비밀번호 확인</div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="button-2"><div class="text-wrapper-22">가입</div></button>
                <button class="button-3"><div class="text-wrapper-23">취소</div></button>
                </form>
        </div>
    </div>
</div>
<%--<jsp:include page="../footer/footer.jsp"/>--%>
</body>
</html>
