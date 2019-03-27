<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form action="change_pw_ok.jsp" method="post">
		<h3>비밀번호 변경 페이지</h3>
		<hr>
		현재 비밀번호:&nbsp;<input type="password" name="old_pw"><br><br>
		바꿀 비밀번호:&nbsp;<input type="password" name="new_pw"><br><br>
		
		<input type="submit" value="확인" class="btn btn-default">&nbsp;&nbsp;
		<input type="button" value="취소" class="btn btn-default" onclick="javascript:location.href='/hong'">
	</form>
</div>
<jsp:include page="../include/footer.jsp" />


</body>
</html>




