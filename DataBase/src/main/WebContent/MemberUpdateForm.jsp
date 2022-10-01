<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

	 <%
	 	String id = request.getParameter("id"); // memberList id를 받아줌 
	 	MemberDAO mdao = new MemberDAO();
	 	MemberBean mbean = mdao.oneSelectMember(id); // 해당하는 id의 회원 정보를 리턴
	 %>
	 
	 <div align="center">
	 
	 <h2>회원 정보 수정 </h2>
		 <table style="width:400" border="1">
		 <form action="MemberUpdateProc.jsp" method="post">
		 	<tr height="50">
		 		<td align="center" width="150">아이디</td>
		 		<td width="250"><%=mbean.getId() %></td>
		 	</tr>
		 	<tr height="50">
		 		<td align="center" width="150">이메일</td>
		 		<td width="250"><input type="text" name="emil" value="<%=mbean.getEmail() %>"></td>
		 	</tr>
		 	
		 	<tr height="50">
		 		<td align="center" width="150">전화번호</td>
		 		<td width="250"><input type="tel" name="tel" value="<%=mbean.getTel() %>"></td>
		 	</tr>
		 	
		 	 <tr height="50">
		 		<td align="center" width="150">패스워드</td>
		 		<td width="250"><input type="password" name="pass1"></td>
		 	</tr>
		 
		 	<tr height="50">
		 		<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%= mbean.getId() %>">		 			
		 			<input type="submit" value="회원수정하기"> &nbsp;</form>
		 			<button onclick="location.href='MemberList.jsp'">회원 전체 보기 </button>
		 		</td>
		 	</tr>
		 </table>
	</div>
 	
</body>
</html>