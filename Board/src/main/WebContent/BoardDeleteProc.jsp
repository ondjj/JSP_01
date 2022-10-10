<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%
		String pass = request.getParameter("password");
		int num = Integer.parseInt(request.getParameter("num"));
		
		// 데이터 베이스 연결
		
		BoardDAO bdao = new BoardDAO();
		String password = bdao.getPass(num);
		
		// 기존 패스워드 값과 delete 폼에서 받은 패스워드 값 비교
		if(pass.equals(password)){
			bdao.deleteBoard(num); 
			
			response.sendRedirect("BoardList.jsp");
		}else{
	%>
	<script type="text/javascript">
		alert("패스워드가 틀렸습니다. 패스워드를 확인해주세요.");
		history.go(-1)
	</script>			
<% 	} %>
</body>
</html>