<%--
  Created by IntelliJ IDEA.
  User: 무능호
  Date: 2024-06-28
  Time: 오후 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/id_search.css"/>
</head>
<body>
<div class="frame">
    <div class="background-wrapper">
        <div class="background">
            <a class="heading" href="${pageContext.request.contextPath}/Controller"><img class="link"
                                                                                         src="https://c.animaapp.com/XlkazfSU/img/link@2x.png"/></a>
            <div class="container">
                <div class="text-wrapper">아이디/비밀번호 찾기</div>
                <div class="list-wrapper">
                    <div class="list">
                        <div class="overlap-group">
                            <div class="item">
                                <div class="div-wrapper">
                                    <div class="div">아이디 찾기</div>
                                </div>
                            </div>
                            <div class="link-wrapper">
                                <div class="link-2"><a
                                        href="${pageContext.request.contextPath}/jsp/login/pw_search.jsp">비밀번호 찾기</a>
                                </div>
                            </div>
                            <div class="horizontal-divider"></div>
                        </div>
                    </div>
                </div>
                <div class="heading-2">간편찾기</div>
                <p class="p">※ 가입한 이메일을 잊으신 고객께서는 고객센터에 문의 바랍니다.</p>
                <div class="horizontal-border">
                    <button type="button" class="button" onclick="serach_id()">아이디 찾기</button>
                </div>
                <div class="overlap">
                    <div class="table-body-wrapper">
                        <div class="table-body">
                            <div class="row">
                                <div class="cell">
                                    <div class="label">이름</div>
                                </div>
                                <div class="data">
                                    <input type="text" placeholder="이름을 입력하세요" class="input"/>
                                </div>
                            </div>
                            <div class="row-2">
                                <div class="label-wrapper">
                                    <div class="label-2">생년월일</div>
                                </div>
                                <div class="data-2">
                                    <input type="text" class="container-wrapper" placeholder="생년월일 앞8자리"/>
                                    <div class="text-wrapper-6">생년월일을 정확히 입력해주세요</div>
                                </div>
                            </div>
                            <div class="row-3">
                                <div class="cell">
                                    <div class="label-3">이메일</div>
                                </div>
                                <div class="data">
                                    <input type="text" placeholder="이메일을 입력하세요" class="input-2"/>
                                    <button type="button" class="button-2" onclick="submit()">인증요청</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row-4">
                        <div class="cell-2">
                            <div class="label-4">인증번호</div>
                        </div>
                        <div class="data-3">
                            <div class="background-border">
                                <input type="text" class="input-3" placeholder="인증번호를 입력하세요"/>
                                <div class="text-wrapper-9">3:00</div>
                            </div>
                            <button type="button" type="button" class="button-3">인증하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-overlay">
    <div class="modal">
        <div class="div">
            <button type="button" class="modal-button">확인</button>
            <div class="modal-header">
                <div class="text-wrapper-2">알림</div>
                <img class="multiply" src="https://c.animaapp.com/ScPQRqN0/img/multiply@2x.png"/>
            </div>
            <div class="txt-comon">
                <div class="id_search" id="modal_id_search"></div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var timer;

    window.onload = function () {
        //background-bordr 색 변경
        $(".background-border").css("background-color", "#f2f2f2");
        $(".input-3").prop("readonly", true);
        if ($(".input-3").prop("readonly") === true) {
            $(".input-3").css("outline", "none");
        }
        $(".input-3").css("background-color", "#f2f2f2");
        $(".button").prop("disabled", true);
    }

    //이름입력칸에 숫자가 들어가면 그 숫자가 지워지는 함수
    $(".input").on("keyup", function () {
        $(this).val($(this).val().replace(/[0-9]/g, ""));
    });
    //생년월일 입력칸에 글자(영어 한국어 포함)가 들어가면 지워지는 함수
    $(".container-wrapper").on("keyup", function () {
        $(this).val($(this).val().replace(/[^0-9]/g, ""));
    });
    //생년월일 경고문자 함수
    $(".container-wrapper").on("keyup", function () {
        if ($(this).val().length != 8) {
            $(".text-wrapper-6").css("display", "block");
        } else {
            $(".text-wrapper-6").css("display", "none");
        }
    });
    //이메일 입력칸에 한글 특수문자 들어가면 지워지는 함수
    $(".input-2").on("keyup", function () {
        $(this).val($(this).val().replace(/[^a-z0-9@._-]/g, ""));
    });

    //인증번호 보내는 함수 호출
    function submit() {
        var email = $(".input-2").val();
        var name = $(".input").val();
        //생일은 중간에 생년월일 사이에 -를 넣어서 보내줍니다.
        var birth = $(".container-wrapper").val().substring(0, 4) + "-" + $(".container-wrapper").val().substring(4, 6) + "-" + $(".container-wrapper").val().substring(6, 8);
        console.log(email)
        console.log(name)
        console.log(birth)
        // jQuery AJAX를 사용하여 서버에 이메일을 보냅니다.
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=send_email",
            data: {
                email: email
                , name: name
                , birth: birth
            },
            success: function (data) {
                data = data.trim();
                if (data === "1") {
                    //이메일이 전송 된 순간 타이머 작동
                    var time = 180;
                    timer = setInterval(function () {
                        var minutes = Math.floor(time / 60);
                        var seconds = time % 60;
                        $(".text-wrapper-9").text(minutes + ":" + (seconds < 10 ? "0" : "") + seconds);
                        if (time <= 0) {
                            clearInterval(timer);
                            alert("3분이 지났습니다. 인증번호를 다시 요청해주세요.");
                            $(".input-3").prop("readonly", true);
                            $(".background-border").css("background-color", "#f2f2f2");
                            $(".input-3").val("");
                            $(".input-3").css("background-color", "#f2f2f2");
                            $(".text-wrapper-9").css("display", "none");
                        }
                        time--;
                    }, 1000);
                    alert("이메일이 성공적으로 전송되었습니다.")
                    $(".input-3").prop("readonly", false);
                    $(".input-3").focus();
                    $(".input-3").css("background-color", "#ffffff");
                    $(".background-border").css("background-color", "#ffffff");
                    $(".text-wrapper-9").css("display", "block");
                } else if (data === "0") {
                    alert("올바르지 않은 이메일입니다.");
                    $(".input-2").val("");
                    $(".input-2").focus();
                }
            }
        });
    }

    //인증번호 확인 버튼을 눌렀을때 인증번호 검증 함수
    $(".button-3").on("click", function () {
        //만약 인증번호 칸이 막혔을때 버튼을 누르면 이메일을 입력하라는 경고창
        if ($(".input-3").prop("readonly") === true) {
            alert("이메일을 입력해주세요.");
            $(".input-2").focus();
            return;
        } else {
            if ($(".input-3").val() === "") {
                alert("인증번호를 입력해주세요.");
                $(".input-3").focus();
                return;
            }
        }
        var code = $(".input-3").val();
        console.log(code);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=check",
            data: {code_user: code},
            success: function (data) {
                var success = data.success;
                if (success === "1") {
                    $(".button").css("background-color", "#0e2128");
                    $(".button").css("color", "#ffffff");
                    $(".button").prop("disabled", false);
                    alert("인증이 완료되었습니다.");
                    $(".background-border").css("background-color", "#f2f2f2");
                    $(".input-3").prop("readonly", true);
                    $(".input-3").attr("placeholder", "인증이 완료되었습니다");
                    $(".input-3").css("background-color", "#f2f2f2");
                    $(".text-wrapper-9").css("display", "none");
                    clearInterval(timer);
                    sessionStorage.setItem("emailVerified", "true");
                } else if (success === "0") {
                    alert("인증번호가 유효하지 않습니다");
                    $(".input-3").val("");
                    $(".input-3").focus();
                }
            }
        });
    });

    /* 아이디 찾기를 누를때 호출되는 함수
    * 세션에 emailemailVerified가 있고 텍스트필드들에 빈칸이없으면 이름 생년월일 id를 통해 mvo객체를 받아와 모달창에 띄움*/
    function serach_id() {
        if (sessionStorage.getItem("emailVerified") === "true" || $(".input").val() === "" || $(".container-wrapper").val() === "" || $(".input-2").val() === "") {
            var name = $(".input").val();
            var birth = $(".container-wrapper").val().substring(0, 4) + "-" + $(".container-wrapper").val().substring(4, 6) + "-" + $(".container-wrapper").val().substring(6, 8);
            var email = $(".input-2").val();

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/Controller?type=search_id",
                data: {name: name, birth: birth, email: email},
                success: function (data) {
                    var id = data.id;
                    var date = data.join_date;
                    $("#modal_id_search").html("회원님의 아이디는 [" + id + "]입니다.<br>가입일: " + date);
                    $(".modal-overlay").css("display", "block");
                    $(".modal-overlay").css("pointer-events", "auto");
                }

            });
        } else {
            alert("이메일 인증을 먼저 해주세요.");
        }
    }

    $(".multiply").on("click", function () {
        $(".modal-overlay").css("display", "none");
        $(".modal-overlay").css("pointer-events", "none");  // 클릭 이벤트 무시
    });

    $(".modal-button").on("click", function () {
        sessionStorage.removeItem("emailVerified");
        $(".modal-overlay").css("display", "none");
        $(".modal-overlay").css("pointer-events", "none");  // 클릭 이벤트 무시
        location.href = "${pageContext.request.contextPath}/Controller?type=index";
    });


    $(".input-2").on("keyup", function () {
        if ($(".input-2").val() === "") {
            $(".button-2").css("background-color", "#f2f2f2");
            $(".button-2").css("color", "#000000");
            $(".button-2").prop("disabled", true);
        } else {
            $(".button-2").css("background-color", "#0e2128");
            $(".button-2").css("color", "#ffffff");
            $(".button-2").prop("disabled", false);
        }
    });

    $(".input-3").on("keyup", function () {
        if ($(".input-3").val().length === 6) {
            $(".button-3").css("background-color", "#0e2128");
            $(".button-3").css("color", "#ffffff");
            $(".button-3").prop("disabled", false);

        } else {
            $(".button-3").css("background-color", "#f2f2f2");
            $(".button-3").css("color", "#000000");
            $(".button-3").prop("disabled", true);
        }
    });

</script>
</body>
</html>

