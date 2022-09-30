<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<!-- 0.memberList에서 넘긴 id를 받는다. 
	 1.데이터 베이스에서 id에 맞는 한 명 회원 정보를 가져온다.
	 2.테이블 태그를 이용하여 화면에 회원의 정보를 출력한다. -->
	 
	 <%
	 	String id = request.getParameter("id"); // memberList id를 받아줌 
	 	MemberDAO mdao = new MemberDAO();
	 	MemberBean mbean = mdao.oneSelectMember(id); // 해당하는 id의 회원 정보를 리턴
	 %>
	 
	 <div align="center">
	 
	 <h2>회원 정보 상세 </h2>
	 
	 
		 <table style="width:400" border="1">
		 	<tr height="50">
		 		<td align="center" width="150">아이디</td>
		 		<td width="250"><%=mbean.getId() %></td>
		 	</tr>
		 	<tr height="50">
		 		<td align="center" width="150">이메일</td>
		 		<td width="250"><%=mbean.getEmail() %></td>
		 	</tr>
		 	
		 	<tr height="50">
		 		<td align="center" width="150">전화번호</td>
		 		<td width="250"><%=mbean.getTel() %></td>
		 	</tr>
		 	
		 	 <tr height="50">
		 		<td align="center" width="150">취미</td>
		 		<td width="250"><%=mbean.getHobby() %></td>
		 	</tr>
		 	
		 	<tr height="50">
		 		<td align="center" width="150">직업</td>
		 		<td width="250"><%=mbean.getJob() %></td>
		 	</tr>
		 	
		 	<tr height="50">
		 		<td align="center" width="150">나이</td>
		 		<td width="250"><%=mbean.getAge() %></td>
		 	</tr>
		 	
		 	<tr height="50">
		 		<td align="center" width="150">정보</td>
		 		<td width="250"><%=mbean.getInfo() %></td>
		 	</tr>
		 </table>
	</div>
 	
</body>
</html>