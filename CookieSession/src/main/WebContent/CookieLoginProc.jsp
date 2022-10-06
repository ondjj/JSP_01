<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<% request.setCharacterEncoding("UTF-8"); 
	
	// 아이디 저장 체크 박스가 체크 되었는지 판단 여부
	String save = request.getParameter("save");
	// 아이디 값 저장
	String id = request.getParameter("id");
	
	// 체크 되었는지 비교 판단 
	if(save != null){
		// 쿠키를 사용하려면 쿠키 클래스를 생성해주어야 한다. (기본 생성자 없음!)
		// 첫 번째 스트링에는 key 오른쪽은 value 값을 적어준다.
		Cookie cookie = new Cookie("id", id); 
		
		// 쿠키 유효 시간 설정 
		cookie.setMaxAge(60 * 10); // 10분간 유효
		
		// 사용자에게 쿠키 값 넘겨줌
		response.addCookie(cookie); // 쿠키를 넘겨주겠다.
		
		out.write("쿠키 생성 완료 ");
	}else{
		out.write("쿠키 생성 안됨 ");
	}
	%>

</body>
</html>