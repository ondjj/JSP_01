<%@page import="model.MemberDAO"%>
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
	%>
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
	
	<%
	
		MemberDAO mdao = new MemberDAO();
		
		// 스트링 타입으로 저장되어 있는 패스워드를 가져온다.
		String pass = mdao.getPass(mbean.getId());
		
		// 수정하기위해서 작성한 패스워드값과 기존 데이터 베이스에서 가져온 패스워드 값을 비교
		if(mbean.getPass1().equals(pass)){
			
			//MemberDAO 클래스의 회원 삭제 메소드를 호출
			mdao.deleteMember(mbean.getId());
			
			response.sendRedirect("MemberList.jsp");
			
		}else{
	%>
		<script type="text/javascript">
			alert("패스워드가 맞지 않습니다. 다시 확인해 주세요.")
			history.go(-1);
		</script>
	<%
		}
	%>

</body>
</html>