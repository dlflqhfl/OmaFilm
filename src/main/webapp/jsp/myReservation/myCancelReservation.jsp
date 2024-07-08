<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReservation/cancel_style.css" />
</head>
<body>
	<div class="screen">
		<div class="container-wrapper">
			<div class="container">
				<jsp:include page="/jsp/header/header.jsp"/>

				<div class="background">
					<div class="overlap">
						<div class="link-6">
							<div class="text-wrapper-8">마이페이지</div>
						</div>
						<div class="list">
							<div class="overlap-group">
								<div class="item-link-2">
									<div class="text-wrapper-10">
										<a href="Controller?type=myHome">마이페이지 홈</a>
									</div>
								</div>
								<div class="item-link-3">
									<div class="text-wrapper-13">
										<a href="Controller?type=myReservation">나의 예매 내역 조회</a>
									</div>
								</div>
								<div class="link-8">
									<div class="text-wrapper-14">
										<a href="Controller?type=myCancelReservation">나의 예매 취소 내역
											조회</a>
									</div>
								</div>
								<div class="link-9">
									<div class="text-wrapper-12">
										<a href="Controller?type=myCoupon">나의 쿠폰 조회</a>
									</div>
								</div>
								<div class="link-7">
									<div class="text-wrapper-11">
										<a href="Controller?type=inquiry">나의 문의 내역</a>
									</div>
								</div>
								<div class="item-link">
									<div class="text-wrapper-9">
										<a href="Controller?type=checkPw">개인 정보 수정</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

					<div class="heading-2">예매 취소 내역</div>
				<div class="overlap-wrapper">
					<div class="overlap-4">
						<div class="table-2">
							<div class="thead-2">
								<div class="th-9">
									<div class="text-wrapper-32">취소 일시</div>
								</div>
								<div class="th-10">
									<div class="text-wrapper-33">예매번호</div>
								</div>
								<div class="th-11">
									<div class="text-wrapper-20">영화명</div>
								</div>
								<div class="th-12">
									<div class="text-wrapper-21">극장/상영관</div>
								</div>
								<div class="th-13">
									<div class="text-wrapper-22">상영일시</div>
								</div>
								<div class="th-14">
									<div class="text-wrapper-22">환불 금액</div>
								</div>
							</div>
<div class="tbody-2">
	<c:set var="len" value="${fn:length(rvo_cancel)}" />
    <c:if test="${page.end<=len}">
         <c:set var="end" value="${page.end}"/>
    </c:if>
	<c:if test="${page.end>len}">
		<c:set var="end" value="${len}" />
	</c:if>

<c:forEach var="i" begin="${page.begin}" end="${ end}" varStatus="status">
<div class="tr-${status.index + 11}">
<div class="data-7">
	<div class="text-wrapper-27">${rvo_cancel[i-1].rs_time.split(" ")[0]}</div>
</div>
<div class="data-8">
	<div class="text-wrapper-27">${rvo_cancel[i-1].rs_num}</div>
</div>
<c:if test="${item.ssvo != null}">
	<div class="data-9">
		<div class="text-wrapper-26">${rvo_cancel[i-1].ssvo.t_name}</div>
	</div>
	<div class="data-10">
		<div class="text-wrapper-27">${rvo_cancel[i-1].ssvo.ss_time.split(" ")[0]}</div>
	</div>
	<div class="data-11">
		<div class="text-wrapper-28">${rvo_cancel[i-1].ssvo.mvo.movieNm }</div>
	</div>
</c:if>
<c:if test="${rvo_cancel[i-1].pvo != null}">
	<div class="data-12">
		<div class="text-wrapper-27">${rvo_cancel[i-1].pvo.p_tt_price}</div>
	</div>
</c:if>
</div>
</c:forEach>


</div>
							<!-- tbody 끝 -->

							<div class="nav">
						<div>
							<ol class="paging">
								<c:if test="${page.startPage < page.pagePerBlock}">
									<li class="disable">&lt;</li>
								</c:if>
								<c:if test="${page.startPage >= page.pagePerBlock}">
									<li class=""><a
										href="Controller?type=myReservation&cPage=${page.nowPage - page.pagePerBlock}">&lt;</a></li>
								</c:if>
								<!-- <div class="nav"> -->
								<c:forEach begin="${page.startPage }" end="${page.endPage}" var="i">
									<c:if test="${i == page.nowPage}">
										<li class="now">${i}</li>
									</c:if>
									<c:if test="${i != page.nowPage}">
										<li class=" "><a
											href="Controller?type=myReservation&cPage=${i}">${i}</a></li>
									</c:if>
								</c:forEach>


								<c:if test="${page.endPage < page.totalPage}">
									<li class=""><a
										href="Controller?type=myReservation&cPage=${page.nowPage - page.pagePerBlock}">&gt;</a></li>
								</c:if>
								<c:if test="${page.endPage >= page.totalPage}">
									<li class=" disable">&gt;</li>
								</c:if>

							</ol>
						</div>
					</div>
						</div>
					</div>
				</div>
				<div class="bar">
					<div class="overlap-2">

						<div class="label-wrapper">
							<div class="label-2">기간</div>
						</div>
						<%
						java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM");
						java.util.Calendar cal2 = java.util.Calendar.getInstance();
						%>
						<select class="text-wrapper-16" id="cancelMonth">
							<option value="">::선택하세요::</option>
							<%
							for (int i = 0; i < 12; i++) {
							%>
							<%
							String formattedDate = sdf.format(cal2.getTime());
							%>
							<option value="<%=formattedDate%>"><%=formattedDate%></option>
							<%
							cal2.add(java.util.Calendar.MONTH, -1);
							}
							%>
						</select>
						<button class="link-10" id="cancelSearch">조회</button>
					</div>
				</div>	
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script>
		$(function() {

			//예매 취소 내역 기간 검색 버튼
			$("#cancelSearch").click(
					function() {
						const selectedMonth = $("#cancelMonth").val(); // 선택된 월 값

						var form = document.createElement('form');
						var objs;

						objs = document.createElement('input');
						objs.setAttribute('type', 'hidden');
						objs.setAttribute('name', 'cancelMonth');
						objs.setAttribute('value', selectedMonth);
						form.appendChild(objs);

						form.setAttribute('method', 'post');
						form.setAttribute('action',
								'Controller?type=myCancelReservation');
						document.body.appendChild(form);
						form.submit();

					}
			);
		});
	</script>
	<jsp:include page="/jsp/footer/footer.jsp"/>
</body>
</html>