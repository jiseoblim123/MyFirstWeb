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
	
	<h3>게시판 글 작성</h3>
	<hr>
	<form action="bWrite.board" method="post">
		<table width="500" border="1">
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="bName" size="10">
				</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="bTitle" size="20">
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea name="bContent" rows="10" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-default" value="완료" onclick="return confirm('글 작성을 완료하시겠습니까?')"> 
					&nbsp;&nbsp;
					<a href="BList.board">[목록]</a>        
				</td>
			</tr>
		</table>
	</form>	
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>







