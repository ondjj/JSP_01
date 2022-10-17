<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	int i = 3;
	
	out.println("i = " + i);
	
	request.setAttribute("ia", 3);

%>

	<p> i = <%= i %>
	
	<p>	i = ${ ia > 4 }

</body>
</html>