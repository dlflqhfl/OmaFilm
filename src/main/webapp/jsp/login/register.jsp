<%--
  Created by IntelliJ IDEA.
  User: 무능호
  Date: 2024-06-21
  Time: 오전 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../../css/globals.css" />
    <link rel="stylesheet" href="../../css/register.css" />

</head>
<body>
<div class="screen">
    <div class="div">
        <div class="overlap">
            <div class="container">
                <img class="overlay" src="https://c.animaapp.com/BnU3osMX/img/overlay.png" />
                <div class="heading">회원가입</div>
                <div class="text-wrapper">회원님의 정보를 정확히 입력해주세요.</div>
                <div class="form">
                    <div class="regist">
                        <div class="name">
                            <div class="overlap-group">
                                <div class="div-2">
                                    <input type="text" class="frame" id="name" name="name" placeholder="이름을 입력하세요"/>
                                </div>
                                <div class="div-wrapper"><div class="text-wrapper-3">이름</div></div>
                            </div>
                        </div>
                        <div class="birth">
                            <div class="overlap-group">
                                <div class="div-2">
                                    <select class="frame-2" id="year" name="year">
                                        <option>::년도::</option>
                                        <% for(int i = 2024; i >= 1900; i--) { %>
                                        <option><%= i %></option>
                                        <% } %>
                                    </select>
                                    <select class="frame-3" id="month" name="month">
                                        <option>::월::</option>
                                        <c:forEach var="i" begin="1" end="12">
                                            <option>${i}</option>
                                        </c:forEach>
                                    </select>
                                    <select class="frame-4" id="day" name="day">
                                        <option>::일::</option>
                                        <c:forEach var="i" begin="1" end="31">
                                            <option>${i}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="text-wrapper-7">년</div>
                                    <div class="text-wrapper-8">월</div>
                                    <div class="text-wrapper-9">일</div>
                                </div>
                                <div class="div-wrapper"><div class="text-wrapper-3">생년월일</div></div>
                            </div>
                        </div>
                        <div class="overlap-2">
                            <div class="phone">
                                <div class="overlap-group">
                                    <div class="div-2">
                                        <input type="text" class="select" placeholder="010" id="phone_1" name="phone_1"/>
                                        <div class="text-wrapper-11">-</div>
                                        <input type="text" class="frame-5" placeholder="0000" id="phone_2" name="phone_2"/>
                                        <div class="text-wrapper-12">-</div>
                                        <input type="text" class="frame-6" placeholder="0000" id="phone_3" name="phone_3"/>

                                    </div>
                                    <div class="div-wrapper"><div class="text-wrapper-3">휴대폰</div></div>
                                </div>
                            </div>
                            <div class="esend">
                                <div class="overlap-group">
                                    <div class="div-2">
                                        <label class="overlap-group-2"><input type="radio"/>동의</label>
                                        <label class="label-2"><input type="radio"/>비동의</label>
                                    </div>
                                    <div class="div-wrapper"><div class="text-wrapper-14">이메일 수신 여부</div></div>
                                </div>
                            </div>
                            <div class="adress">
                                <input type="text" class="textfield" id="addr_1" name="addr_1"/>
                                <input type="text" class="frame-7" id="addr_2" name="addr_2" placeholder="상세주소"/>
                                <input type="text" class="adnum-textfield" id="addr_num" name="addr_num" placeholder="우편번호"/>
                                <button class="adnum">우편번호</button>
                                <div class="adress-name"><div class="text-wrapper-3">주소</div></div>
                            </div>
                            <div class="email">
                                <div class="overlap-3">
                                    <div class="email_1">
                                        <input type="text" class="frame_1" placeholder="아이디" id="email_1"/>
                                        <div class="text-wrapper-3_1">@</div>
                                        <select class="select_1" id="email_2" name="email_2">
                                            <option>naver.com</option>
                                            <option>daum.net</option>
                                            <option>gmail.com</option>
                                            <option>hanmail.net</option>
                                            <option>nate.com</option>
                                            <option id="self">직접입력</option>
                                        </select>
                                        <input type="text" class="frame_2" placeholder="직접입력" id="email_3" name="email_2"  display="none"/>
                                        <button class="button_1">전송하기</button>
                                    </div>
                                    <div class="email-check">
                                        <button class="button_2">확인</button>
                                        <input type="text" class="text_2" id="check_num" name="check_num" placeholder="인증번호 확인"/>
                                        <div class="div_2">일치함</div>
                                    </div>
                                    <div class="email-name"><div class="text-wrapper-18">이메일</div></div>
                                </div>
                            </div>
                        </div>
                        <div class="overlap-4">
                            <div class="pw">
                                <div class="frame-8"><div class="text-wrapper-2">78910</div></div>
                                <div class="frame-9"><div class="text-wrapper-3">비밀번호</div></div>
                            </div>
                            <div class="id">
                                <div class="overlap-group">
                                    <div class="frame-10">
                                        <div class="frame-11"><div class="text-wrapper-2">qweasd</div></div>
                                        <div class="frame-12"><div class="text-wrapper-19">중복확인</div></div>
                                        <div class="text-wrapper-20">중복 없음</div>
                                    </div>
                                    <div class="frame-13"><div class="text-wrapper-3">아이디</div></div>
                                </div>
                            </div>
                            <div class="pw-check">
                                <div class="overlap-group">
                                    <div class="div-2">
                                        <div class="frame-8"><div class="text-wrapper-21">78910</div></div>
                                        <div class="text-wrapper-22">일치함</div>
                                    </div>
                                    <div class="div-wrapper"><div class="text-wrapper-23">비밀번호 확인</div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="button"><div class="text-wrapper-24">가입</div></button>
                    <button class="button-2"><div class="text-wrapper-25">취소</div></button>
                </div>
            </div>
            <jsp:include page="../header/header.jsp" />
            <jsp:include page="../footer/footer.jsp" />
        </div>
    </div>
</div>

</body>
</html>
