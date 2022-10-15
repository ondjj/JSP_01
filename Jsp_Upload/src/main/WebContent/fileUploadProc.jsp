<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("utf-8");
	// 프로젝트 내에 만들어질 폴더를 저장할 이름 변수 선언
	String realFolder = "";
	// 실제 만들어질 폴더명을 설정
	String saveFolder = "/upload";
	// 한글 설정
	String encType = "utf-8";
	// 저장될 파일 사이즈 설정
	int maxSize = 10 * 1024 * 1024;
	
	// 파일이 저장될 경로값을 읽어오는 객체
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	try{
		// 클라이언트로부터 넘어온 데이터를 저장해주는 객체
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy()); // DefaultFileRenamePolicy -> 파일이름자동변경
%>
	당신의 이름은 <%= multi.getParameter("name") %>
<%
	out.println(realFolder);
	}catch(Exception e){
		e.printStackTrace();
	}
%>

</body>
</html>