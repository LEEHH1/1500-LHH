<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
		<th>부서번호</th>
		<th>부서명</th>
		<th>부서위치</th>
		</tr>
		<c:forEach var="vo" items="${list }">
		<tr>
		 <td>${vo.deptno }</td>
		 <td>${vo.deptno }</td>
		 <td>${vo.deptno }</td>
		 </tr>
			</c:forEach>
			</tabl>
	</table>
</body>
</html>