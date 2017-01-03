<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if (session.getAttribute("id") != null) 
		id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis 치과</title>
</head>
<body>
<%
	pageContext.include("./header/header.jsp");
	
	if (id != null) { %> 
	<script type="text/javascript" charset="utf-8" src="./script/index_login.js"></script>
<% }%>
</body>
</html>