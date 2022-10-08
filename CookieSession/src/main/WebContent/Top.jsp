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
	// 로그아웃 클릭시 파라미터를 통해서 로그아웃인지 여부 파악
	String logout = request.getParameter("logout");
	
	if(logout != null){
		// 아이디에 null 값 부여 
		session.setAttribute("id", null);
		// 세션 유지 시간 0
		session.setMaxInactiveInterval(0);
	}
	
	// 세션을 통해 아이디를 읽어 옴
	String id = (String)session.getAttribute("id");

	// 로그인이 되어 있지 않다면 session값이 null 이기 때문에 null 처리 필요 
	
	if(id == null){
		id = "손님";
	}
%>
<!-- Top -->
<table style="width:800">
	<tr height="100">
		<!-- 로고이미지 -->
		<td colspan="2" align="center" width="200">
		<img alt="" src="img/logo.png" width="200" height="70">
		</td>
		<td colspan="4" align="center">
		<font size="10">낭만 캠핑</font>
		</td>
	</tr>
	<tr height="50">
		<td width="100" align="center">텐트</td>
		<td width="100" align="center">의자</td>
		<td width="100" align="center">식기</td>
		<td width="100" align="center">침낭</td>
		<td width="100" align="center">테이블</td>
		<td width="100" align="center">화롯대</td>
		<td width="200" align="center">
		<%
		if(id.equals("손님")){
		%>
			<%= id %> 님 <button onclick="location.href='SessionMain.jsp?center=SessionLoginForm.jsp'">로그인</button>
		<% }else{ %>
			<%= id %> 님<button onclick="location.href='SessionMain.jsp?logout=1'">로그아웃</button>
		<%} %>
		</td>
	</tr>
</table>
</body>
</html>