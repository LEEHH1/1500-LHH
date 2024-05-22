<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 표현문(expression)
		웹브라우저에 출력할 부분을 표현
	 -->
	 <p> Today's date : <%= new java.util.Date() %> </p>
	 
	 <%
	 	int a = 10, b= 20, c = 30;
	 %>
	 
	 <%= a+b+c %>
</body>
</html>