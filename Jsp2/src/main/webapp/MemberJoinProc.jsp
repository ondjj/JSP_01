<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<div align="center">
	<h2> 회원 정보 보기 </h2>
	<%
		request.setCharacterEncoding("UTF-8");
	
	%>
	<!-- request로 넘어온 데이터를 자바 빈즈랑 맵핑 시켜 주는 useBean을 사용 -->
	<!-- 객체생성 MemberBean mbean = new MeberBean() 과 같은 의미 -->
	<jsp:useBean id="mbean" class="bean.MemberBean"> 
	<!-- Jsp 내용을 자바빈 클래스(MemberBean)에 데이터를 맵핑 -->
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
	
	<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/> </h2>
	<h2>당신의 비밀번호는 <jsp:getProperty property="pass1" name="mbean"/> </h2>
	<h2>당신의 이메일은 <jsp:getProperty property="email" name="mbean"/> </h2>
	<h2>당신의 전화번호는 <jsp:getProperty property="tel" name="mbean"/> </h2>
	
	<h2>당신의 주소는 <jsp:getProperty property="address" name="mbean"/> </h2>
	<h2>당신의 주소는 <%=mbean.getAddress() %> </h2>
	
	
</div>

</body>
</html>