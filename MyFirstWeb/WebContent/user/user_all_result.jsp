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
	
	<h3>전체 회원 정보</h3>
	<hr>
	<c:forEach var="member" items="${member_list}">
		아이디: ${member.id}, 패스워드: ${member.pw}, 이름: ${member.name},
		이메일: ${member.email}, 회원가입일자: ${member.rDate}, 주소: ${member.address}<br>  
		----------------------------------------------------------<br>
	</c:forEach>
	
</body>
</html>







