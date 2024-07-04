<%--
  Created by IntelliJ IDEA.
  User: 무능호
  Date: 2024-06-21
  Time: 오전 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css"/>
</head>
<body>
<script>
    /*소셜로 회원가입창으로 이동했을 경우*/

    window.onload = function () {
        <%
            String id = (String) session.getAttribute("social_id");
            String name = (String) session.getAttribute("social_name");
            String email = (String) session.getAttribute("social_email");
            String birth_year = (String) request.getAttribute("birth_year");
            String birth_month = (String) request.getAttribute("birth_month");
            String birth_day = (String) request.getAttribute("birth_day");
            String mobile = (String) request.getAttribute("mobile");
            System.out.println(id);
            System.out.println(name);
            System.out.println(email);
            System.out.println(birth_year);
            System.out.println(birth_month);
            System.out.println(birth_day);
            System.out.println(mobile);
        %>

        var id= "<%=id%>";
        var name = "<%=name%>";
        var email = "<%=email%>";
        var birth_year = "<%=birth_year%>";
        var birth_month = "<%=birth_month%>";
        var birth_day = "<%=birth_day%>";
        var mobile = "<%=mobile%>";


        console.log(id);
        console.log(name);
        console.log(email);

        //아이디 이름 이메일이 존재하고 널이 아닐떄만 뜨는 함수
        if (id && name && email && id != "null" && name != "null" && email != "null") {
            $('#id').val(id).prop('readonly', true);
            $('#name').val(name).prop('readonly', true);
            $('#email_1').val(email.split('@')[0]).prop('readonly', true);
            var domain = email.split('@')[1];
            var match = false;
            $('#email_2 option').each(function () {
                if (this.value == domain) {
                    match = true;
                    return false; // loop를 중단합니다.
                }
            });
            $('#email_2').val(domain);
            $('#email_2').prop('disabled', true);
            $('.button_1').hide();
            $('.button_2').hide();
            $('.text_2').hide();

            $('#id').css('background-color', '#f0f0f0');
            $('#name').css('background-color', '#f0f0f0');
            $('#email_1').css('background-color', '#f0f0f0');
            $('#email_2').css('background-color', '#f0f0f0');
            $('#email_3').css('background-color', '#f0f0f0');
            $('#id_check').hide();
        }

        if (birth_year && birth_month && birth_day && birth_year != "null" && birth_month != "null" && birth_day != "null") {
            $('#year').val(birth_year).prop('disabled', true);
            $('#month').val(birth_month).prop('disabled', true);
            $('#day').val(birth_day).prop('disabled', true);
            mobile = mobile.split('-');
            $('#phone_1').val(mobile[0]).prop('readonly', true);
            $('#phone_2').val(mobile[1]).prop('readonly', true);
            $('#phone_3').val(mobile[2]).prop('readonly', true);

            $('#phone_1').css('background-color', '#f0f0f0');
            $('#phone_2').css('background-color', '#f0f0f0');
            $('#phone_3').css('background-color', '#f0f0f0');
            $('#year').css('background-color', '#f0f0f0');
            $('#month').css('background-color', '#f0f0f0');
            $('#day').css('background-color', '#f0f0f0');
        }
    };
