<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<div align="center">
<%
	String center = request.getParameter("Center");
	
	// 처음 실행 시에는 center 값이 넘어오지 않기 때문에 반드시 null 처리 필요 
	if(center == null){
		center = "Center.jsp"; // 디폴트 센터 값 부여
	}
%>
<table style="width:1000">
	<!-- Top 부분 -->
	<tr height="120" align="center">
		<td align="center"> <jsp:include page="Top.jsp"></jsp:include> </td>
	</tr>
	
	<!-- Center 부분 -->
	<tr height="500" align="center">
		<td align="center"> <jsp:include page="<%= center %>"></jsp:include> </td>
	</tr>
	
	<!-- Bottom 부분 -->
	<tr height="100" align="center">
		<td align="center"> <jsp:include page="Bottom.jsp"></jsp:include> </td>
	</tr>
</table>
</div>

</body>
</html>