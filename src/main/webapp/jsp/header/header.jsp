<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />


<header class="header">
    <div class="navbar">
        <c:choose>
            <c:when test="${not empty sessionScope.mvo}">
                <div class="link-21" id="logout"><div class="text-wrapper-26"><a href="${pageContext.request.contextPath}/Controller?type=logout">로그아웃</a></div></div>
            </c:when>
            <c:otherwise>
        <div class="link-21"><div class="text-wrapper-26"><a href="${pageContext.request.contextPath}/jsp/login/register.jsp">회원가입</a></div></div>
        <div class="link-23"><div class="text-wrapper-27"><a href="${pageContext.request.contextPath}/jsp/login/login_1.jsp">로그인</a></div></div>
        
            </c:otherwise>
        </c:choose>
        <div class="link-22">
            <a href="${pageContext.request.contextPath}/Controller?type=home">
                <div class="text-wrapper-26">고객센터</div></a>
        </div>
        <a href="${pageContext.request.contextPath}/Controller?type=selectTime"><div class="link-24"><div class="text-wrapper-26">빠른예매</div></div></a>
        <a href="${pageContext.request.contextPath}/Controller?type=selectTime"><img class="link-26" src="${pageContext.request.contextPath}/img/main_img/link-1.png" /></a>
        <a href="${pageContext.request.contextPath}/Controller?type=myHome"><img class="link-27" src="${pageContext.request.contextPath}/img/main_img/link-2.png" /></a>

        <a href="${pageContext.request.contextPath}/Controller?type=selectTime"><div class="text-wrapper-29">예매</div></a>
        <a href="${pageContext.request.contextPath}/Controller?type=movielist"><div class="text-wrapper-30">영화</div></a>
        <a href="${pageContext.request.contextPath}/Controller?type=event"><div class="text-wrapper-31">이벤트</div></a>
        <a href="${pageContext.request.contextPath}/Controller?type=benefits"><div class="text-wrapper-32">혜택</div></a>

       <a href="${pageContext.request.contextPath}/Controller?type=index"><img class="heading-link" src="${pageContext.request.contextPath}/img/main_img/heading-1-link.png" /></a>
        <div class="m_all"></div>

        <%-- 예매 섹션에 마우스를 올렸을 때 보여지는 메뉴 --%>

        <div class="menu-ticketing">
            <div class="Line1" style="width: 31px; height: 0px; left: 764px; top: -2px; position: absolute; border: 3px white solid"></div>
            <div style="width: 77px; height: 21px; left: 651px; top: 7px; position: absolute; text-align: center; color: white; font-size: 15px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; word-wrap: break-word">전체영화</div>
            <div style="width: 39px; height: 21px; left: 744px; top: 7px; position: absolute; text-align: center; color: white; font-size: 15px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; word-wrap: break-word">예매</div>
        </div>

        <%-- 이벤트 섹션에 마우스를 올렸을 때 보여지는 메뉴 --%>
        <div class="menu-event">
            <div class="MenuBg" style="width: 1920px; height: 47px; padding-top: 13px; padding-bottom: 13px; padding-left: 972px; padding-right: 612px; left: 0px; top: 47px; position: absolute; background: rgba(0, 0, 0, 0.30); justify-content: flex-end; align-items: flex-start; gap: 22px; display: inline-flex">
                <div style="width: 110px; height: 21px; text-align: center; color: white; font-size: 15px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; word-wrap: break-word">진행중 이벤트</div>
                <div style="width: 91px; height: 21px; text-align: center; color: white; font-size: 15px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; word-wrap: break-word">지난 이벤트</div>
                <div style="width: 91px; height: 21px; text-align: center; color: white; font-size: 15px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; word-wrap: break-word">당첨자발표</div>
            </div>
            <div class="Line3" style="width: 48px; height: 0px; left: 1121.50px; top: 48.50px; position: absolute; border: 3px white solid"></div>
        </div>

        <%-- 전체보기 눌렀을 때 나오는 창 --%>
        <div class="MenuAll" style="width: 1920px; height: 816px; position: absolute; top:100px; background: #53585A">
            <div style="width: 96px; height: 22px; left: 411px; top: 33px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">SITEMAP</div>
            <div style="width: 161px; height: 59px; left: 411px; top: 84px; position: absolute">
                <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                <div style="width: 86px; height: 29px; left: 38px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">영화</div>
            </div>
            <div style="width: 161px; height: 59px; left: 645px; top: 84px; position: absolute">
                <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                <div style="width: 86px; height: 29px; left: 38px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">예매</div>
            </div>
            <div style="width: 161px; height: 59px; left: 879px; top: 84px; position: absolute">
                <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                <div style="width: 86px; height: 29px; left: 38px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">이벤트</div>
            </div>
            <c:if test="${mvo != null }">
            <div style="width: 161px; height: 59px; left: 1113px; top: 84px; position: absolute">
                <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                <div style="width: 161px; height: 29px; left: 0px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">마이페이지</div>
            </div>
            </c:if>
            <div style="width: 161px; height: 59px; left: 411px; top: 328px; position: absolute">
                <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                <div style="width: 161px; height: 29px; left: 0px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">혜택</div>
            </div>
            <div style="width: 161px; height: 59px; left: 645px; top: 328px; position: absolute">
                <div style="width: 161px; height: 58px; left: 0px; top: 1px; position: absolute; border-top: 1px #7B7B7B solid; border-bottom: 1px #7B7B7B solid"></div>
                <div style="width: 161px; height: 29px; left: 0px; top: 15px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">고객센터</div>
            </div>
            <a href="${pageContext.request.contextPath}/Controller?type=movielist">
            <div style="width: 161px; height: 32px; left: 411px; top: 184px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">전체 영화</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=benefits">
            <div style="width: 161px; height: 32px; left: 408px; top: 428px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">전체 혜택</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=home">
            <div style="width: 161px; height: 32px; left: 645px; top: 425px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">고객센터 홈</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=faq">
            <div style="width: 181px; height: 32px; left: 635px; top: 490px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">자주 묻는 질문</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=notice">
            <div style="width: 181px; height: 32px; left: 635px; top: 555px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">공지사항</div>
           </a>
            <a href="${pageContext.request.contextPath}/Controller?type=sinquiry">
            <div style="width: 181px; height: 32px; left: 636px; top: 620px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">1:1문의 </div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=directions">
            <div style="width: 181px; height: 32px; left: 636px; top: 685px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">오시는 길</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=selectTime">
            <div style="width: 161px; height: 32px; left: 645px; top: 184px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">빠른예매</div>
           </a>
            <a href="${pageContext.request.contextPath}/Controller?type=event">
            <div style="width: 161px; height: 32px; left: 879px; top: 184px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">전체 이벤트</div>
            </a>
            <c:if test="${mvo != null }">
            <a href="${pageContext.request.contextPath}/Controller?type=myHome">
            <div style="width: 191px; height: 32px; left: 1095px; top: 184px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">마이페이지 홈</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=inquiry">
            <div style="width: 167px; height: 32px; left: 1107px; top: 401px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">나의 문의 내역</div>
            </a>
            <a href="${pageContext.request.contextPath}/Controller?type=myReservation">
            <div style="width: 216px; height: 32px; left: 1086px; top: 255px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">나의 예매 내역 조회</div>
           	</a>
            <a href="${pageContext.request.contextPath}/Controller?type=myCoupon">
            <div style="width: 167px; height: 32px; left: 1107px; top: 328px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">나의 쿠폰 조회</div>
       		</a>
       		<a href="${pageContext.request.contextPath}/Controller?type=personInfor">
            <div style="width: 167px; height: 32px; left: 1107px; top: 474px; position: absolute; text-align: center; color: white; font-size: 20px; font-family: Kokoro; font-weight: 400; line-height: 22.50px; letter-spacing: 2px; word-wrap: break-word">개인 정보 수정</div>
            </a>
            </c:if>
        </div>
    </div>
