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
	request.setCharacterEncoding("utf-8");

	// 사용자로부터 데이터를 읽어들임 
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	// 세션 처리 
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	
	// 세션 유지 시간 설정
	session.setMaxInactiveInterval(60 * 2);
	
	response.sendRedirect("SessionMain.jsp");
%>
</body>
</html>