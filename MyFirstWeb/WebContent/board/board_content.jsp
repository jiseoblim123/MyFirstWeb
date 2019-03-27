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
	
	<h4>게시글 내용 보기</h4>
	<hr>
	<table width="500" border="1">
		<tr>
			<td width="20%">글 번호</td>
			<td width="30%">${article.bNum}</td>
			
			<td width="20%">조회수</td>
			<td width="30%">${article.bHit}</td>
		</tr>
		<tr>
			<td width="20%">작성자</td>
			<td width="30%">${article.bName}</td>
			
			<td width="20%">작성일</td>
			<td width="30%">${article.bDate}</td>
		</tr>
		<tr>
			<td width="20%">글 제목</td>
			<td colspan="3" width="30%">${article.bTitle}</td>
		</tr>
		<tr>
			<td width="20%">글 내용</td>
			<td colspan="3" width="30%" height="100px">${article.bContent}</td>
		</tr>
		
		<tr>
			<td colspan="4">
				<a href="BList.board">[목록]</a>&nbsp;&nbsp;
				<a href="#">[수정]</a>&nbsp;&nbsp;
				<a href="#">[삭제]</a>&nbsp;&nbsp;
			</td>	
		</tr>
	</table>
	
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>








