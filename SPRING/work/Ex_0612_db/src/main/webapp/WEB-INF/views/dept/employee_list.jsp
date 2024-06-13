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
		<th>사번</th>
		<th>이름</th>
		<th>부서번호</th>
		<th>급여</th>
		</tr>
		<c:forEach var="vo" items="${list}">
		<tr>
		 <td>${vo.employee_id}</td>
		 <td>${vo.first_name}</td>
		 <td>${vo.department_name}</td>
		  <td>${vo.salary}</td>
		 </tr>
			</c:forEach>
			</table>
	</table>
</body>
</html>