</header>

<script>
    // 이벤트 섹션에 마우스를 올렸을 때
    document.querySelector('.text-wrapper-31').addEventListener('mouseenter', function() {
        // menu-event를 보이게 합니다.
        document.querySelector('.menu-event').style.display = 'block';
        document.querySelector('.menu-ticketing').style.display = 'none';
    });

    // menu-event에서 마우스를 떼었을 때
    document.querySelector('.menu-event').addEventListener('mouseout', function(event) {
        // 마우스가 클래스가 menu-event의 바깥으로 나갔는지 확인합니다.
    if (!event.relatedTarget || event.relatedTarget.id !== 'menu-event') {
            // menu-event를 숨깁니다.
            document.querySelector('.menu-event').style.display = 'none';
        }
    });

    // 예매 섹션에 마우스를 올렸을 때
    document.querySelector('.text-wrapper-29').addEventListener('mouseenter', function() {
        // MenuTicketing을 보이게 합니다.
        document.querySelector('.menu-ticketing').style.display = 'block';
        document.querySelector('.menu-event').style.display = 'none';
    });

    // MenuTicketing에서 마우스를 떼었을 때
    document.querySelector('.menu-ticketing').addEventListener('mouseout', function(event) {
        // 마우스가 MenuTicketing의 바깥으로 나갔는지 확인합니다.
        if (!event.relatedTarget || event.relatedTarget.id !== 'menu-ticketing') {
            // MenuTicketing을 숨깁니다.
            document.querySelector('.menu-ticketing').style.display = 'none';
        }
    });

    // 메뉴 전체보기를 클릭했을 때 link-4 이미지가 cancle이미지로 바뀐다
    document.querySelector('.m_all').addEventListener('click', function() {
        var element = document.querySelector('.m_all');
        var style = window.getComputedStyle(element);
        var img = style.backgroundImage;

        //menu_all의 background-image가 cancle.png이면 MenuAll 을 나타나게 하고
        //menu_all의 background-image가 link-4.png이면 MenuAll을 숨긴다.

        if (img.includes('link-3.png')) {
            element.style.backgroundImage = "url('${pageContext.request.contextPath}/img/main_img/cancle.png')";
            document.querySelector('.MenuAll').style.display = 'block';
        }else if (img.includes("cancle.png")) {
            element.style.backgroundImage = "url('${pageContext.request.contextPath}/img/main_img/link-3.png')";
            document.querySelector('.MenuAll').style.display = 'none';
        }
    });

    //아이디가 로그아웃을 클릭했을때 로그아웃할거냐고 경고창
    document.querySelector('#logout').addEventListener('click', function(event) {
        var confirmLogout = confirm("로그아웃하시겠습니까?");
        if (!confirmLogout) {
            // 사용자가 취소를 클릭하면 이벤트를 중단합니다.
            event.preventDefault();
        }
    });
</script>