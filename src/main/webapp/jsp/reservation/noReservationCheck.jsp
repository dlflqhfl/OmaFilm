<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservation/noReservationCheckStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css"/>
</head>
<body>
<jsp:include page="/jsp/header/header.jsp"/>
<div class="screen">
    <div class="overlap-wrapper">
        <div class="list-search">
            <div class="overlap-2">
                <div class="container-2">
                    <div class="label">구분</div>
                    <div class="label-2">
                        <div class="text-wrapper-5">예매내역</div>
                    </div>
                    <div class="label-3">
                        <div class="text-wrapper-5">지난내역</div>
                    </div>
                </div>
                <button class="button">
                    <div class="text-wrapper-6">조회</div>
                </button>
            </div>
        </div>
        <div class="overlap">
            <div class="container">

                <div class="content">
                    <div class="tit">예매/취소내역</div>
                    <div class="bokdlist">

                        <div class="p-2">총 ${cnt }건</div>
                        <c:forEach var="vo" items="${list }">
                            <div class="li">
                                <div class="round">
                                    <div class="img"></div>
                                    <div class="div">
                                    </div>
                                    <p class="p">
                                        <span class="span">&nbsp;&nbsp;&nbsp;&nbsp;${vo.non_name } </span>
                                    </p>
                                    <p></p>
                                    <table class="table">
                                        <tbody class="tbody">
                                        <tr class="tr">
                                            <th class="th">관람일시</th>
                                            <td class="td">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.rsvr_time }</td>

                                        </tr>
                                        <tr class="tr-2">
                                            <th class="text-wrapper">관람좌석</th>
                                            <td class="td-2">&nbsp;&nbsp;&nbsp;&nbsp;${vo.svo.s_code }</td>
                                        </tr>

                                        <tr class="tr-3">
                                            <th class="th">영화관
                                            </th>
                                            <td class="td">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.ssvo.t_name }</td>
                                        </tr>
                                        <tr class="tr-4">
                                            <th class="text-wrapper">관람인원
                                            </th>
                                            <td class="td-2">&nbsp;&nbsp;&nbsp;&nbsp;${vo.rvo.rs_count } 명</td>
                                        </tr>
                                        <tr class="tr-5">
                                            <th class="th">영화명</th>
                                            <td class="td-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.mvo.movieNm }</td>
                                        </tr>
                                        <tr class="tr-6">
                                            <th class="th">예매자</th>
                                            <td class="text-wrapper-2"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="tr-wrapper" data-p_ex_price="${vo.pvo.p_ex_price }"
                                         data-p_tt_price="${vo.pvo.p_tt_price }" data-p_method="${vo.pvo.p_method }"
                                         data-p_time="${vo.pvo.p_time }">
                                        <div class="payTime">
                                            결제일시
                                        </div>
                                        <div class="overlap-group">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.pvo.p_time }
                                        </div>
                                        <button class="buttom btn">
                                            <div class="text-wrapper-3">결제정보</div>
                                        </button>
                                    </div>
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">예매취소</div>
                                        <input type="hidden" name="rs_num" value="${vo.rvo.rs_num }"/>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div id="modalPlace" class="modalPlace">
                            <div class="modal-content">
                                <%@ include file="/jsp/reservation/noReservationCheckModal.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--리스트도 뽑아줘용--%>
            <div class="div-2">
                <div class="overlap-3">
                    <div class="heading">예매 취소 내역</div>
                    <table class="table-2">
                        <thead class="div-3">
                        <th class="th-3">
                            <div class="text-wrapper-13">취소 일시</div>
                        </th>
                        <th class="th-4">
                            <div class="text-wrapper-14">예매번호</div>
                        </th>
                        <th class="th-5">
                            <div class="text-wrapper-15">영화명</div>
                        </th>
                        <th class="th-6">
                            <div class="text-wrapper-16">극장/상영관</div>
                        </th>
                        <th class="th-7">
                            <div class="text-wrapper-17">상영일시</div>
                        </th>
                        <th class="th-8">
                            <div class="text-wrapper-17">환불 금액</div>
                        </th>
                        </thead>
                        <tbody class="tbody-2">
                        <tr class="div-3">
                            <td class="data">
                                <div class="text-wrapper-10">2024-06-16</div>
                            </td>
                            <td class="data-2">
                                <div class="text-wrapper-10">1991-10-30</div>
                            </td>
                            <td class="data-3">
                                <div class="text-wrapper-11">쌍용관</div>
                            </td>
                            <td class="data-4">
                                <div class="text-wrapper-10">2024-06-17</div>
                            </td>
                            <td class="data-5">
                                <div class="text-wrapper-12">선재 업고 못튀어</div>
                            </td>
                            <td class="data-6">
                                <div class="text-wrapper-10">15000원</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="nav">
                        <div class="strong">
                            <div class="text-wrapper-7">1</div>
                        </div>
                        <div class="link">
                            <div class="text-wrapper-8">2</div>
                        </div>
                        <div class="link-2">
                            <div class="text-wrapper-8">3</div>
                        </div>
                        <div class="link-3">
                            <div class="text-wrapper-8">4</div>
                        </div>
                        <div class="link-4">
                            <div class="text-wrapper-8">5</div>
                        </div>
                        <div class="link-5">
                            <div class="text-wrapper-8">6</div>
                        </div>
                        <div class="link-6">
                            <div class="text-wrapper-8">7</div>
                        </div>
                        <div class="link-7">
                            <div class="text-wrapper-8">8</div>
                        </div>
                        <div class="link-8">
                            <div class="text-wrapper-8">9</div>
                        </div>
                        <div class="link-9">
                            <div class="text-wrapper-9">10</div>
                        </div>
                        <div class="link-10"></div>
                        <div class="link-11"></div>
                    </div>
                </div>
            </div>
            <jsp:include page="/jsp/footer/footer.jsp"/>
        </div>
    </div>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
