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
	
	<c:choose>
		<c:when test="${param.name == 'kim'}">
			<h4>당신의 이름은 kim입니다.</h4>
		</c:when>
		<c:when test="${param.age > 19}">
			<h4>당신은 성인입니다.</h4>
		</c:when>
		<c:otherwise>
			<h4>당신의 이름은 kim이 아니고 미성년자입니다.</h4>
		</c:otherwise>		
	</c:choose>
	
	<% if(request.getParameter("name") == "kim") { %>
		<h4>당신의 이름은 kim입니다.</h4>
	<% }else if(Integer.parseInt(request.getParameter("age")) > 19) { %>
		<h4>당신은 성인입니다.</h4>
	<% }else { %>
		<h4>당신의 이름은 kim이 아니고 미성년자입니다.</h4>
	<% } %>
</body>
</html>





