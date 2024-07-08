<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    window.onload = function () {
        var mvo = <c:out value="${sessionScope.mvo}" default="null" />;

        var openModal = function () {
            document.querySelector('.header_modal_wrapper').style.display = 'block';
             document.body.classList.add('no-scroll');
        };

        var closeModal = function () {
            console.log("Closing modal...");
            document.querySelector('.header_modal_wrapper').style.display = 'none';
            document.body.classList.remove('no-scroll');
        };

        // 로그인이 안되어있을 때 id가 my_1~5인 a태그를 클릭하면 모달창 뜸
        if (!mvo) {
            document.querySelectorAll('a[id^="my_"]').forEach(function (a) {
                a.addEventListener('click', function (e) {
                    e.preventDefault();
                    openModal();
                });
            });
        }

        document.querySelector('.header_modal-button').addEventListener('click', function () {
            closeModal();
            location.href = '${pageContext.request.contextPath}/jsp/login/login_1.jsp';
        });

        document.querySelector('.header_modal-button-2').addEventListener('click', function () {
            closeModal();
        });


        document.querySelector('.header_modal-multiply').addEventListener('click', function () {
            closeModal();
        });
    }
</script>
<header class="site_header">
    <div class="header-wrapper">
        <div class="navigation_bar">
            <c:choose>
                <c:when test="${not empty sessionScope.mvo}">
                    <div class="nav_item_1" id="logout">
                        <div class="nav_text_1"><a
                                href="${pageContext.request.contextPath}/Controller?type=logout">로그아웃</a></div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="nav_item_1">
                        <div class="nav_text_1"><a
                                href="${pageContext.request.contextPath}/jsp/login/register.jsp">회원가입</a></div>
                    </div>
                    <div class="nav_item_2">
                        <div class="nav_text_2"><a
                                href="${pageContext.request.contextPath}/jsp/login/login_1.jsp">로그인</a></div>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="nav_item_3">
                <a href="${pageContext.request.contextPath}/Controller?type=home">
                    <div class="nav_text_1">고객센터</div>
                </a>
            </div>
            <a href="${pageContext.request.contextPath}/Controller?type=selectTime">
                <div class="nav_item_4">
                    <div class="nav_text_1">빠른예매</div>
                </div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=selectTime"><img class="nav_item_5"
                                                                                         src="${pageContext.request.contextPath}/img/header/link-1.png"/></a>
            <a href="${pageContext.request.contextPath}/Controller?type=myHome"><img class="nav_item_6"
                                                                                     src="${pageContext.request.contextPath}/img/header/link-2.png"/></a>

            <a href="${pageContext.request.contextPath}/Controller?type=selectTime">
                <div class="nav_text_3">예매</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=movielist">
                <div class="nav_text_4">영화</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=event">
                <div class="nav_text_5">이벤트</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=benefits">
                <div class="nav_text_6">혜택</div>
            </a>

            <a href="${pageContext.request.contextPath}/Controller?type=index"><img class="logo_link"
                                                                                    src="${pageContext.request.contextPath}/img/header/heading-1-link.png"/></a>
            <div class="m_all"></div>

            <%-- 전체보기 눌렀을 때 나오는 창 --%>
            <div class="MenuAll"
                 style="width: 1920px; height: 816px; position: absolute; top:100px; background: #53585A">
                <div style="width: 96px; height: 22px; left: 411px; top: 33px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                    SITEMAP
                </div>
                <div style="width: 161px; height: 59px; left: 411px; top: 84px; position: absolute">
                    <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                    <div style="width: 86px; height: 29px; left: 38px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        영화
                    </div>
                </div>
                <div style="width: 161px; height: 59px; left: 645px; top: 84px; position: absolute">
                    <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                    <div style="width: 86px; height: 29px; left: 38px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        예매
                    </div>
                </div>
                <div style="width: 161px; height: 59px; left: 879px; top: 84px; position: absolute">
                    <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                    <div style="width: 86px; height: 29px; left: 38px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        이벤트
                    </div>
                </div>
                <div style="width: 161px; height: 59px; left: 1113px; top: 84px; position: absolute">
                    <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                    <div style="width: 161px; height: 29px; left: 0px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        마이페이지
                    </div>
                </div>
                <div style="width: 161px; height: 59px; left: 411px; top: 328px; position: absolute">
                    <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                    <div style="width: 161px; height: 29px; left: 0px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        혜택
                    </div>
                </div>
                <div style="width: 161px; height: 59px; left: 645px; top: 328px; position: absolute">
                    <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                    <div style="width: 161px; height: 29px; left: 0px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        고객센터
                    </div>
                </div>

                <a href="${pageContext.request.contextPath}/Controller?type=movielist">
                    <div style="width: 161px; height: 32px; left: 411px; top: 184px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        전체 영화
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/Controller?type=benefits">
                    <div style="width: 161px; height: 32px; left: 408px; top: 428px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        전체 혜택
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/Controller?type=home">
                    <div style="width: 161px; height: 32px; left: 645px; top: 425px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        고객센터 홈
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/Controller?type=faq">
                    <div style="width: 181px; height: 32px; left: 635px; top: 490px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        자주 묻는 질문
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/Controller?type=notice">
                    <div style="width: 181px; height: 32px; left: 635px; top: 555px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        공지사항
                    </div>
                </a>
                <div style="width: 181px; height: 32px; left: 636px; top: 620px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                    <a id="my_255" href="${pageContext.request.contextPath}/Controller?type=sinquiry">
                    1:1문의
                    </a>
                </div>



                <a href="${pageContext.request.contextPath}/Controller?type=directions">
                    <div style="width: 181px; height: 32px; left: 636px; top: 685px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        오시는 길
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/Controller?type=selectTime">
                    <div style="width: 161px; height: 32px; left: 645px; top: 184px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                        빠른예매
                    </div>
                </a>

                <div style="width: 161px; height: 32px; left: 879px; top: 184px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                    <a href="${pageContext.request.contextPath}/Controller?type=event">
                        전체 이벤트
                    </a>
                </div>

                <%-- ======================= 마이페이지 ========================= --%>

                <div style="width: 191px; height: 32px; left: 1095px; top: 184px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                    <a id="my_1" href="${pageContext.request.contextPath}/Controller?type=myHome">
                        마이페이지 홈
                    </a>
                </div>


                <div style="width: 167px; height: 32px; left: 1107px; top: 401px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                    <a id="my_2" href="${pageContext.request.contextPath}/Controller?type=inquiry">
                        나의 문의 내역
                    </a>
                </div>

                <div style="width: 216px; height: 32px; left: 1086px; top: 255px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                    <a id="my_3" href="${pageContext.request.contextPath}/Controller?type=myReservation">
                        나의 예매 내역 조회
                    </a>
                </div>

                <div style="width: 167px; height: 32px; left: 1107px; top: 328px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                    <a id="my_4" href="${pageContext.request.contextPath}/Controller?type=myCoupon">
                        나의 쿠폰 조회
                    </a>
                </div>

                <div style="width: 167px; height: 32px; left: 1107px; top: 474px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">
                    <a id="my_5" href="${pageContext.request.contextPath}/Controller?type=personInfor">
                        개인 정보 수정
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="header_modal_wrapper">
    <div class="header_modal">
        <div class="header_modal_div_button">
            <button type="button" class="header_modal-button">
                확인
            </button>
            <button type="button" class="header_modal-button-2">취소
            </button>
        </div>
        <div class="modal-header">
            <div class="header_modal-text-wrapper-3">알림</div>
            <img class="header_modal-multiply" src="https://c.animaapp.com/ScPQRqN0/img/multiply@2x.png"/>
        </div>
        <div class="header_modal-txt-comon">
            <div class="header_modal-text-wrapper-4">로그인이 필요한 서비스 입니다.<br/>로그인하시겠습니까?</div>
        </div>
    </div>
