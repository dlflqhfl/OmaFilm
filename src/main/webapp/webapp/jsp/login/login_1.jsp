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
    <link rel="stylesheet" href="/css/globals.css" />
    <link rel="stylesheet" href="/css/login.css" />

</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<div class="container">
    <div class="div">로그인</div>
    <jsp:include page="../header/header.jsp"/>
    <span class="button"><div class="text-wrapper-8">회원</div></span>
    <span class="button-2"><div class="text-wrapper-9"><a href="login_2.jsp">비회원</a></div></span>
    <div class="link-7">
        <div class="text-wrapper-10">회원가입</div>
        <div class="vertical-divider"></div>
    </div>
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
    <a href="javascript:kakao_login()"><img class="image" src="https://c.animaapp.com/s5cVxUlg/img/image-5@2x.png" id="kakao_login"/></a>
    <a href="javascript: naver_login()"><img class="image-2" src="https://c.animaapp.com/s5cVxUlg/img/image-6@2x.png" /></a>
</div>

<%@ include file="../footer/footer.jsp"%>
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
    /*=========================================================================*/
    /*카카오톡 이미지 클릭시 kakao()함수 호출하고 카카오 로그인 실행*/
    window.Kakao.init('54deeff9c26a36a95bf1373bd36aaddd');
    window.Kakao.isInitialized();
    /*카카오 로그인*/
    function kakao_login() {
        console.log("카카오 로그인")
        Kakao.Auth.login({
            success: function(authObj) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(response) {
                        var access_token = authObj.access_token;
                        var id = response.id;
                        var name = response.properties.nickname;
                        var profile_image = response.properties.profile_image;
                        var thumbnail_image = response.properties.thumbnail_image;
                        var email = response.kakao_account.email;


                        //만약 이 이메일과 연동된 db가 없으면 register.jsp로 이동
                        //만약 이 이메일과 연동된 db가 있으면 로그인 처리
                        $.ajax({
                            url: "../../Controller?type=social_login",
                            type: "post",
                            data: {
                                id: id,
                                email: email,
                                name: name,
                                profile_image: profile_image,
                                thumbnail_image: thumbnail_image,
                                token: access_token,
                            },
                            success: function(data) {
                                console.log(data);
                                if(data == 0){
                                    alert("가입하지 않은 이메일입니다")
                                    /*회원가입 페이지로 이동*/
                                    window.location.href = "/jsp/login/register.jsp";
                                }
                                else if(data == 1)
                                    /*등록된 이메일 경고창*/
                                    alert("이미 등록된 이메일입니다.");
                                else if(data == 2){
                                    /*로그인 성공*/
                                    alert("로그인 성공");
                                    location.href = "/Controller?type=index";
                                }
                            },
                            fail: function(error) {
                                console.log(error);
                            },
                        });
                    },
                    fail: function(error) {
                        console.log(error);
                    },
                });
            },
            fail: function(err) {
                console.log(err);
            },
        });
    }

    function naver_login(){
        var naver_id_login = new naver
        naver_id_login.init({
            client_id: "prTymuieNCdwFguuzeIa",
            callback_uri: "http://localhost:9090/jsp/login/login_1.jsp",
            isPopup: false,
            callBackHandle: true,
        });

        /*naver_id_login.getLoginStatus(function(status){
            if(status){
                //회원이름 연락처 이메일 주소 별명 생일 연령대 출생연도  휴대전화  토근 가져오기
                var email = naver_id_login.user.getEmail();
                var name = naver_id_login.user.getName();
                var id = naver_id_login.user.getId();
                var profile_image = naver_id_login.user.getProfileImage();
                var thumbnail_image = naver_id_login.user.getProfileImage();
                var token = naver_id_login.accessToken.accessToken;

                console.log(email);
                console.log(name);
                console.log(id);
                console.log(profile_image);
                console.log(thumbnail_image);
                console.log(token);


                $.ajax({
                    url: "../../Controller?type=social_login",
                    type: "post",
                    data: {
                        id: id,
                        email: email,
                        name: name,
                        profile_image: profile_image,
                        thumbnail_image: thumbnail_image,
                        token: token,
                    },
                    success: function(data) {
                        console.log(data);
                        if(data == 0){
                            alert("가입하지 않은 이메일입니다")
                            /!*회원가입 페이지로 이동*!/
                            window.location.href = "/jsp/login/register.jsp";
                        }
                        else if(data == 1)
                            /!*등록된 이메일 경고창*!/
                            alert("이미 등록된 이메일입니다.");
                        else if(data == 2){
                            /!*로그인 성공*!/
                            alert("로그인 성공");
                            location.href = "/Controller?type=index";
                        }
                    },
                    fail: function(error) {
                        console.log(error);
                    },
                });
            }
        });*/
    }
</script>
</body>
</html>

