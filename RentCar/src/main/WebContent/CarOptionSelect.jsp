<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	int no = Integer.parseInt(request.getParameter("no"));

	// 수량 
	int qty = Integer.parseInt(request.getParameter("qty"));
	
	// 이미지 
	String img = request.getParameter("img");
%>

<div align="center">
<form action="RentCarMain.jsp?Center=CarReserveResult.jsp" method="post">
<table style="width:1000">

	<tr height=100>
		<td align="center" colspan="3">
			<font size="6" color="gray"> 옵션 선택 </font>
		</td>
	</tr>
	
	<tr>
		<td rowspan="7" width="500" align="center">
			<img alt="" src="img/<%= img %>" width="450">
		</td>
		<td width="250" align="center"> 대여기간 </td>
		<td width="250" align="center"> 
			<select name="dday">
				<option value="1">1 일</option>
				<option value="2">2 일</option>
				<option value="3">3 일</option>
				<option value="4">4 일</option>
				<option value="5">5 일</option>
				<option value="6">6 일</option>
				<option value="7">7 일</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="250" align="center"> 대여일 </td>
		<td width="250" align="center"> <input type="date" name="rday" size="15"> </td>
	</tr>
	<tr>
		<td width="250" align="center"> 보험적용 </td>
		<td width="250" align="center">
			<select name="usein">
				<option value="1">적용 (1일 1만원)</option>
				<option value="2">미적용</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="250" align="center"> Wifi </td>
		<td width="250" align="center">
			<select name="usewifi">
				<option value="1">적용 (1일 1만원)</option>
				<option value="2">미적용</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="250" align="center"> Navi </td>
		<td width="250" align="center">
			<select name="usenavi">
				<option value="1">적용 (무료)</option>
				<option value="2">미적용</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="250" align="center"> 베이비 시트 </td>
		<td width="250" align="center">
			<select name="useseat">
				<option value="1">적용 (1일 1만원)</option>
				<option value="2">미적용</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2"> <input type="submit" value="차량 예약"> </td>
	</tr>
		
	
</table>
</form>
</div>

</body>
</html>