</script>
<div class="screen">
    <div class="div">
        <div class="overlap">
            <div class="container">
                <img class="overlay" src="https://c.animaapp.com/BnU3osMX/img/overlay.png"/>
                <div class="heading">회원가입</div>
                <div class="text-wrapper">회원님의 정보를 정확히 입력해주세요.</div>
                <div class="form">
                    <div class="regist">
                        <div class="name">
                            <div class="overlap-group">
                                <div class="div-2">
                                    <input type="text" class="frame" id="name" name="name" placeholder="이름을 입력하세요"/>
                                </div>
                                <div class="div-wrapper">
                                    <div class="text-wrapper-3">이름</div>
                                </div>
                            </div>
                        </div>
                        <div class="birth">
                            <div class="overlap-group">
                                <div class="div-2">
                                    <select class="frame-2" id="year" name="year">
                                        <option>::년도::</option>
                                        <% for (int i = 2024; i >= 1900; i--) { %>
                                        <option><%= i %>
                                        </option>
                                        <% } %>
                                    </select>
                                    <select class="frame-3" id="month" name="month">
                                        <option>::월::</option>
                                        <c:forEach var="i" end="12" begin="1">
                                            <option><fmt:formatNumber value="${i}" pattern="00"/></option>
                                        </c:forEach>
                                    </select>
                                    <select class="frame-4" id="day" name="day">
                                        <option>::일::</option>
                                        <c:forEach var="i" begin="1" end="31">
                                            <option><fmt:formatNumber value="${i}" pattern="00"/></option>
                                        </c:forEach>
                                    </select>
                                    <div class="text-wrapper-7">년</div>
                                    <div class="text-wrapper-8">월</div>
                                    <div class="text-wrapper-9">일</div>
                                </div>
                                <div class="div-wrapper">
                                    <div class="text-wrapper-3">생년월일</div>
                                </div>
                            </div>
                        </div>
                        <div class="overlap-2">
                            <div class="phone">
                                <div class="overlap-group">
                                    <div class="div-2">
                                        <input type="text" class="select" placeholder="010" id="phone_1"
                                               name="phone_1"/>
                                        <div class="text-wrapper-11">-</div>
                                        <input type="text" class="frame-5" placeholder="0000" id="phone_2"
                                               name="phone_2"/>
                                        <div class="text-wrapper-12">-</div>
                                        <input type="text" class="frame-6" placeholder="0000" id="phone_3"
                                               name="phone_3"/>

                                    </div>
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-3">휴대폰</div>
                                    </div>
                                </div>
                            </div>
                            <div class="esend">
                                <div class="overlap-group">
                                    <div class="div-2">
                                        <label class="overlap-group-2"><input type="checkbox" id="agree" name="agree"/>동의</label>
                                        <label class="label-2"><input type="checkbox" id="disagree"
                                                                      name="agree"/>비동의</label>
                                    </div>
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-14">이메일 수신 여부</div>
                                    </div>
                                </div>
                            </div>
                            <div class="adress">
                                <input type="text" class="textfield" id="addr_1" name="addr_1"/>
                                <input type="text" class="frame-7" id="addr_2" name="addr_2" placeholder="상세주소"/>
                                <input type="text" class="adnum-textfield" id="addr_num" name="addr_num"
                                       placeholder="우편번호"/>
                                <button type="button" class="adnum" onclick="address()">우편번호</button>
                                <div class="adress-name">
                                    <div class="text-wrapper-3">주소</div>
                                </div>
                            </div>
                            <div class="email">
                                <div class="overlap-3">
                                    <div class="email_1">
                                        <input type="text" class="frame_1" placeholder="이메일" id="email_1"
                                               name="email_1"/>
                                        <div class="text-wrapper-3_1">@</div>
                                        <select class="select_1" id="email_2" name="email_2">
                                            <option>naver.com</option>
                                            <option>daum.net</option>
                                            <option>gmail.com</option>
                                            <option>hanmail.net</option>
                                            <option>nate.com</option>
                                            <option id="self">직접입력</option>
                                        </select>
                                        <input type="text" class="frame_2" placeholder="직접입력" id="email_3"
                                               name="email_2" display="none"/>
                                        <button type="button" class="button_1" onclick="submit()">전송하기</button>
                                    </div>
                                    <div class="email-check">
                                        <button type="button" class="button_2" onclick="check()">확인</button>
                                        <input type="text" class="text_2" id="check_num" name="check_num"
                                               placeholder="인증번호 확인"/>
                                        <div class="div_2">일치함</div>
                                    </div>
                                    <div class="email-name">
                                        <div class="text-wrapper-18">이메일</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="overlap-4">
                            <div class="pw">
                                <input type="password" class="frame-8" id="pw" name="pw" placeholder="비밀번호를 입력하세요"/>
                                <div class="frame-9">
                                    <div class="text-wrapper-3">비밀번호</div>
                                </div>
                            </div>
                            <div class="id">
                                <div class="overlap-group">
                                    <div class="frame-10">
                                        <input type="text" class="frame-11" id="id" name="id" placeholder="아이디를 입력하세요"/>
                                        <button type="button" class="frame-12" id="id_check">중복확인</button>
                                        <div class="text-wrapper-20" id="overlap">중복 없음</div>
                                    </div>
                                    <div class="frame-13">
                                        <div class="text-wrapper-3">아이디</div>
                                    </div>
                                </div>
                            </div>
                            <div class="pw-check">
                                <div class="overlap-group">
                                    <div class="div-2">
                                        <input type="password" class="frame-8" id="pw_check" name="pw_check"
                                               placeholder="비밀번호 확인"/>
                                        <div class="text-wrapper-22">일치함</div>
                                    </div>
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-23">비밀번호 확인</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="button" id="submit" name="submit" onclick="regist()">가입</button>
                    <button type="button" class="button-2">
                        <div class="text-wrapper-25"><a href="${pageContext.request.contextPath}/Controller">취소</a></div>
                    </button>
                </div>
            </div>
            <jsp:include page="../header/header.jsp"/>
            <jsp:include page="../footer/footer.jsp"/>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 서브밋 함수를 통해 이메일을 합쳐서 SendAction으로 보내준다.
    function submit() {
        var email_1 = $('#email_1').val();
        var email_2 = $('#email_2').val();
        var email_3 = $('#email_3').val();
        var email = email_1 + '@' + email_2;
        if (email_2 == '직접입력') {
            email = email_1 + '@' + email_3;
        }

        //유효성 검사
        if (email_1 == "" || email_2 == "") {
            alert("이메일을 입력해주세요.");
            return;
        }


        // jQuery AJAX를 사용하여 서버에 이메일을 보냅니다.
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=send",
            data: {email: email},
            success: function (data) {
                data = data.trim();
                if (data === "0") {
                    alert("이메일이 성공적으로 전송되었습니다.");

                    setTimeout(function () {
                        alert("3분이 지났습니다. 인증번호를 다시 요청해주세요.");
                    }, 3 * 60 * 1000);
                }else if (data === "1") {
                    alert("가입된 이메일입니다.");
                    location.href = "${pageContext.request.contextPath}/jsp/login/login_1.jsp";
                }
            }
        });
    }

    // 인증번호 확인 함수 전제 조건은 3분타이머 이내에 인증번호를 받아야한다
    // 인증번호가 일치하면 일치함을 띄움
    // 인증번호가 불일치하면 불일치를 띄움
    function check() {
        var code = $("#check_num").val();
        console.log(code);

        //유효성 검사
        if (check_num == "") {
            alert("인증번호를 입력해주세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=check",
            data: {code_user: code},
            success: function (response) {
                var success = response.success;
                console.log(success)
                if (success === "1") {
                    alert("인증번호가 일치합니다.");
                    //인증 성공 상태를 세션에
                    sessionStorage.setItem("emailVerified", "true");
                } else if (success === "0") {
                    alert("인증번호가 일치하지 않거나 인증번호가 만료되었습니다.");
                } else {
                    alert("인증번호를 다시 요청해주세요.");
                }
            }
        });
    }

    // 이메일 도메인 선택시 직접입력을 선택하면 입력창이 나타나게 한다.
    $(document).ready(function () {
        $('#email_2').change(function () {
            if ($('#email_2').val() == '직접입력') {
                $('#email_3').show();
            } else {
                $('#email_3').hide();
                $(this).show();
            }
        });
    });

    /*id 중복검사*/
    $('#id_check').click(function () {
        var id = $('#id').val();

        // 결과 메시지 초기화
        $('#overlap').text('').hide();

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=idCheck",
            data: {id: id},
            success: function (response) {
                var cnt = response;
                console.log(cnt);
                if (cnt == 0) {
                    $('#overlap').text('중복 없음').css('color', 'blue').show();
                } else {
                    $('#overlap').text('중복됨').css('color', 'red').show();
                }
            }
        });
    });

    //체크박스 버튼 중첩 클릭 안되게
    $(document).ready(function () {
        $('input[type="checkbox"]').on('change', function () {
            var name = $(this).attr('name');
            if ($(this).is(':checked')) {
                $('input[name="' + name + '"]').not(this).prop('checked', false);
            }
        });
    });

    //비밀번호 확인
    $('#pw_check').keyup(function () {
        var pw = $('#pw').val();
        var pw_check = $('#pw_check').val();
        if (pw == pw_check) {
            $('.text-wrapper-22').text('일치함').css('color', 'blue').show();
        } else {
            $('.text-wrapper-22').text('일치하지 않음').css('color', 'red').show();
        }
    });

    function address() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    addr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                }
                document.getElementById('addr_num').value = data.zonecode;
                document.getElementById('addr_1').value = addr;
            }
        }).open();
    }

    //가입 버튼을 누르면 폼의 정보를 서버로 보내준다.
    function regist() {
        var name = $('#name').val();
        var year = $('#year').val();
        var month = $('#month').val();
        var day = $('#day').val();
        var phone_1 = $('#phone_1').val();
        var phone_2 = $('#phone_2').val();
        var phone_3 = $('#phone_3').val();
        var phone = phone_1 + '-' + phone_2 + '-' + phone_3;
        var addr_1 = $('#addr_1').val();
        var addr_2 = $('#addr_2').val();
        var addr_num = $('#addr_num').val();
        var email_1 = $('#email_1').val();
        var email_2 = $('#email_2').val();
        var email_3 = $('#email_3').val();
        var u_social = "0";
        //session에 name과 id 토큰 이메일이 있을 때 u_social을 1로 바꿔준다.
        <%
            if (session.getAttribute("social_id") != null && session.getAttribute("social_name") != null && session.getAttribute("social_email") != null) {
        %>
        u_social = "1";
        <%
            }
        %>

        var email = email_1 + '@' + email_2;
        if (email_2 == '직접입력') {
            email = email_1 + '@' + email_3;
        }
        var pw = $('#pw').val();
        var id = $('#id').val();
        var agree = 0;
        if ($('#agree').is(':checked')) {
            agree = 1;
        }

        //유효성 검사 각자 따로
        // 소셜 로그인()일 경우 이 경고창들 생략

        <%
            if (session.getAttribute("token") == null && session.getAttribute("social_id") == null && session.getAttribute("social_name") == null && session.getAttribute("social_email") == null) {
        %>

        if (id == "") {
            alert("아이디를 입력해주세요.");
            return;
        }

        if ($('#overlap').text() == '중복됨') {
            alert("아이디 중복확인을 해주세요.");
            return;
        }

        if (name == "") {
            alert("이름을 입력해주세요.");
            return;
        }

        if (sessionStorage.getItem("emailVerified") !== "true") {
            alert("이메일 인증을 완료해주세요.");
            return;
        }

        if (email_1 == "" || email_2 == "") {
            alert("이메일을 입력해주세요.");
            return;
        }
        <%
            }
        %>
        if (pw == "") {
            alert("비밀번호를 입력해주세요.");
            return;
        }

        if ($('#pw_check').val() == "") {
            alert("비밀번호 확인을 입력해주세요.");
            return;
        }

        if (pw != $('#pw_check').val()) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }

        if (year == "::년도::" || month == "::월::" || day == "::일::") {
            alert("생년월일을 입력해주세요.");
            return;
        }

        if (phone_1 == "" || phone_2 == "" || phone_3 == "") {
            alert("휴대폰 번호를 입력해주세요.");
            return;
        }

        if (!$('#agree').is(':checked') && !$('#disagree').is(':checked')) {
            alert("이메일 수신 여부를 체크해주세요.");
            return;
        }

        if (addr_1 == "" || addr_2 == "" || addr_num == "") {
            alert("주소를 입력해주세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=register",
            data: {
                birth: year + '-' + month + '-' + day,
                day: day,
                name: name,
                phone: phone,
                addr: addr_1 + ' ' + addr_2,
                postcode: addr_num,
                email: email,
                pw: pw,
                id: id,
                email_rcv: agree,
                u_social: u_social
            },
            success: function (response) {
                var success = response;
                if (success === "1") {
                    //만약 세션에 id name email이 있다면 삭제
                    <%
                        if(request.getSession().getAttribute("token") != null && request.getSession().getAttribute("social_id") != null && request.getSession().getAttribute("social_name") != null && request.getSession().getAttribute("social_email") != null){
                            request.getSession().removeAttribute("token");
                            request.getSession().removeAttribute("social_id");
                            request.getSession().removeAttribute("social_name");
                            request.getSession().removeAttribute("social_email");
                        }
                    %>
                    //emailVerified를 삭제
                    sessionStorage.removeItem("emailVerified");
                    alert("회원가입이 완료되었습니다.");
                    location.href = "${pageContext.request.contextPath}/jsp/login/login_1.jsp";
                } else {
                    alert("회원가입에 실패하였습니다.");
                    //emailVerified를 삭제
                    sessionStorage.removeItem("emailVerified");
                    //모든창 빈칸
                    $('#name').val("");
                    $('#year').val("::년도::");
                    $('#month').val("::월::");
                    $('#day').val("::일::");
                    $('#phone_1').val("");
                    $('#phone_2').val("");
                    $('#phone_3').val("");
                    $('#addr_1').val("");
                    $('#addr_2').val("");
                    $('#addr_num').val("");
                    $('#email_1').val("");
                    $('#email_2').val("naver.com");
                    $('#email_3').val("");
                    $('#pw').val("");
                    $('#id').val("");

                    if (id && name && email) {
                        $('#id').val(id).prop('readonly', true);
                        $('#name').val(name).prop('readonly', true);
                        $('#email_1').val(email.split('@')[0]).prop('readonly', true);
                        var domain = email.split('@')[1];
                        var match = false;
                        $('#email_2 option').each(function () {
                            if (this.value == domain) {
                                match = true;
                                return false; // loop를 중단합니다.
                            }
                        });

                        $('#email_2').val(domain);
                        $('#email_2').prop('disabled', true);
                        $('.button_1').hide();
                        $('.button_2').hide();
                        $('.text_2').hide();

                        $('#id').css('background-color', '#f0f0f0');
                        $('#name').css('background-color', '#f0f0f0');
                        $('#email_1').css('background-color', '#f0f0f0');
                        $('#email_2').css('background-color', '#f0f0f0');
                        $('#email_3').css('background-color', '#f0f0f0');
                    }
                }
            }
        });
    }
</script>
</body>
</html>