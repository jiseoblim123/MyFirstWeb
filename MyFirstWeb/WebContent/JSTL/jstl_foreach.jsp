<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	<%
		int sum = 0;
		for(int num=1; num<=100; num+=2) {
			sum = sum + num;
		}
		out.println("1부터 100까지의 누적합계: " + sum);
	%>
	--%>
	<h4>1부터 100까지의 홀수의 합</h4>
	<hr>
	<c:set var="sum" value="0" />
	<c:forEach var="num" begin="1" end="100" step="2">
		<c:set var="sum" value="${sum + num}" />
	</c:forEach>
	1부터 100까지의 누적 홀수합: ${sum} <br>
	
	<h4>구구단 4단</h4>
	<hr>
	<%-- 
	<%
		for(int hang=1; hang<=9; hang++) {
	%>
		4 x <%= hang %> = <%= 4 * hang %><br>
	<%
		}
	%>
	--%>
	
	<c:forEach var="hang" begin="1" end="9">
		4 x ${hang} = ${4*hang} <br>
	</c:forEach>
	
	<hr>
	
	<%-- 모든 구구단을 출력하세요. --%>
	
	<c:forEach var="dan" begin="2" end="9">
		구구단 ${dan}단 <hr>
		<c:forEach var="hang" begin="1" end="9">
			${dan} x ${hang} = ${dan*hang} <br>
		</c:forEach>
		<hr>
	</c:forEach>
	
	<hr>
	<h4>배열의 값 출력하기</h4>
	
	<c:set var="arr" value="<%= new int[] {1,2,3,4,5} %>" />
	<c:forEach var="i" items="${arr}">
		${i} &nbsp;
	</c:forEach>
	<%-- 
		int[] arr = {1,2,3,4,5}; 
		for(int i : arr) {
			out.println(i + "&nbsp;");
		}
	--%>
	
	
		
	
</body>
</html>











