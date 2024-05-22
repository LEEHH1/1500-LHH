<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 선언문(declaration)
	변수나 메서드를 선언하는 태그 -->
	<%!
	int data = 50; // 변수 선언
	public int sum(int a, int b){// 메서드 정의
		return a +b;
	} 
	%>
	<%
		out.println("Value of the variable is : " +data +"<br>");
		out.println("2 + 3 =" + sum(2,3));
	%>
	
	
	
</body>
</html>