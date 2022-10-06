<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
	<h2>세션 로그인 처리 1</h2>
<% 
	request.setCharacterEncoding("utf-8");

	// 사용자로부터 데이터를 읽어들임 
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	// 세션 처리 
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	
	// 세션 유지 시간 설정
	session.setMaxInactiveInterval(60);
%>

<h2>당신의 아이디는 <%= id %> 입니다. 패스워드는 <%= pass %> 입니다. </h2>
<a href="SessionLoginProc2.jsp">다음 페이지로 이동 </a>


</div>
</body>
</html>