<script type="text/javascript">
    let modal = $(".modalPlace");
    $(function () {

        // 닫기 버튼 클릭 시 모달 숨기기
        $(".modal-button").click(function () {
            modal.hide();
        });
        $(".multiply").click(function () {
            modal.hide();
        });

        // 모달 외부 클릭 시 모달 숨기기
        $(window).click(function (event) {
            if ($(event.target).is(modal)) {
                modal.hide();
            }
        });

        $(".btn").click(function () {
            let parent = $(this).closest(".tr-wrapper");

            let p_ex_price = parseInt(parent.data("p_ex_price"));
            let p_tt_price = parseInt(parent.data("p_tt_price"));
            let p_method = parent.data("p_method");
            let p_time = parent.data("p_time");


            let name;
            $("#t_ex_price").text("상품금액: " + p_ex_price.toLocaleString() + "원");

            if (p_method === "card") {
                name = "카드";
            } else if (p_method === "point") {
                name = "카카오페이";
            }

            let sale = p_ex_price - p_tt_price;
            $("#t_tt_price").text("할인금액: " + sale.toLocaleString() + "원");
            $("#totalPrice1").text("최종 결제금액: " + p_tt_price.toLocaleString() + "원 /" + name);
            $("#ppTime").text(p_time);

            modal.css("display", "block");
        });

        
        //예매취소버튼
        $(".div-wrapper").click(function () {
        	var confirmCancel = confirm("예매를 취소하시겠습니까?");
	        
	        if (confirmCancel) {
	        	var rs_num = $(this).find("input[name=rs_num]").val();
	        	
		        var form = document.createElement('form');
		        var objs;
		        
		        objs = document.createElement('input');
	            objs.setAttribute('type', 'hidden');
	            objs.setAttribute('name', 'rs_num');
	            objs.setAttribute('value', rs_num);
	            form.appendChild(objs);
	            
		        form.setAttribute('method', 'post');
	            form.setAttribute('action', 'Controller?type=payCancelNonMem');
	            document.body.appendChild(form);
	            form.submit();
	        }
        });
    });

</script>
</body>
</html>
