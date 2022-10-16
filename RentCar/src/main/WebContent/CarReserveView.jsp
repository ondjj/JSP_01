<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentCarDAO"%>
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

	String id = (String)session.getAttribute("id");

	if(id == null){
%>
	<script>
		alert("로그인을 해주세요.")
		location.href='RentCarMain.jsp?Center=MemeberLogin.jsp';
	</script>
<%
	} 
	// 로그인 되어 있는 아이디를 읽어 옴
	RentCarDAO rdao = new RentCarDAO();
	ArrayList<CarViewBean> arr = rdao.getAllReserve(id);
%>

<div align="center">

<table style="width:1000">

	<tr height="100">
		<td align="center" colspan="11">
			<font size="6" color="gray"> 차량 예약 화면 </font>
		</td>
	</tr>
</table>

<table style="width:1000" border="1">
	<tr height="40">
		<td width="150" align="center">이미지</td>
		<td width="150" align="center">이름</td>
		<td width="150" align="center">대여일</td>
		<td width="60" align="center">대여기간</td>
		<td width="100" align="center">금액</td>
		<td width="60" align="center">수량</td>
		<td width="60" align="center">보험</td>
		<td width="60" align="center">wifi</td>
		<td width="60" align="center">seat</td>
		<td width="60" align="center">navi</td>
		<td width="90" align="center">삭제</td>
	</tr>
	
	<% 
	
		for(int i=0; i < arr.size(); i++){
			CarViewBean bean = arr.get(i);
	%>
		<tr height="70" bordercolor="blue">
			<td width="150" align="center"> <img alt="" src="img/<%= bean.getImg()%>" width="120" height="70"> </td>
			<td width="150" align="center"><%= bean.getName() %></td>
			<td width="150" align="center"><%= bean.getRday() %></td>
			<td width="60" align="center"><%= bean.getDday() %></td>
			<td width="100" align="center"><%= bean.getPrice() %>원</td>
			<td width="60" align="center"><%= bean.getQty() %></td>
			<td width="60" align="center"><%= bean.getUsein() %></td>
			<td width="60" align="center"><%= bean.getUsewifi() %></td>
			<td width="60" align="center"><%= bean.getUseseat() %></td>
			<td width="60" align="center"><%= bean.getUsenavi() %></td>
			<td width="90" align="center">
				<button onclick="location.href='CarReserveDel.jsp?id=<%= id%> & rday=<%= bean.getRday()%>'">삭제</button>
			</td>
		</tr>
	<%		
		}
	
	%>
	
</table>
</div>


</body>
</html>