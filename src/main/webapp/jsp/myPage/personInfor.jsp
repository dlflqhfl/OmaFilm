<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>  
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/personInfor.css" />
  </head>
  <body>
    <div class="screen">
      <div class="container-wrapper">
        <div class="container">
          <jsp:include page="/jsp/header/header.jsp"/>
          <div class="background">
            <div class="overlap">
              <div class="link-6"><div class="text-wrapper-8">마이페이지</div></div>
              <div class="list">
                <div class="overlap-group">
                  <div class="item-link"><div class="text-wrapper-9"><a href="Controller?type=myHome">마이페이지 홈</a></div></div>
                  <div class="item-link-2"><div class="text-wrapper-10"><a href="Controller?type=myReservation">나의 예매 내역 조회</a></div></div>
                  <div class="link-cancel"><div class="text-wrapper-cancel"><a href="Controller?type=myCancelReservation">나의 예매 취소 내역조회</a></div></div>
                  <div class="link-7"><div class="text-wrapper-11"><a href="Controller?type=inquiry">나의 문의 내역</a></div></div>
                  <div class="link-8"><div class="text-wrapper-12"><a href="Controller?type=myCoupon">나의 쿠폰 조회</a></div></div>
                  <div class="item-link-3"><div class="text-wrapper-13"><a href="Controller?type=personInfor">개인 정보 수정</a></div></div>
                </div>
              </div>
            </div>
          </div>
          <div class="heading">개인정보 수정</div>
          <div class="text-wrapper-15">회원님의 정보를 정확히 입력해주세요.</div>
          <div class="frame-2">
            <div class="name">
              <div class="overlap-group-2">
                <div class="div-2">
                  <input type="hidden" id="u_name" name="u_name" value="${member.u_name}"> 
                  <div class="frame-3"><div class="text-wrapper-16">${member.u_name }</div></div>
                </div>
                <div class="div-wrapper-2"><div class="text-wrapper-17">이름</div></div>
              </div>
            </div>
            <div class="birth">
              <div class="overlap-group-2">
                <div class="div-2">
                  <select class="frame-4" id="year" name="year">
                  <option>::년도::</option>
                  <%for(int i = 2024; i>=1900; i--){ %>
                  <option><%=i %></option>
                  <%} %>
                  </select>
                  <select class="frame-5" id="month" name="month">
                  	<option>::월::</option>
                  	<c:forEach var="i" begin="1" end="12">
                  		<option>${i}</option> 
                  	</c:forEach>
                  </select>
                  <select class="frame-6" id="day" name="day">
                 	<option>::일::</option>
                 	<c:forEach var="i" begin="1" end="31">
                 		<option>${i}</option>
                 	</c:forEach>
                  </select>
                  <div class="text-wrapper-21">년</div>
                  <div class="text-wrapper-22">월</div>
                  <div class="text-wrapper-23">일</div>
                </div>
                <div class="div-wrapper-2"><div class="text-wrapper-17">생년월일</div></div>
              </div>
            </div>
            <div class="phone">
              <div class="overlap-group-2">
                <div class="div-2">
                  <input type="text" class="frame-7" placeholder="0000" id="phone_2" name="phone_2" maxlength="4"/>
                  <input type="text" class="frame-8" placeholder="0000" id="phone_3" name="phone_3" maxlength="4"/>
                  <div class="text-wrapper-25">-</div>
                  <div class="text-wrapper-26">-</div>
                  <div class="button">
                    <input type="text" class="text-wrapper-27" placeholder="010" id="phone_1" name="phone_1"/>
                  </div>
                </div>
                <div class="div-wrapper-2"><div class="text-wrapper-17">휴대폰</div></div>
              </div>
            </div>
            <div class="esend">
              <div class="overlap-group-2">
              <div class="emailcheckframe">
                <div class="div-2">
                  <label class="input-checked-wrapper"><input type="checkbox" id="agree" name="agree" />동의</label>
                  <label class="input-checked"><input type="checkbox" id="disagree" name="agree" />비동의</label>
                </div>
                <div class="div-wrapper-2"><div class="text-wrapper-28">이메일 수신 여부</div></div>
              </div>
              </div>
            </div>
            <div class="email">
              <div class="overlap-group-2">
                <div class="emailallframe">
                  <input type="text"class="frame-9" placeholder="이메일" id="email_1" name="email_1"/>
                  <div class="button-2">
                    <select class="text-wrapper-277" id="email_2" name="email_2">
                     <option>naver.com</option>
                     <option>daum.net</option>
                     <option>gmail.com</option>
                     <option>hanmail.net</option>
                     <option>nate.com</option>
                     <option id="self">직접입력</option>	
                    </select>
                    <input type="text" class="selfframe" placeholder="직접입력" id="email_3" name="email_3" display="none"/>
                    <button type="button" class="submitbutton" onclick="submit()">전송하기</button>
                  </div>
                  <div class="email-check">
                    <button type="button" class="button_2" onclick="check()">확인</button>
                    <input type="text" class="text_2" id="check_num" name="check_num" placeholder="인증번호 확인"/>
                  </div>
                  <div class="text-wrapper-30">@</div>
                </div>
                <div class="div-wrapper-email"><div class="text-wrapper-17">이메일</div></div>
              </div>
            </div>
                <div class="adress-2">
                  <input type="text" class="frame-10" id="addr_1" name="addr_1" placeholder="주소를 입력해주세요">
                  <input type="text" class="frame-11" id="addr_2" name="addr_2" placeholder="상세주소"/>
                  <input type="text" class="frame-12" id="addr_num" name="addr_num" placeholder="우편번호" value="${member.u_postcode }">
                  <button type="button" class="frame-13" onclick="address()">우편번호</button>
                <div class="adress-name"><div class="text-wrapper-17">주소</div></div>
               </div>
            <div class="overlap-4">
              <div class="pw">
                <input type="password" class="frame-14" id="pw" name="pw" placeholder="비밀번호를 입력하세요" value="${member.u_pw }"/>
                <div class="frame-15"><div class="text-wrapper-17">비밀번호</div></div>
              </div>
              <div class="id">
                <div class="overlap-group-2">
                  <div class="frame-wrapper">
                    <input type="hidden" id="u_id" name="u_id" value="${member.u_id}"> 
                    <div class="frame-16"><div class="text-wrapper-16">${member.u_id }</div></div>
                  </div>
                  <div class="frame-17"><div class="text-wrapper-17">아이디</div></div>
                </div>
              </div>
              <div class="pw-check">
                <div class="overlap-group-2">
                  <div class="div-2">
                    <input type="password" class="frame-14" id="pw_check" name="pw_check" placeholder="비밀번호 확인"/>
                    <div class="text-wrapper-35">일치함</div>
                  </div>
                  <div class="div-wrapper-2"><div class="text-wrapper-36">비밀번호 확인</div></div>
                </div>
              </div>
            </div>
          </div>
          <div>
          <div>
         	<button type="button" class="btn-save frame-18" id="submit" name="submit" onclick="edit()">수정</button>
			</div>
			<div>
			<button type="button" class="btn-cancel frame-19" onclick="confirmCancel()"><span class="text-wrapper-38">취소</span></button>
			</div>
			<div>
			<a href="Controller?type=checkWithDrawal"><button type="button" class="btn-withdrawal frame-20"> 
		    	<span class="text-wrapper-39">회원탈퇴</span>
			</button></a>
			</div>
			</div>
        </div>
      </div>
    </div>
     <input type="hidden" id="u_social" name="u_social" value="${member.u_social}"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 서브밋 함수를 통해 이메일을 합쳐서 SendAction으로 보내준다.
    function submit() {
        var email_1 = $('#email_1').val();
        var email_2 = $('#email_2').val();
        var email_3 = $('#email_3').val();
        var email = email_1 + '@' + email_2;
        if(email_2 == '직접입력') {
            email = email_1 + '@' + email_3;
        }
            console.log(email_1)
            console.log(email)

        //유효성 검사
        if(email_1 == "" || email_2 == "") {
            alert("이메일을 입력해주세요.");
            return;
        }

        // jQuery AJAX를 사용하여 서버에 이메일을 보냅니다.
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=send",
            data: { email: email },
            success: function(data) {
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
        if(check_num == "") {
            alert("인증번호를 입력해주세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=check",
            data: { code_user : code },
            success: function(response) {
                var success = response.success;
                console.log(success)
                if (success === "1") {
                    alert("인증번호가 일치합니다.");
                    //인증 성공 상태를 세션에 저장
                    sessionStorage.setItem("emailVerified", "true");
                } else if(success === "0"){
                    alert("인증번호가 일치하지 않거나 인증번호가 만료되었습니다.");
                }else {
                    alert("인증번호를 다시 요청해주세요.");
                }
            }
        });
    }
    // 이메일 도메인 선택시 직접입력을 선택하면 입력창이 나타나게 한다.
    $(document).ready(function() {
        $('#email_2').change(function() {
            if($('#email_2').val() == '직접입력') {
                $('#email_3').show();
            } else {
                $('#email_3').hide();
                $(this).show();
            }
        });
    });

    //체크박스 버튼 중첩 클릭 안되게
    $(document).ready(function() {
        $('input[type="checkbox"]').on('change', function() {
            var name = $(this).attr('name');
            if ($(this).is(':checked')) {
                $('input[name="' + name + '"]').not(this).prop('checked', false);
            }
        });
    });

    //비밀번호 확인
    $('#pw_check').keyup(function() {
        var pw = $('#pw').val();
        var pw_check = $('#pw_check').val();
        if(pw == pw_check) {
            $('.text-wrapper-35').text('일치함').css('color', 'blue').show();
        } else {
            $('.text-wrapper-35').text('일치하지 않음').css('color', 'red').show();
        }
    });

    function address(){
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    addr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                document.getElementById('addr_num').value = data.zonecode;
                document.getElementById('addr_1').value = addr;
            }
        }).open();
    }

    //가입 버튼을 누르면 폼의 정보를 서버로 보내준다.
    function edit() {
    	console.log("ㅋㅋㅋㅋ")
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
        var email = email_1 + '@' + email_2;
        if(email_2 == '직접입력') {
            email = email_1 + '@' + email_3;
        }
        var pw = $('#pw').val();
        var id = $('#id').val();
        var agree = 0;
        if($('#agree').is(':checked')) {
            agree = 1;
        }

        //유효성 검사 각자 따로
        if(id == "") {
            alert("아이디를 입력해주세요.");
            return;
        }

      
        if(pw == "") {
            alert("비밀번호를 입력해주세요.");
            return;
        }

        if($('#pw_check').val() == "") {
            alert("비밀번호 확인을 입력해주세요.");
            return;
        }

        if(pw != $('#pw_check').val()) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }

        if(name == "") {
            alert("이름을 입력해주세요.");
            return;
        }
        if(year == "::년도::" || month == "::월::" || day == "::일::") {
            alert("생년월일을 입력해주세요.");
            return;
        }

        if(phone_1 == "" || phone_2 == "" || phone_3 == "") {
            alert("휴대폰 번호를 입력해주세요.");
            return;
        }

        if(email_1 == "" || email_2 == "") {
            alert("이메일을 입력해주세요.");
            return;
        }

        if(sessionStorage.getItem("emailVerified") !== "true") {
            alert("이메일 인증을 완료해주세요.");
            return;
        }

        if(!$('#agree').is(':checked') && !$('#disagree').is(':checked')) {
            alert("이메일 수신 여부를 체크해주세요.");
            return;
        }

        if(addr_1 == "" || addr_2 == "" || addr_num == "") {
            alert("주소를 입력해주세요.");
            return;
        }


        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Controller?type=personInfor",
            data: {
            	id: $('#u_id').val(),  // u_id 값 추가
                name: $('#u_name').val(), // u_name 값 추가
                birth: year + '-' + month + '-' + day,
                day: day,
                phone: phone,
                addr: addr_1 + '/' + addr_2,
                postcode: addr_num,
                email: email,
                agree: agree,
                pw: pw,
                email_rcv: agree,
                social:$('#u_social').val(),
            },
            success: function(response) {
            	console.log(response)
            	var success = response.trim(); // 응답의 공백 제거
            	console.log("서버응답:"+success)
                if (success > 0) {
                    alert("수정이 완료되었습니다.");
                    location.href = "${pageContext.request.contextPath}/Controller?type=myHome";
                } else {
                    alert("다시 시도해주세요.");
                }
            }
        });
    }
		    function confirmCancel() {
		        if (confirm("취소하시면 변경사항은 수정되지 않습니다.\n계속 진행하시겠습니까?")) {
		            location.href = "Controller?type=myHome"; // 확인 시 마이페이지 홈으로 이동
		        } else {
		            // 취소 시 아무 동작 없음 (현재 페이지 유지)
		        }
		    }
    
	    //전화번호 가져오기
	    $(document).ready(function() {
		    	var phone = "${member.u_phone}";
				
			    // "-"로 생년월일 분리
			    var phoneParts = phone.split("-");
			    var num_1 = phoneParts[0];
			    var num_2 = phoneParts[1];
			    var num_3 = phoneParts[2];

			    // select 박스에 값 설정
			    $('#phone_1').val(num_1);
			    $('#phone_2').val(num_2);
			    $('#phone_3').val(num_3);
		    	 
			    // 숫자 4자리 제한 추가
		    	  $('#phone_2, #phone_3').on('input', function() {
		    	    var inputValue = $(this).val();
		    	    $(this).val(inputValue.replace(/[^0-9]/g, '').substring(0, 4));
		    	  });
		    	});
	    
  		  //이메일 동의 여부 가져오기
	    $(document).ready(function() {
		    var email_rcv = "${member.u_email_rcv}";
		 //1인 경우 동의 0인 경우 비동의
		    if (email_rcv === "1") {
		        $("#agree").prop("checked", true);
		    } else if (email_rcv === "0") {
		        $("#disagree").prop("checked", true);
		    }
		});
		    
    
	 	 //생년월일 select박스에 가져오기
	   	$(document).ready(function() {

	   		var birth = "${member.u_birth}";
		
		    // "-"로 생년월일 분리
		    var birthParts = birth.split("-");
		    var year = birthParts[0];
		    var month = parseInt(birthParts[1], 10); // 10진수 정수로 변환 (월)
		    var day = parseInt(birthParts[2], 10);   // 10진수 정수로 변환 (일)


		    // select 박스에 값 설정
		    $('#year').val(year);
		    $('#month').val(month);
		    $('#day').val(day);
		});
	 	 
	    
    	//주소 가져오기
	   	$(document).ready(function() {
	    	  // EL (Expression Language)을 사용하여 JSP 변수 값 가져오기
		    var address = "${member.u_address}";
		
		    // 주소 정보 분리
		    var addressParts = address.split("/");
		    var addr_1 = addressParts[0];
		    var addr_2 = addressParts[1];
		
		    // 주소 정보 설정
		    $('#addr_1').val(addr_1);
		    $('#addr_2').val(addr_2);
		    
		    
	   	});
		
		  
	 	 
   
	 	 
    	//이메일 가져오기
	   	$(document).ready(function() {
	    	  // EL (Expression Language)을 사용하여 JSP 변수 값 가져오기
		    var email = "${member.u_email}";
		
		    // 이메일 정보 분리
		    var emailParts = email.split("@");
		    var email_1 = emailParts[0];
		    var email_2 = emailParts[1];
		    
		    console.log(email_2)
		
		    // 이메일 정보 설정
		    $('#email_1').val(email_1);
		
		    // select 박스에서 해당 도메인 선택 또는 직접 입력 처리
		    var selectBox = $('#email_2');
		    console.log(selectBox)
		   
			var foundOption = false;
	      	var options = selectBox.children('option');
	       	for (var i = 0; i < options.length; i++) {
	         if (options.eq(i).val() === email_2) { // 배열의 첫 번째 요소 비교
	           selectBox.val(email_2); // 값 설정
	           selectBox.trigger('change'); // change 이벤트 발생
	           foundOption = true;
	           break;
	         }
	       }
		 // 2. 일치하는 옵션이 없으면 "직접입력" 선택 후 값 설정
		    if (!foundOption) {
		      selectBox.val('직접입력');
		      selectBox.trigger('change'); // change 이벤트 발생
		      $('#email_3').val(email_2);
		      $('#email_3').show(); // 직접 입력 필드 표시
		    } else {
		      // 3. 일치하는 옵션이 있으면 직접 입력 필드 숨김
		      $('#email_3').hide();
		    }
	
		    // 4. 콤보박스 변경 이벤트 처리 (직접 입력 필드 표시/숨김)
		    selectBox.change(function() {
		      if ($(this).val() === '직접입력') {
		        $('#email_3').show();
		      } else {
		        $('#email_3').hide();
		      }
		    });
		  });
	</script>
	<jsp:include page="/jsp/footer/footer.jsp"/>
  </body>
</html>