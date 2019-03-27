<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%-- EL은 내부 결과값이 String타입으로 출력됩니다. --%>
	${10} <br>
	${99.44}<br>
	${"ABC"}<br>
	${true}<br>
	<%= "\"안녕하세요\"" %>

	<hr>

	${ 1+2 }<br>
	${ 1-2 }<br>
	${ 1*2 }<br>
	${ 1/2 }<br>
	${ 1>2 }<br>
	${ 1<2 }<br>
	${ 1==2 }<br>
	${ (1==2) ? "1과 2는 같다" : "1과 2는 다르다" }<br>
	${ (1<2) || (1>2) }
	
	
</body>
</html>