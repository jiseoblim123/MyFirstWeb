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

	<c:if test="true">
		무조건 출력되는 문장입니다. <br>
	</c:if>
	
	<c:if test="${param.name == '홍길동'}">
		name 파라미터의 값이 ${param.name}입니다.
	</c:if>
	<c:if test="${param.name == '이순신'}">
		name 파라미터의 값이 ${param.name}입니다.
	</c:if>
	
	<%-- 
	<%	if(request.getParameter("name") == "홍길동") { %>
		name 파라미터의 값이 <%= request.getParameter("name") %>입니다.
	<%	} %>
	<%	if(request.getParameter("name") == "이순신") { %>
		name 파라미터의 값이 <%= request.getParameter("name") %>입니다.
	<%	} %>
	--%>
	
	<%-- 
		age 파라미터의 값이 19 이상이면 브라우저에 "성인입니다."를 출력하시고
		19미만이면 "미성년자입니다."를 JSTL태그를 사용하여 출력하세요
	 --%>
	 <c:if test="${param.age >= 19}">
 	  성인입니다.
 	 </c:if>
 	 <c:if test="${param.age < 19}">
 	  미성년자입니다.
 	 </c:if>
	
</body>
</html>







