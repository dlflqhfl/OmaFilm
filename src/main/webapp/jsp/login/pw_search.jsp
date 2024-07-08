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
                        <button class="button" type="button" onclick="pw_update()">비밀번호 찾기</button>
                    </div>
                </div>
                <div class="table-body-wrapper">
                    <div class="table-body">
                        <div class="row">
                            <div class="cell"><div class="label">아이디</div></div>
                            <div class="data">
                                <input type="text" class="input" id="id" placeholder="아이디를 입력하세요"/>
                            </div>
                        </div>
                        <div class="row-2">
                            <div class="cell"><div class="label-2">이름</div></div>
                            <div class="data">
                                <input type="text" class="input" id="name" placeholder="이름을 입력하세요"/>
                            </div>
                        </div>
                        <div class="row-3">
                            <div class="cell"><div class="label-3">이메일</div></div>
                            <div class="data">
                                <input type="text" class="container-wrapper" placeholder="이메일을 입력하세요"/>
                                <button class="button-2" onclick="submit()">인증요청</button>
                            </div>
                        </div>
                        <div class="row-4">
                            <div class="label-wrapper"><div class="label-4">인증번호</div></div>
                            <div class="data-2">
                                <div class="background-border">
                                    <input type="text" class="input-2" placeholder="인증번호를 입력하세요"/>
                                    <div class="text-wrapper-8">3:00</div>
                                </div>
                                <button class="button-3" onclick="check()">인증확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--제이쿼리 곧갑니다--%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>

    var timer;

    window.onload = function (){
        //인증요청 인증확인 비밀번호 찾기 버튼 클릭 못하게 막혀있고 인증번호 입력란 비활성화 css 회색
        $(".button-2").attr("disabled", true);
        $(".button-3").attr("disabled", true);
        $(".input-2").attr("disabled", true);
        $('.button').attr("disabled", true);
        $(".input-2").css("background-color", "#f2f2f2");
        $(".background-border").css("background-color", "#f2f2f2");
    }

    $(".input-2").on("keyup", function (){
        if($(this).val().length === 6){
            $(".button-3").attr("disabled", false);
            $(".button-3").css("background-color", "#0e2128");
            $(".button-3").css("color", "#ffffff");
        }else{
            $(".button-3").attr("disabled", true);
            $(".button-3").css("background-color", "#f2f2f2");
            $(".button-3").css("color", "#000000");
        }
    });

    //이메일 입력칸에 글자가 들어갔을 때 이메일 전송 버튼 활성화 및 색상변경
    $(".container-wrapper").on("keyup", function (){
        if($(this).val() != ""){
            $(".button-2").attr("disabled", false);
            $(".button-2").css("background-color", "#0e2128");
            $(".button-2").css("color", "#ffffff");

        }else{
            $(".button-2").attr("disabled", true);
            $(".button-2").css("background-color", "#f2f2f2");
            $(".button-2").css("color", "#000000");
        }
    });

    //이메일 입력칸에 한글 특수문자 들어가면 지워지는 함수
    $(".container-wrapper").on("keyup", function () {
        $(this).val($(this).val().replace(/[^a-z0-9@._-]/g, ""));
    });

    //이름입력칸에 숫자및 특수문자 들어가면 지워지는 함수(영어는 가능)
    $("#name").on("keyup", function () {
        $(this).val($(this).val().replace(/[^a-zA-Z가-힣]/g, ""));
    });

    //아이디 입력칸에 특수문자 들어가면 지워지는 함수
    $("#id").on("keyup", function () {
        $(this).val($(this).val().replace(/[^a-z0-9]/g, ""));
    });

    //인증번호 보내는 함수
    function submit() {
        var email = $(".container-wrapper").val();
        var name = $("#name").val();
        var id = $("#id").val();
        //생일은 중간에 생년월일 사이에 -를 넣어서 보내줍니다.
        console.log(email)
        console.log(name)
        console.log(id)
        // jQuery AJAX를 사용하여 서버에 이메일을 보냅니다.
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=send_email",
            data: {
                email: email
                , name: name
                , id: id
            },
            success: function (data) {
                data = data.trim();
                console.log(data)
                if (data === "1") {
                    //이메일이 전송 된 순간 타이머 작동
                    var time = 180;
                    timer = setInterval(function () {
                        var minutes = Math.floor(time / 60);
                        var seconds = time % 60;
                        $(".text-wrapper-8").text(minutes + ":" + (seconds < 10 ? "0" : "") + seconds);
                        if (time <= 0) {
                            clearInterval(timer);
                            alert("3분이 지났습니다. 인증번호를 다시 요청해주세요.");
                            $(".input-2").attr("disabled", true);
                            $(".background-border").css("background-color", "#f2f2f2");
                            $(".input-2").val("");
                            $(".input-2").css("background-color", "#f2f2f2");
                            $(".text-wrapper-8").css("display", "none");
                        }
                        time--;
                    }, 1000);
                    alert("이메일이 성공적으로 전송되었습니다.")
                    $(".input-2").attr("disabled", false);
                    $(".input-2").focus();
                    $(".input-2").css("background-color", "#ffffff");
                    $(".background-border").css("background-color", "#ffffff");
                    $(".text-wrapper-8").css("display", "block");
                } else if (data === "0") {
                    alert("올바르지 않은 이메일입니다.");
                    $(".container-wrapper").val("");
                    $(".container-wrapper").focus();
                }
            }
        });
    }

    //인증번호 확인 함수
    function check() {
        //만약 인증번호 칸이 막혔을때 버튼을 누르면 이메일을 입력하라는 경고창
        if ($(".input-2").attr("disabled") === "disabled") {
            alert("이메일을 입력해주세요.");
            $(".container-wrapper").focus();
            return;
        }else if($(".input-2").val() === ""){
            alert("인증번호를 입력해주세요.");
            $(".input-2").focus();
            return;
        }
        var code = $(".input-2").val();
        console.log(code);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=check",
            data: {code_user: code},
            success: function (data) {
                var success = data.success;
                if (success === "1") {
                    alert("인증이 완료되었습니다");
                    clearInterval(timer);
                    $(".input-2").attr("disabled", true);
                    $(".input-2").attr("placeholder", "인증이 완료되었습니다.");
                    $(".input-2").css("background-color", "#f2f2f2");
                    $(".background-border").css("background-color", "#f2f2f2");
                    $(".button-3").attr("disabled", true);
                    $(".input-2").val("");
                    $(".text-wrapper-8").css("display", "none");
                    $(".button").attr("disabled", false);
                    $(".button").css("background-color", "#0e2128");
                    $(".button").css("color", "#ffffff");
                    sessionStorage.setItem("emailVerified", "true");
                } else if (success === "0") {
                    alert("인증번호가 유효하지 않습니다.");
                    $(".input-2").val("");
                    $(".input-2").focus();
                }
            }
        });
    }

    function pw_update() {
        //
        if (sessionStorage.getItem("emailVerified") === "true" || $(".container-wrapper").val() === "" || $(".input").val() === "") {
            var name = $("#name").val();
            var id = $("#id").val();
            var email = $(".container-wrapper").val();

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/Controller?type=search_id",
                data: {name: name, id: id, email: email},
                success: function (data) {
                    var id = data.id;
                    var pw = data.pw;
                    /*가져온 id와 비밀번호를 어트리뷰트에 저장후 pw_update 페이지로 이동*/
                    sessionStorage.setItem("id", id);
                    sessionStorage.setItem("pw", pw);
                    sessionStorage.removeItem("emailVerified")
                    location.href = "${pageContext.request.contextPath}/jsp/login/pw_update.jsp";
                }
            });
        } else {
            alert("이메일 인증을 먼저 해주세요.");
        }
    }

</script>
</body>
</html>
