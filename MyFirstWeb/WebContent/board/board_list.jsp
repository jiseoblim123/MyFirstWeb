<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<h3>MyFirstWeb 게시판</h3>
	<hr>
	<table width="500" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>글 번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
		
		<c:forEach var="article" items="${board_list}">
		<tr>
			<td>${article.bNum}</td>
			<td>${article.bName}</td>
			
			<td>
				<a href="BContent.board?bNum=${article.bNum}">
				${article.bTitle}
				</a>
			</td>
			
			<td>${article.bDate}</td>			
			<td>${article.bHit}</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5">
				<a href="bWriteView.board">[글 작성]</a>
			</td>
		</tr>		
	</table>
	
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>






