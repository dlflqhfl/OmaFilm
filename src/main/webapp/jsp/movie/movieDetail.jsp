<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            <div class="link"><div class="text-wrapper-9">예매하기</div></div>
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
        <img class="footer" src="${pageContext.request.contextPath}/img/movie/movieDetail/footer.png" />
        <div class="overlap-10">
          <div class="nav">
            <div class="strong-4"><div class="text-wrapper-17">1</div></div>
            <div class="link-4"><div class="text-wrapper-18">2</div></div>
            <div class="link-5"><div class="text-wrapper-18">3</div></div>
            <div class="link-6"><div class="text-wrapper-18">4</div></div>
            <div class="link-7"><div class="text-wrapper-18">5</div></div>
            <div class="link-8"><div class="text-wrapper-18">6</div></div>
            <div class="link-9"><div class="text-wrapper-18">7</div></div>
            <div class="link-10"><div class="text-wrapper-18">8</div></div>
            <div class="link-11"><div class="text-wrapper-18">9</div></div>
            <div class="link-12"><div class="text-wrapper-19">10</div></div>
            <div class="link-13"></div>
            <div class="link-14"></div>
          </div>
          <p class="text-wrapper-20">작성하신 관람평은 마이페이지 &gt; 관람 내역에서 확인하실 수 있습니다.</p>
        </div>
        <div class="overlap-11">
          <div class="text-wrapper-21">최신순</div>
          <div class="text-wrapper-22">공감순</div>
          <div class="text-wrapper-23">평점순</div>
          <div class="text-wrapper-24">|</div>
          <div class="text-wrapper-25">|</div>
        </div>
        <div class="overlap-12">
          <div class="frame">
            <div class="frame-2"><div class="text-wrapper-26">안녕</div></div>
            <div class="overlap-13">
              <div class="text-wrapper-27">2024-06-14</div>
              <img class="image-6" src="${pageContext.request.contextPath}/img/movie/movieDetail/image-1-6.png" />
            </div>
            <div class="frame-3"><div class="text-wrapper-28">메롱</div></div>
            <img class="img-2" src="${pageContext.request.contextPath}/img/movie/movieDetail/1.svg" />
          </div>
          <div class="frame-4">
            <div class="frame-2"><div class="text-wrapper-26">안녕</div></div>
            <div class="overlap-14">
              <div class="frame-5"><div class="text-wrapper-29">메롱</div></div>
              <img class="rectangle" src="${pageContext.request.contextPath}/img/movie/movieDetail/ectangle-1.svg" />
              <div class="rectangle-2"></div>
              <div class="text-wrapper-30">삭제</div>
              <div class="text-wrapper-31">수정</div>
            </div>
            <img class="element-2" src="${pageContext.request.contextPath}/img/movie/movieDetail/1-1.svg" />
            <div class="overlap-15">
              <div class="text-wrapper-27">2024-06-14</div>
              <img class="image-6" src="${pageContext.request.contextPath}/img/movie/movieDetail/image-1-6.png" />
            </div>
          </div>
          <div class="frame-6">
            <div class="frame-7"><div class="text-wrapper-26">안녕</div></div>
            <div class="frame-8"><div class="text-wrapper-32">메롱</div></div>
            <img class="clip-path-group" src="${pageContext.request.contextPath}/img/movie/movieDetail/clip-path-group-3.png" />
            <div class="overlap-16">
              <div class="text-wrapper-27">2024-06-14</div>
              <img class="image-6" src="${pageContext.request.contextPath}/img/movie/movieDetail/image-1-6.png" />
            </div>
          </div>
          <div class="frame-9">
            <div class="frame-7"><div class="text-wrapper-26">안녕</div></div>
            <div class="frame-8"><div class="text-wrapper-33">메롱</div></div>
            <img class="img-2" src="${pageContext.request.contextPath}/img/movie/movieDetail/clip-path-group-3.png" />
            <div class="overlap-17">
              <div class="text-wrapper-27">2024-06-14</div>
              <img class="image-6" src="${pageContext.request.contextPath}/img/movie/movieDetail/image-1-6.png" />
            </div>
          </div>
          <div class="frame-10">
            <div class="frame-7"><div class="text-wrapper-26">안녕</div></div>
            <div class="frame-8"><div class="text-wrapper-34">메롱</div></div>
            <img class="clip-path-group" src="${pageContext.request.contextPath}/img/movie/movieDetail/clip-path-group-3.png" />
            <div class="overlap-15">
              <div class="text-wrapper-27">2024-06-14</div>
              <img class="image-6" src="${pageContext.request.contextPath}/img/movie/movieDetail/image-1-6.png" />
            </div>
          </div>
          <div class="frame-11">
            <div class="frame-7"><div class="text-wrapper-26">안녕</div></div>
            <div class="frame-8"><div class="text-wrapper-35">메롱</div></div>
            <div class="overlap-17">
              <div class="text-wrapper-27">2024-06-14</div>
              <img class="image-6" src="${pageContext.request.contextPath}/img/movie/movieDetail/image-1-6.png" />
            </div>
            <img class="img-2" src="${pageContext.request.contextPath}/img/movie/movieDetail/clip-path-group-3.png" />
          </div>
        </div>
        <div class="overlap-18">
          <div class="background-4">
            <div class="overlap-19">
              <img class="star" src="${pageContext.request.contextPath}/img/movie/movieDetail/star-4-1.svg" />
              <img class="star-2" src="${pageContext.request.contextPath}/img/movie/movieDetail/star-4-1.svg" />
              <div class="overlap-20">
                <img class="element-3" src="${pageContext.request.contextPath}/img/movie/movieDetail/16132.png" />
                <img class="star-3" src="${pageContext.request.contextPath}/img/movie/movieDetail/star-4-1.svg" />
                <img class="star-4" src="${pageContext.request.contextPath}/img/movie/movieDetail/star-4-1.svg" />
              </div>
              <img class="star-5" src="${pageContext.request.contextPath}/img/movie/movieDetail/star-4-1.svg" />
            </div>
            <div class="text-wrapper-36">평점을 입력하세요.</div>
          </div>
          <img class="frame-12" src="${pageContext.request.contextPath}/img/movie/movieDetail/frame-1.png" />
          <div class="frame-13"><div class="text-wrapper-37">관람평 작성</div></div>
          <p class="text-wrapper-38">영화 관람 후 관람평 작성 시 포인트 500P 적립</p>
        </div>
      </div>
    </div>
    
    
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
</script>
  </body>
</html>
