<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
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

<!-- 1.데이터 베이스에서 모든 회원의 정보를 가져온다.
	 2.테이블 태그를 이용하여 화면에 회원들의 정보를 출력한다. -->
	 
	 <%
	 	MemberDAO mdao = new MemberDAO();
	 
	 	// 회원들의 정보가 얼마나 저장되어있는지 모르기 때문에 가변 길이인 Vector/ArrayList를 이용하여 데이터를 저장
	 	Vector<MemberBean> vec = mdao.allSelectMember();
	 	
	 	request.setAttribute("vec", vec);
	 %>
	 
	 <div align="center">
	 <h2> 모든 회원 보기 </h2>
	 
	 	<%-- <table style="width:800" border="1">
	 		<tr height="50">
	 			<td align="center" width="150">아이디</td>
	 			<td align="center" width="250">이메일</td>
	 			<td align="center" width="200">전화번호</td>
	 			<td align="center" width="200">취미</td>
	 		</tr>
	 		
	 		<%
	 			for(int i=0; i< vec.size(); i++){
	 				MemberBean bean = vec.get(i); //백터에 담긴 bean 클래스를 하나씩 추출
	 			
	 		%>
	 		
	 		<tr height="50">
	 			<td align="center" width="150">
	 			<a href="MemberInfo.jsp?id=<%= bean.getId() %>">
	 			<%= bean.getId() %></a></td>
	 			<td align="center" width="250"><%= bean.getEmail() %></td>
	 			<td align="center" width="200"><%= bean.getTel() %></td>
	 			<td align="center" width="200"><%= bean.getHobby() %></td>
	 		</tr>
	 		<% } %>
	 	
	 	</table> --%>
	 	<table style="width:800" border="1">
	 	<tr height="50">
	 			<td align="center" width="150">아이디</td>
	 			<td align="center" width="250">이메일</td>
	 			<td align="center" width="200">전화번호</td>
	 			<td align="center" width="200">취미</td>
	 	</tr>
	 	<c:forEach var="bean" items="${vec}">
	 		
	 		<tr height="50">
	 			<td align="center" width="150">
	 			<a href="MemberInfo.jsp?id=${bean.id }">
	 			${bean.id }</a></td>
	 			<td align="center" width="250">${bean.email}</td>
	 			<td align="center" width="200">${bean.tel}</td>
	 			<td align="center" width="200">${bean.hobby}</td>
	 		</tr>
	 	</c:forEach>
	 	</table>
	 </div>
</body>
</html>