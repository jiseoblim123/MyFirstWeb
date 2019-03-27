<%@page import="kr.co.koo.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%--MemberVO member = new MemberVO(); --%>    
<jsp:useBean id="member" class="kr.co.koo.member.model.MemberVO"/>
<jsp:setProperty name="member" property="*"/>

<%
	MemberDAO dao = MemberDAO.getInstance();
	
	int checkId = dao.confirmId(member.getId());

	if(checkId == MemberDAO.MEMBER_EXISTENT) {
%>
	<script>
		alert("이미 가입된 ID입니다.")
		history.back()
	</script>
<%
	}else {	

		int rn = dao.insertMember(member);
		if(rn == MemberDAO.JOIN_SUCCESS) {
%>
		<script>
			alert("회원가입을 축하합니다.")
			document.location.href="/hong"
		</script>
<%
		} else {
%>
		<script>
			alert("회원가입에 실패했습니다.")
			document.location.href="/hong/user/user_join.jsp"
		</script>
<%
		}
	}	
%>











