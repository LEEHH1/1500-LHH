<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<% for(int i=1; i <=9; i++){%>
			<tr>
		<%for (int n=2; n <= 9; n++){ %>
			<td>
			<%= n + "x" + i + "=" + n*i %>
			</td>
		<%}%>
		</tr>
	<%}%>
	
	</table>
	
	
	
	
	
	
</body>
</html>