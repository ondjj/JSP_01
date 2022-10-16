<%@page import="db.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%

	String id = request.getParameter("id");
	String rday = request.getParameter("rday");
	
	RentCarDAO rdao = new RentCarDAO();
	
	// 예약 삭제 메소드 호출
	rdao.carRemoveReserve(id, rday);
	
	response.sendRedirect("RentCarMain.jsp");
%>

</body>
</html>