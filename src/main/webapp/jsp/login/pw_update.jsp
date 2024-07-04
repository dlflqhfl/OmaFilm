<%--
  Created by IntelliJ IDEA.
  User: 무능호
  Date: 2024-06-28
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="background">
            <a href="${pageContext.request.contextPath}/Controller" class="heading"> <img class="link" src="https://c.animaapp.com/rgkaVLXU/img/link@2x.png" /></a>
            <div class="container">
                <div class="text-wrapper">비밀번호 재설정</div>
                <p class="div">보안인증이 완료되었습니다. 새로 사용하실 비밀번호를 입력해주세요.</p>
                <div class="text-wrapper-2">※ 비밀번호는 3개월마다 변경해주세요</div>
                <p class="p">
                    ※ 비밀번호 변경시 로그인된 모든 디바이스에서 로그아웃됩니다. 변경 비밀번호로 다시 로그인 후 이용해주세요.
                </p>
                <p class="text-wrapper-3">
                    ※ 생년월일, 휴대폰번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 사용을 자제해 주세요
                </p>
                <div class="horizontal-border">
                    <button type="button" class="button" onclick="pw_change()">비밀번호 변경</button>
                </div>
                <div class="table-body-wrapper">
                    <div class="table-body">
                        <div class="row">
                            <div class="cell"><div class="label">아이디</div></div>
                            <div class="data">
                                <div class="id"></div>
                            </div>
                        </div>
                        <div class="row-2">
                            <div class="cell"><div class="label-2">새 비밀번호</div></div>
                            <div class="data">
                                <input type="password" class="input" placeholder="새 비밀번호를 입력하세요"/>
                            </div>
                        </div>
                        <div class="row-3">
                            <div class="cell"><div class="label-3">새 비밀번호 확인</div></div>
                            <div class="data">
                                <input type="password" class="container-wrapper" placeholder="새 비밀번호를 재입력 하세요"/>
                                <div class="text-wrapper-8">일치하지 않음</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    window.onload = function() {
        var id = sessionStorage.getItem('id');
        var maskedId = id.slice(0, -4) + "****";
        document.querySelector('.id').innerText = maskedId;
        $('.button').attr('disabled', true);
    }

    // 비밀번호 일치 확인
    $('.container-wrapper').keyup(function() {
        var pw = $('.input').val();
        var pwCheck = $('.container-wrapper').val();
        if (pw === pwCheck) {
            $('.text-wrapper-8').css('display', 'block');
            //글자색 푸른색으로 변경 후 일치함 으로 텍스트 변경
            $('.text-wrapper-8').css('color', 'blue')
            $('.text-wrapper-8').text('일치함');
        } else if(pw === "" || pwCheck === "") {
            $('.text-wrapper-8').css('display', 'none');
        } else {
            $('.text-wrapper-8').css('display', 'block');
            //글자색 빨간색으로 변경 후 일치하지 않음 으로 텍스트 변경
            $('.text-wrapper-8').css('color', 'red')
            $('.text-wrapper-8').text('일치하지 않음');
        }
    });

    //일치함 일떄 확인 버튼 색 변경및 확인 버튼 활성화
    $('.container-wrapper').keyup(function() {
        if ($('.text-wrapper-8').text() === '일치함'){
            $('.button').css('background-color', '#0e2128');
            $('.button').css('color', 'white');
            $('.button').attr('disabled', false);
        } else {
            $('.button').css('background-color', '#d3d3d3');
            $('.button').css('color', 'black');
            $('.button').attr('disabled', true);
        }
    });
    function pw_change() {
        var pw = $('.input').val();
        var pwCheck = $('.container-wrapper').val();
        var pw_origin = sessionStorage.getItem('pw');
        var id = sessionStorage.getItem('id');

        if (pw === pwCheck) {
            if (pw === pw_origin) {
                alert('기존 비밀번호와 동일한 비밀번호는 사용할 수 없습니다.');
                return;
            }
            $.ajax({
                url: '${pageContext.request.contextPath}/Controller?type=pw_update',
                type: 'post',
                data: {
                    id: id,
                    pw: pw,
                    origin_pw: pw_origin,
                },
                success: function(data) {
                    data = data.trim();
                    if (data === '0') {
                        alert('비밀번호가 변경되었습니다.');
                        location.href = '${pageContext.request.contextPath}/jsp/login/login_1.jsp';
                    } else {
                        alert('비밀번호 변경에 실패했습니다.');
                    }
                }
            });
        } else {
            alert('비밀번호가 일치하지 않습니다.');
        }
    }
</script>
</body>
</html>