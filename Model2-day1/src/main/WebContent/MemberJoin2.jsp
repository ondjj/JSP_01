<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<div align="center">

<h2>회원 가입 양식</h2>
<form action="Mproc2" method="post">

	<table style="width:400" border="1" bordercolor="gray">
		<tr height="40">
			<td width="150" align="center"> 아이디 </td>
			<td width="250"> <input type="text" name="id"> </td>		
		</tr>
		<tr height="40">
			<td width="150" align="center"> 비밀번호 </td>
			<td width="250"> <input type="password" name="password"> </td>		
		</tr>
		<tr height="40">
			<td width="150" align="center"> 이메일 </td>
			<td width="250"> <input type="email" name="email"> </td>		
		</tr>
		<tr height="40">
			<td width="150" align="center"> 전화번호 </td>
			<td width="250"> <input type="tel" name="tel"> </td>		
		</tr>
		<tr height="40">
			<td width="150" align="center"> 주소 </td>
			<td width="250"> <input type="text" name="address"> </td>		
		</tr>
		<tr height="40">
			<td colspan="2" align="center"> <input type="submit" value="회원가입"> </td>		
		</tr>
	</table>


</form>


</div>
</body>
</html>