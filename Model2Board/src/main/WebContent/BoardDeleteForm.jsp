<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	
		<h2>게시글 삭제</h2>
		
		<form action="BoardDeleteProcCon.do" method="post">
			<table style="width:600" border="1">
				<tr height="40">
					<td width="120" align="center">패스워드</td>
					<td width="480" colspan="3"> &nbsp; <input type="password" name="password" size="60"></td>
				</tr>
				<tr height="40">
					<td align="center" colspan="4">
						<input type="hidden" name="num" value="${bean.num }">
						<input type="hidden" name="pass" value="${bean.password }">
						
						<input type="submit" value="글 삭제"> &nbsp; &nbsp;
						<input type="button" onclick="location.href='BoardList.jsp'" value="목록보기">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>