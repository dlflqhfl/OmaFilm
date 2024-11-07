<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="web.mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%! int u_code = 0; 
	String u_id ="";
    String formattedDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
%>
<%
	boolean login = false;
	Object obj = request.getSession().getAttribute("mvo");
	if ( obj != null){
		MemberVO member = (MemberVO) obj;
		login = true;
		u_id = member.getU_id();
		u_code = member.getU_code();
		System.out.println(u_code);
	}
	
%>
<!DOCTYPE html> 
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie/movieDetail.css" />
  </head>
  <body>
    <div class="www-lottecinema-co">
      <div class="div">
       <jsp:include page="/jsp/header/header.jsp"/>
        <div class="container">
          <div class="overlap">
            <div class="overlap-group">
              <div class="strong">${mvo.movieNm }</div>
              <div class="item">
                <img class="image" src="${pageContext.request.contextPath}/img/movie/movieDetail/image.svg" />
                <div class="text-wrapper">${mvo.showTm }</div>
                <div class="text-wrapper-2">분</div>
                <div class="vertical-divider"></div>
              </div>
              <div class="list">
                <div class="image-2"></div>
                <div class="image-3"></div>
              </div>
            </div>
            <div class="overlap-group-wrapper">
              <div class="overlap-group-2">
                <div class="text-wrapper-3">
                	<fmt:parseDate value="20240612" pattern="yyyyMMdd" var="parsedDate"/>
					<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
                </div>
                <div class="text-wrapper-4">개봉</div>
              </div>
            </div>
            <div class="item-2">
              <div class="overlap-2">
                <div class="text-wrapper-6">${mvo.watchGradeNm}</div>
              </div>
              <div class="vertical-divider"></div>
            </div>
            
          </div>
          <div class="paragraph-background">
            <button type="button" class="link" onclick="window.location.href='${pageContext.request.contextPath}/Controller?type=selectTime'"><div class="text-wrapper-9">예매하기</div></button>
          </div>
          <div class="element-jpg"><img src="${mvo.m_file }" width="316px"></div>
        </div>
        <div class="background">
          <div class="overlap-3">
            <div class="container-2">
              <div class="heading">영화정보</div>
              <div class="list-2">
                <div class="item-4">
                  <div class="emphasis">장르</div>
                  <div class="text-wrapper-10">${mvo.genreNm }</div>
                  <div class="background-2"></div>
                </div>
                <div class="item-5">
                  <div class="emphasis">감독</div>
                  <div class="div-wrapper"><div class="text-wrapper-11">${mvo.directors }</div></div>
                  <div class="background-2"></div>
                </div>
                <div class="item-6">
                  <div class="emphasis-2">출연</div>
                  <div class="link-2"><div class="text-wrapper-11">${mvo.actors}</div></div>
                  <!-- <div class="overlap-group-3">
                    <div class="text-wrapper-12">,</div>
                    <div class="link-3"><div class="text-wrapper-11">김여진</div></div>
                  </div>
                  <div class="overlap-4">
                    <div class="text-wrapper-12">,</div>
                    <div class="link-3"><div class="text-wrapper-11">김도윤</div></div>
                  </div>
                  <div class="overlap-5">
                    <div class="text-wrapper-12">,</div>
                    <div class="link-3"><div class="text-wrapper-11">정웅인</div></div>
                  </div>
                  <div class="background-3"></div> -->
                </div>
              </div>
            </div>
            <p class="p">
              ${mvo.m_plot }
            </p>
          </div>
        </div>
        <div class="overlap-6">
          <div class="text-wrapper-13">관람평</div>
          <div class="item-7"></div>
        </div>
        <button class="button">
          <div class="overlap-7">
            <div class="text-wrapper-14">상세정보</div>
            <div class="item-8"></div>
          </div>
        </button>
        <div class="overlap-8">
          <div class="overlap-wrapper">
            <div class="overlap-9">
              <div class="text-wrapper-15">트레일러</div>
              <div class="emphasis-3"><div class="text-wrapper-16">(<span id="trailerLength"></span>)</div></div>
            </div>
          </div>
          <div class="container-3">
            <div class="container-4">
              <div class="div-2">
                <div class="overlap-group-4">
                  <div class="div-2">
                  <iframe id="myIframe1" class="emphasis-4" allowfullscreen></iframe>
                    
                  </div>
                  </div>
              </div>
              <div class="container-5">
                <div class="overlap-group-4">
                  <div class="div-2">
                    <iframe id="myIframe2" class="emphasis-5" allowfullscreen></iframe>
                  </div>
                  </div>
              </div>
              <div class="container-6">
                <div class="overlap-group-4">
                  <div class="div-2">
                    <iframe id="myIframe3" class="emphasis-6" allowfullscreen></iframe>
                  </div>
                </div>
              </div>
            </div>
            <div class="image-4"></div>
            <div class="image-5"></div>
          </div>
        </div>
        <div class="overlap-10">
          <div class="nav1" id="reviewPage">
          
          
          </div>
          <p class="text-wrapper-20">작성하신 관람평은 마이페이지 &gt; 관람 내역에서 확인하실 수 있습니다.</p>
        </div>
        <div class="overlap-11">
          <button type="button" id="latestButton" class="text-wrapper-21">최신순</button>
          <button type="button" id="recommButton" class="text-wrapper-22">공감순</button>
          <button type="button" id="ratingButton" class="text-wrapper-23">평점순</button>
          <div class="text-wrapper-24">|</div>
          <div class="text-wrapper-25">|</div>
        </div>
        <div class="overlap-12" id="reviewListContainer">
        
         </div>
        
        <div class="overlap-18">
          <div class="background-4">
            <div class="overlap-19">
            	  <span class="star" data-rating="1" style="left: -15px;top: 113px;"></span>
            	  <span class="star" data-rating="2" style="left: 31px; top: 46px;"></span>
            	  <span class="star" data-rating="3" style="left: 108px;top: 1px;"></span>
            	  <span class="star" data-rating="4" style="left: 189px;top: 46px;"></span>
            	  <span class="star" data-rating="5" style="left: 235px;top: 113px;"></span>
            </div>
              <div class="overlap-20">
                <img class="element-3" src="${pageContext.request.contextPath}/img/movie/movieDetail/sadImg.png" />
              </div>
            <div class="text-wrapper-36">평점을 입력하세요.</div>
          </div>
          <div class="inputText">
           <img class="frame-12" src="${pageContext.request.contextPath}/img/movie/movieDetail/frame-1.png"/>
           <input type="text" class="text-movie" placeholder="관람평을 작성하세요!"/>
           </div>
           <input type="hidden" id="reviewDate" value="<%= formattedDate %>">
           <input type="hidden" id="movieCd" value="${mvo.movieCd}" />
           <input type="hidden" id="userCode" value="<%= u_code %>"/>
           <input type="hidden" id="userId" value="<%= u_id %>"/>
          <button type="button" class="frame-13" name="sendBtn" id="sendBtn"><div class="text-wrapper-37">관람평 작성</div></button>
        </div>
         <jsp:include page="/jsp/footer/footer.jsp"/>
      </div>
    </div>
    <input type="hidden" id="cPage" value="1"/>
    
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
	var movieId;
	const settings = {
			  async: true,
			  crossDomain: true,
			  url: 'https://api.themoviedb.org/3/search/movie?query=${mvo.movieNm}&include_adult=false&language=ko-KR&page=1',
			  method: 'GET',
			  headers: {
			    accept: 'application/json',
			    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzYzMjcxODhhNjViZTE5YTc4MjhjNzY4Y2NhNzg3NCIsIm5iZiI6MTcxOTg4NjExNC4yNjk4NzEsInN1YiI6IjY2ODM1ZWZmOTg4NzA5NzNhZTJiZWQ2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T8d6wDtewcUbAw4oecS_48QB4EolWbMIODHZ_GxvLXI'
			  }
			};
	
			$.ajax(settings).done(function (response) {
			  
			  var results = response.results;
			  
			  movieId = results[0].id;
			  
			  getMovieVideos(movieId);
			});

	function getMovieVideos(movieId) {
		const settings2 = {
			  async: true,
			  crossDomain: true,
			  url: 'https://api.themoviedb.org/3/movie/'+movieId+'/videos?language=ko-KR',
			  method: 'GET',
			  headers: {
			    accept: 'application/json',
			    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzYzMjcxODhhNjViZTE5YTc4MjhjNzY4Y2NhNzg3NCIsIm5iZiI6MTcxOTg4NjExNC4yNjk4NzEsInN1YiI6IjY2ODM1ZWZmOTg4NzA5NzNhZTJiZWQ2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T8d6wDtewcUbAw4oecS_48QB4EolWbMIODHZ_GxvLXI'
			  }
			};
	
			$.ajax(settings2).done(function (response) {
				var results = response.results;
				
				if(results.length > 3) 
                    size = 3;
				else	
					size = results.length;

			for (var i = 0; i < size; i++) {
				var key = results[i].key;
				var youtubeUrl = "https://www.youtube.com/embed/" + key;

				const iframe = document.getElementById("myIframe" + (i + 1));

				// 선택한 iframe의 src 속성 변경
				if (iframe) {
					iframe.src = youtubeUrl;
				}
			}
			
			$("#trailerLength").text(size);
			
		});
	}
	
		let userCode = document.getElementById("userCode").value;
	
		$(document).ready(function () {
			
			reviewList();
			
		    const stars = $('.overlap-19 .star'); 
		    const imageContainer = $('.overlap-20');
		    const changeImg = imageContainer.find('img');
		    const reviewButton = $('.frame-13');

		    
		    let score = 0;
	
		    stars.each((index, star) => {
		        $(star).on('click', () => { score = index + 1; 
		            changeStars(score);
		            changeImage(score);
		        });
		    });
	
		    function changeStars(score) {
		        stars.removeClass('active');
		        if (score > 0) {
		            stars.slice(0, score).addClass('active');
		        } else {
		            stars.addClass('empty');
		        }
		        console.log(score)
		    }
	
		    function changeImage(score) {
		        const contextPath = "${pageContext.request.contextPath}";
		        changeImg.attr('src', score >= 3 ? contextPath + "/img/movie/movieDetail/happyImg.png" : contextPath + "/img/movie/movieDetail/sadImg.png");
		    }
		    
		    function resetStarRating() {
		    	$('.overlap-19 .star').removeClass('active').addClass('empty'); 
		        
		        const changeImg = $('.overlap-20').find('img');
		        const contextPath = "${pageContext.request.contextPath}";
		        changeImg.attr('src', contextPath + "/img/movie/movieDetail/sadImg.png");

		        score = 0;
		        changeStars(score); 
		    }

		    function clearReviewText() {
		        $('.text-movie').val(''); 
		    }
		    
			$('#sendBtn').on('click', function() {
				  let login = <%= login %>;
				  const reviewText = $('.text-movie').val();
				  
				  if (!login) {
				    alert('리뷰 작성은 로그인이 필요합니다.');
				    window.location.href = "${pageContext.request.contextPath}/jsp/login/login_1.jsp";
				    return;
				  }

				  if (reviewText === '') {
				    alert('관람평을 입력해주세요.');
				    return;
				  }

				  const score = $('.overlap-19 .star.active').length;

				  let movieCd = $('#movieCd').length > 0 ? $('#movieCd').val() : '';
				  let reviewDate = $('#reviewDate').length > 0 ? $('#reviewDate').val() : '';

				  console.log("movieCd:", movieCd);
				  console.log("reviewDate:", reviewDate);
				  console.log($('.text-movie'));
				  console.log($('.text-movie').val());

	  	            
	  	    
		        $.ajax({
		            type: 'POST',
		            url: '${pageContext.request.contextPath}/Controller?type=moviedetail',
		            data: {
		  	            score: score, 
		  	            reviewText: reviewText,
		  	            u_code: userCode,
		  	            movieCd: movieCd, 
		  	            reviewDate: reviewDate
		  	            
		  	        },
		            success: function (response) {
		            	if (response > 0) {
		                 alert('소중한 리뷰가 성공적으로 등록되었습니다.');
		                 reviewList();
		                 
		                 resetStarRating();

		                 clearReviewText();
		                 
		            	} else {
		                    alert('리뷰 등록 중 오류가 발생했습니다.');
		                }
		              
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert('응답 요청에 실패했습니다.');
		                console.error("AJAX 요청 에러:", textStatus, errorThrown);
		                console.log("응답 데이터:", jqXHR.responseText);
		                // 버튼 다시 활성화 (오류 발생 시에도)
		            }
	      });
	   });
		    
				    
		  });
		var cate = 'latest'
		function reviewList2(cPage){
				
		             $("#reviewPage").empty();
		        $.ajax({
		            type: 'GET',
		            url: '${pageContext.request.contextPath}/Controller',
		            data: { u_code: userCode, 
		            		type:'reviewPage',
		            		list:'1',
		            		movieCd: '${param.movieCd}',
		            		cPage: cPage,
		            },
		            success: function (response) {
		             console.log("나는 바보다")
		             $("#cPage").val(cPage);
		             $("#reviewPage").html(response);
		             console.log(response)
		             reviewList();
		             
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert('안나옴.');
		                console.error("AJAX 요청 에러:", textStatus, errorThrown);
		                console.log("응답 데이터:", jqXHR.responseText);
		            }
		        });
		    }
		
				function reviewList() {
			        $.ajax({
			            type: 'GET',
			            url: '${pageContext.request.contextPath}/Controller?type=moviedetail&list=1&movieCd='+${param.movieCd}+'&cate=' + cate,
			            data: { u_code: userCode, cPage: $("#cPage").val() },
			            success: function (response) {
			             console.log(response)
			             console.log("나는 바보다")
			             $("#reviewListContainer").html(response);
			             viewPage();
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			                alert('안나옴.');
			                console.error("AJAX 요청 에러:", textStatus, errorThrown);
			                console.log("응답 데이터:", jqXHR.responseText);
			            }
			        });
			    }
				
				function viewPage(){
					$.ajax({
			            type: 'GET',
			            url: '${pageContext.request.contextPath}/Controller',
			            data: { type: 'reviewPage', list:'1', movieCd: '${param.movieCd}'}
					}).done(function(res){
					$("#reviewPage").empty();
		             $("#reviewPage").html(res);
		             
		           });
				
				}
				$("#latestButton").click(function() {
				    cate = 'latest';
				    reviewList();
				});

				$("#ratingButton").click(function() {
				    cate = 'rating';
				    reviewList();
				});
				
				$("#recommButton").click(function() {
				    cate = 'recomm';
				    reviewList();
				});
				
				
				function deleteReview(r_idx){
					if (confirm('삭제하시겠습니까?')) {
					$.ajax({
			            type: 'POST',
			            url: '${pageContext.request.contextPath}/Controller?type=moviedetail&delete=1&movieCd='+${param.movieCd},
			            data: { r_idx: r_idx },
			            success: function (response) {
			             console.log("나는 멍청이")
			             console.log("응답 데이터:", response);
		                 reviewList();
			             },
			            error: function (jqXHR, textStatus, errorThrown) {
			                console.error("AJAX 요청 에러:", textStatus, errorThrown);
			                console.log("응답 데이터:", jqXHR.responseText);
			            }
			        });
					}
					
				}
				
				function recommReview(r_idx){
					$.ajax({
			            type: 'POST',
			            url: '${pageContext.request.contextPath}/Controller?type=moviedetail&recomm=1&movieCd='+${param.movieCd},
			            data: { r_idx: r_idx },
			            success: function (response) {
			             console.log("메롱")
		                 reviewList();
			             },
			            error: function (jqXHR, textStatus, errorThrown) {
			                console.error("AJAX 요청 에러:", textStatus, errorThrown);
			                console.log("응답 데이터:", jqXHR.responseText);
			            }
			        });
					
				}
				
</script>
  </body>
</html>
