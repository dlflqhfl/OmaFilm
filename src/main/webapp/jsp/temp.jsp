<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="movies-container"></div>
	<!-- 포스터, 줄거리, 동영상 -->
  
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
    const settings = {
    		  async: true,
    		  crossDomain: true,
    		  url: 'https://api.themoviedb.org/3/movie/popular?language=ko-KR&page=1&region=KR',
    		  method: 'GET',
    		  headers: {
    		    accept: 'application/json',
    		    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzYzMjcxODhhNjViZTE5YTc4MjhjNzY4Y2NhNzg3NCIsIm5iZiI6MTcxOTg4NjExNC4yNjk4NzEsInN1YiI6IjY2ODM1ZWZmOTg4NzA5NzNhZTJiZWQ2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T8d6wDtewcUbAw4oecS_48QB4EolWbMIODHZ_GxvLXI'
    		  }
    		};

    		$.ajax(settings).done(function (response) {
    			  var results = response.results;
    			  var posterMap = new Map();
    			  var overviewMap = new Map();
    			  var img_basic = "https://image.tmdb.org/t/p/w500/";

    			  for (var i = 0; i < results.length; i++) {
    			    var movie = results[i];
    			    var fullPosterPath = img_basic + movie.poster_path;
    			    posterMap.set(movie.title, fullPosterPath);
    			    overviewMap.set(movie.title, movie.overview);
    			  }

    			  //console.log("Poster Map:", posterMap);
    			  //console.log("Overview Map:", overviewMap);

    			  // Poster Map을 순회하면서 key와 value를 출력하는 예시
    			  posterMap.forEach(function(posterPath, title) {
    			    console.log('Title: ' + title + ', Poster Path: ' + posterPath);
    			  });

    			  // Overview Map을 순회하면서 key와 value를 출력하는 예시
    			  overviewMap.forEach(function(overview, title) {
    			    console.log('Title: ' + title + ', Overview: ' + overview);
    			  });
    		});
    </script>
</body>
</html>