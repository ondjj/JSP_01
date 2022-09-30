<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	request.setCharacterEncoding("UTF-8");
	
// 취미 부분은 별도로 읽어드려 다시 빈클래스에 저장
	String[] hobby = request.getParameterValues("hobby");
// 배열에 있는 내용을 하나의 스트링으로 저장 
	String textHobby = "";

	for(int i = 0; i < hobby.length; i ++){
		textHobby += hobby[i] + " ";
	}
	
%>
<!-- USEBEAN을 이용해 한꺼번에 데이터 받아오기 -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<!-- 맵핑  -->
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
	
<%
	// 기존 취미는 주소 번지가 저장 되기 때문에 위에 배열의 내용을 하나의 스트링으로 저장한 변수를
	// 다시 입력 해준다.
	mbean.setHobby(textHobby);
	
	//데이터 베이스 클래스 객체 생성
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mbean);
	
	// 회원 가입이 완료 되었다면 회원 정보를 보여주는 페이지로 이동 시킴 
	response.sendRedirect("MemberList.jsp");
%>

</body>
</html>