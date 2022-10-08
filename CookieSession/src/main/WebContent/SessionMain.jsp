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
	// Center 값을 변경 하기 위해서 request객체를 이용해 center값을 받아옴 
	String center = request.getParameter("center");

	// 처음 SessionMain.jsp를 실행하면 null 값이 넘오 오기 때문에 null 처리 필요
	if(center == null){
		center = "Center.jsp";
	}
%>

<div align="center">
	<table border="1" style="width:800">
	<!-- top -->
	<tr height="150">
		<td align="center" colspan="2">
			 <jsp:include page="Top.jsp"/>
		</td>
	</tr>
	<!-- left -->
	<tr height="400">
		<td align="center" width="200">
		 	<jsp:include page="Left.jsp"/>
		 </td>
	<!-- center -->
		<td align="center" width="600">
		 	<jsp:include page="<%= center %>"/>
		 </td>
	</tr>
	<!-- bottom -->
	<tr height="100">
		<td align="center"colspan="2">
	 		<jsp:include page="Bottom.jsp"/>
	 	</td>
	</tr>
	</table>
</div>
</body>
</html>