<%@page import="kr.co.koo.el.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		EL에서 자바의 클래스 객체를 활용하려면 생성된 객체를
		request, session, application객체에 저장해야합니다.
	*/
	Thermometer tm = new Thermometer();
	request.setAttribute("t", tm);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--el에서 메서드 호출시 매개값으로 문자열을 전달할 때 겹따옴포("")가 아닌 홑따옴표('')를 사용 --%>
	${ t.setDegrees('서울', 14.2) }
	서울 온도: 섭씨 ${ t.getDegrees('서울') }도 // 화씨 ${ t.changeDegree('서울') }도
	
</body>
</html>





