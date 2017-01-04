<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("./ad_Login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>
<%
	pageContext.include("./manage_Header.jsp");
%>
  	<div class="container-fluid main-container">
<%
	pageContext.include("./manage_sideNav.jsp");
%>
  		<div class="col-md-10 content">
  			  <div class="panel panel-default">
				<div class="panel-heading">
					Dashboard
				</div>
				<div class="panel-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
					proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>
			</div>
  		</div>
<%
	pageContext.include("./manage_Footer.jsp");
%>
  	</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
</body>
</html>