<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> //AIzaSyBbJ24nMkwcFX3lYpQs4nGVUX8fj3z9yI4

<iframe id="myIframe1" width="300" height="200" allowfullscreen></iframe>
<iframe id="myIframe2" width="300" height="200" allowfullscreen></iframe>
<iframe id="myIframe3" width="300" height="200" allowfullscreen></iframe>
  
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
	var movieId;
	const settings = {
			  async: true,
			  crossDomain: true,
			  url: 'https://api.themoviedb.org/3/search/movie?query=인사이드 아웃 2&include_adult=false&language=ko-KR&page=1',
			  method: 'GET',
			  headers: {
			    accept: 'application/json',
			    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzYzMjcxODhhNjViZTE5YTc4MjhjNzY4Y2NhNzg3NCIsIm5iZiI6MTcxOTg4NjExNC4yNjk4NzEsInN1YiI6IjY2ODM1ZWZmOTg4NzA5NzNhZTJiZWQ2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T8d6wDtewcUbAw4oecS_48QB4EolWbMIODHZ_GxvLXI'
			  }
			};
	
			$.ajax(settings).done(function (response) {
			  
			  var results = response.results;
			  
			  movieId = results[0].id;
			  
			  console.log(movieId);

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
				  
				for(var i=0; i<results.length; i++) {
					var key = results[i].key;
                    var youtubeUrl = "https://www.youtube.com/embed/"+key; 
                    
                    const iframe = document.getElementById("myIframe" + (i + 1)); 

                    // 선택한 iframe의 src 속성 변경
                    if (iframe) {
                      iframe.src = youtubeUrl;
                    }
                    console.log(youtubeUrl);
				}
				
			});
	}
</script>

</body>
</html>