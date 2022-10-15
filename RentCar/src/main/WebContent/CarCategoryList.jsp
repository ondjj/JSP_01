<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
//카테고리 분류 값을 받아옴
	int category = Integer.parseInt(request.getParameter("category"));

	String temp = "";
	if(category == 1){
		temp = "소형";
	}else if(category == 2){
		temp = "중형";
	}else if(category == 3){
		temp = "대형";
	}
%>
<div align="center">
<table style="width:1000">
	<tr height="100">
		<td align="center" colspan="3">
			<font size="6" color="gray"> <%=temp%> 자동차</font>
		</td>
	</tr>
<%
	RentCarDAO rdao = new RentCarDAO();
	
	ArrayList<CarListBean> arr = rdao.getCategoryCar(category);
	// tr을 3개씩 보여주고 다시 tr을 실행 할 수 있도록 적용하는 변수 선언
	int j=0;
	for(int i=0; i<arr.size(); i++){
		
		//배열에 저장되어 있는 빈 클래스를 추출
		CarListBean bean = arr.get(i);
		if(j % 3 == 0){
%>
		<tr height="220">
<% } %>
		<td width="333" align="center">
		<a href="RentCarMain.jsp?Center=CarReserveInfo.jsp?no=<%= bean.getNo()%>">
			<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
		</a><p>
		<font size="3" color="gray"><b>차량명 : <%= bean.getName() %></b></font>
		</p></td>
<%
	j=j+1; // j값을 증가 시켜 하나의 행에 총 3개의 차량 정보를 보여주기 위해 증가
	}
%>
</table>
</div>
</body>
</html>