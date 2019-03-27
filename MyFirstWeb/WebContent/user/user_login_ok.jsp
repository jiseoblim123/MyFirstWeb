<%@page import="kr.co.koo.member.model.MemberVO"%>
<%@page import="kr.co.koo.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	
	int check = dao.userCheck(id, pw);
	
	if(check == MemberDAO.LOGIN_FAIL_ID) {
%>
	<script>
		alert("아이디가 존재하지 않습니다.")
		history.back()
	</script>
<%
	} else if(check == MemberDAO.LOGIN_FAIL_PW) {
%>
	<script>
		alert("비밀번호가 틀렸습니다.")
		history.back()
	</script>
<%
	} else {
		MemberVO member = dao.getMemberInfo(id);
		
		session.setAttribute("user_name", member.getName());
		session.setAttribute("user_id", id);
		response.sendRedirect("/hong");
	}
%>








