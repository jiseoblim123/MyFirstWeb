<%@page import="kr.co.koo.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = (String)session.getAttribute("user_id");
	String pw = request.getParameter("check_pw");
	String name = (String)session.getAttribute("user_name");
	
	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.userCheck(id, pw);	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
   

    <title>Welcome to Lovelyz World</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	 <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
    
    <script src="../js/member.js"></script>

<style>
	.div_center {
		margin-bottom: 20px;
		padding: 30px 15px;
		background: #fff;
		background: rgba(255, 255, 255, 0.9);
	}
</style>

</head>
<body>

<jsp:include page="../include/header.jsp" />
<div class="div_center" align="center">
	
	<% if(check == MemberDAO.LOGIN_SUCCESS) { %>
		<h4><%= name %>(<%= id %>)님 정말로 회원정보를 삭제하시겠습니까?</h4>
		<a href="user_delete_ok.jsp">[예]</a>&nbsp;&nbsp;
		<a href="user_mypage.jsp">[아니오]</a>
	
	<% }else { %>
		<script>
			alert("비밀번호를 다시 확인해주세요.")
			history.back()
		</script>
	<% } %>
	
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>


