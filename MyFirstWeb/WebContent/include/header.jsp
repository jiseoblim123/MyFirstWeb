<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header start -->

	<div class="brand">My First Web</div> 
	<% if(session.getAttribute("user_id") == null) { %>       
    <div class="address-bar">Let's Start!</div>
	<% } else { %>	
	<div class="address-bar">
		<%= session.getAttribute("user_name") %>
		님 환영합니다!!
	</div>
	<% } %>
    
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
                <a class="navbar-brand" href="/hong">My First Web</a>
            </div>
           
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                	
                    <li>
                        <a href="/hong">HOME</a>
                    </li>
                    <li>
                        <a href="/hong/member/member.jsp">Member</a>
                    </li>
                    <li>
                        <a href="/hong/board/BList.board">BOARD</a>
                    </li>
                    
                    <% if(session.getAttribute("user_id") == null) { %>
                    <li>
                        <a href="/hong/user/user_login.jsp">LOGIN</a>
                    </li>
                    <li>
                        <a href="/hong/user/user_join.jsp" style="color:red">JOIN</a>
                    </li>
                    <% }else { %>
                    <li>
                        <a href="/hong/user/user_mypage.jsp">MYPAGE</a>
                    </li>
                    <li>
                        <a href="/hong/user/user_logout.jsp" style="color:red">LOGOUT</a>
                    </li>
                    <% } %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<!-- header end --> 