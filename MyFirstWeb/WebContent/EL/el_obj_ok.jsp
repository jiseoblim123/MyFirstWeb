<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	//String name = request.getParameter("name");
	//String nick = request.getParameter("nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	이름: <%= name %> <br>
	별명: <%= nick %> <br>
	--%>
	
	이름: ${param.name} <br>
	별명: ${param.nick} <br>
	
	
</body>
</html>




