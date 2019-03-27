<%@page import="kr.co.koo.member.model.MemberDAO"%>
<%@page import="kr.co.koo.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--

	1. 폼데이터를 처리하세요(useBean을 쓰거나 직접 빈객체를 만들어도 무방).
	2. DAO연동을 통해 updateUser라는 메서드를 호출하여 회원정보 수정을 처리하세요.
	3. 수정 성공시 "회원정보가 수정되었습니다." 출력 후 마이페이지로 안내.
	4. 수정 실패시 "회원정보 수정에 실패했습니다." 출력 후 HOME으로 안내
	5. String sql = "update members set user_name=?, 
	                 user_email=?, user_address=? where user_id=?";
--%>

<%
	request.setCharacterEncoding("utf-8");

	String id = (String)session.getAttribute("user_id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String addr = request.getParameter("address");
	
	MemberVO member = new MemberVO();
	member.setId(id);
	member.setName(name);
	member.setEmail(email);
	member.setAddress(addr);
	
	MemberDAO dao = MemberDAO.getInstance();
	
	int check = dao.updateUser(member);
		
	if(check == MemberDAO.UPDATE_SUCCESS) {
		session.setAttribute("user_name", member.getName());
%>
		<script>
			alert("회원정보가 정상적으로 수정되었습니다.")
			document.location.href="/hong/user/user_mypage.jsp"
		</script>
<%
	}else {
%>
		<script>
			alert("회원정보 수정에 실패했습니다.")
			document.location.href="/hong"
		</script>
<%
	}
%>
	







