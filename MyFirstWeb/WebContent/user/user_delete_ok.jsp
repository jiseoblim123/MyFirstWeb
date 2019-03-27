<%@page import="kr.co.koo.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	1. DAO 연동후 dao의 삭제메서드(deleteUser) 호출
	2. 호출결과에 따라 삭제 성공시 세션을 삭제하고 알림창으로 삭제완료를 알림. home으로 안내
	3. 삭제실패시 알림창으로 실패를 알리고 마이페이지로 리다이렉팅.
*/
	String id = (String)session.getAttribute("user_id");

	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.deleteUser(id);
	
	if(check == MemberDAO.DELETE_SUCCESS) {
		
		session.invalidate();
%>
		<script>
			alert("회원 탈퇴가 정상처리되었습니다.")
			document.location.href='/hong'
		</script>
<%
	}else {
%>
		<script>
			alert("회원 탈퇴에 실패했습니다.")
			document.location.href='/hong/user/user_mypage.jsp'
		</script>
<%
	}
%>









