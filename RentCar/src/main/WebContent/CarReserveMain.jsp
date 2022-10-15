<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<div align="center">

<%
	RentCarDAO rdao = new RentCarDAO();
	ArrayList<CarListBean> arr = rdao.getSelectCar();
%>

<table style="width:1000">
	<tr height="100">
		<td align="center" colspan="3">
			<font size="6" color="gray">최신형 자동차</font>
		</td>
	</tr>
	
	<tr height="240">
	<% for(int i=0; i < arr.size(); i++){
		CarListBean bean = arr.get(i);
	%>
		<td width="333" align="center">
		<a href="RentCarMain.jsp?Center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
			<img alt="" src="img/<%= bean.getImg() %>" width="300" height="200"> 
		</a><p>
		차량명 : <%= bean.getName() %>
		</p>
		</td>
	<%
		}
	%>
	</tr>
</table>

<p>
	<font size="4" color="gray">차량 검색 하기 </font><br><br><br>
	<form action="RentCarMain.jsp?Center=CarCategoryList.jsp" method="post">
	<font size="3" color="gray"><b>차량 검색 하기</b></font> &nbsp; &nbsp;
			<select name="category">
				<option value="1">소형</option>
				<option value="2">중형</option>
				<option value="3">대형</option>
			</select> &nbsp; &nbsp;
			<input type="submit" value="검색"> &nbsp; &nbsp;
	</form>
		<button onclick="location.href='RentCarMain.jsp?Center=CarAllList.jsp'">전체 검색 </button>
</div>
</body>
</html>