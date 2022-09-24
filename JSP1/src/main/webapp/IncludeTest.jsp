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
	<table style="width:600">
	<!--top 부분 -->
	<tr height="150">
		<td width="600" align="center">
		<%@ include file="Top.jsp" %>
		</td>
	</tr>
	<!-- center 부분 -->
	<tr height="400">
		<td width="600" align="center">
		<img alt="" src="img/img.png" width="400" height="300">
		</td>
	</tr>
	<!-- bottom 부분 -->	
	<tr height="100">
		<td width="600" align="center">
		<%@ include file="Bottom.jsp" %>
		</td>
	</tr>
	</table>
</div>
</body>
</html>