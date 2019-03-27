<%@page import="kr.co.koo.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. 폼데이터를 처리합니다.(예전비번, 바꿀비번)
	2. dao객체를 생성하여 조건문으로 조건식에 예전비번과 아이디정보를 바탕으로
	   해당 비번이 일치하는지부터 확인.
	3. 일치한다면 비밀번호를 바꾸는 로직을 실행(changePassword(??): int). alert으로 
		"비밀번호가 정상적으로 변경되었습니다."출력
	4. 예전비번이 일치하지 않는다면 alert으로 "현재 비밀번호가 다릅니다."
	    출력 후 다시 전페이지로 리다이렉팅함.
	5. 비번 변경 실패시 "비밀번호 변경에 실패했습니다"
	   를 출력하세요.
	6. sql : update members set user_pw=? where user_id=?
--%>
<%
	String oldPw = request.getParameter("old_pw");
	String newPw = request.getParameter("new_pw");
	String id = (String)session.getAttribute("user_id");
	
	MemberDAO dao = MemberDAO.getInstance();
	
	if(dao.userCheck(id, oldPw) == MemberDAO.LOGIN_SUCCESS) {
		
		int check = dao.changePassword(newPw, id);
		if(check == MemberDAO.UPDATE_SUCCESS) {
%>
		<script>
			alert("비밀번호가 정상적으로 변경되었습니다.")
			document.location.href="/hong"
		</script>
<%
		}else {
%>
		<script>
			alert("비밀번호 변경에 실패했습니다.")
			history.back()
		</script>
<%		
		}
	}else {
%>
	<script>
		alert("현재 비밀번호를 다시 확인해주세요.")
		history.back()
	</script>
<%		
	}
%>








