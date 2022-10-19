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

<div align="center">
	<h2>모든 회원 보기</h2>
	
	<table style="width:800" border="1" bordercolor="gray">
		<tr height="40">
			<td width="50" align="center">아이디</td>
			<td width="200" align="center">이메일</td>
			<td width="150" align="center">전화</td>
			<td width="150" align="center">취미</td>
			<td width="150" align="center">직업</td>
			<td width="100" align="center">나이</td>
		</tr>
		
		<c:forEach var="bean" items="${arr}">
		
		<tr height="40">
			<td width="50" align="center">${bean.id }</td>
			<td width="200" align="center"><a href="#">${bean.email }</a></td>
			<td width="150" align="center">${bean.tel }</td>
			<td width="150" align="center">${bean.hobby }</td>
			<td width="150" align="center">${bean.job }</td>
			<td width="100" align="center">${bean.age }</td>
		</tr>
		
		</c:forEach>
	
	</table>
	
</div>

</body>
</html>