</div>
<script>
    /*메뉴 전체보기를 클릭했을 때 link-4 이미지가 cancle이미지로 바뀐다*/
    document.querySelector('.m_all').addEventListener('click', function () {
        var element = document.querySelector('.m_all');
        var style = window.getComputedStyle(element);
        var img = style.backgroundImage;

        //menu_all의 background-image가 cancle.png이면 MenuAll 을 나타나게 하고
        //menu_all의 background-image가 link-4.png이면 MenuAll을 숨긴다.

        if (img.includes('link-3.png')) {
            element.style.backgroundImage = "url('${pageContext.request.contextPath}/img/main_img/cancle.png')";
            document.querySelector('.MenuAll').style.display = 'block';
        } else if (img.includes("cancle.png")) {
            element.style.backgroundImage = "url('${pageContext.request.contextPath}/img/main_img/link-3.png')";
            document.querySelector('.MenuAll').style.display = 'none';
        }
    });

    //아이디가 로그아웃을 클릭했을때 로그아웃할거냐고 경고창
    document.querySelector('#logout').addEventListener('click', function (event) {
        var confirmLogout = confirm("로그아웃하시겠습니까?");
        if (!confirmLogout) {
            // 사용자가 취소를 클릭하면 이벤트를 중단합니다.
            event.preventDefault();
        }
    });
</script>