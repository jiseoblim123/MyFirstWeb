<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--
		choose태그를 활용하여 90점이 넘으면 "당신의 학점은 A입니다."를 출력,
		80점 이상이면 B, 70점 이상이면 C, 60점 이상이면 D, 그 이외에는 F를 출력하세요.
	 --%>
	 <c:choose>
	 	<c:when test="${param.point >= 90}">
	 		<h4>당신의 학점은 A입니다.</h4>
	 	</c:when>
	 	<c:when test="${param.point >= 80}">
	 		<h4>당신의 학점은 B입니다.</h4>
	 	</c:when>
	 	<c:when test="${param.point >= 70}">
	 		<h4>당신의 학점은 C입니다.</h4>
	 	</c:when>
	 	<c:when test="${param.point >= 60}">
	 		<h4>당신의 학점은 D입니다.</h4>
	 	</c:when>
	 	<c:otherwise>
	 		<h4>당신의 학점은 F입니다.</h4>
	 	</c:otherwise>
	 </c:choose>
	
</body>
</html>







