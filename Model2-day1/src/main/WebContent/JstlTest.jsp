<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>

<!-- 변수 선언 -->
<%-- <c:set var="i" value="4" /> --%>

<c:if test="${ i > 3 }">

	안녕하세요	
</c:if>

<!-- 반복문 for -->
<!-- 변수 선언  -->
<c:set var="sum" value="0"/>

<c:forEach var="i" begin="1" end="10" step="${ i=i+2 }">

	<c:set var="sum" value="${sum=sum+i }" />

</c:forEach>

${sum }

</body>
</html>