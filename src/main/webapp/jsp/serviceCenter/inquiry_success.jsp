<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!doctype html>
<html> 
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <c:if test="${not empty successMessage}">
    <script>
	    if (confirm("${successMessage}\n\n 나의 문의내역으로 이동하시겠습니까?")) {
	        window.location.href = "Controller?type=inquiry"; 
	      } else {
	    	window.location.href = "Controller?type=sinquiry";
	      }

    </script>
    <c:remove var="successMessage" scope="session" /> 
	</c:if>
</body>
</html>



    