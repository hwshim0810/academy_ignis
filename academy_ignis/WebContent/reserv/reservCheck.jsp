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
<title>Insert title here</title>
<style type="text/css">

    footer {
      background-color: #f2f2f2;
      padding: 25px;
      text-align : center;
      margin-bottom : 50px;
    }
    
  </style>
</head>
<body>
<%
	pageContext.include("./header/header.jsp");
	
	if (id != null) { %> 
	<script type="text/javascript" charset="utf-8" src="./script/index_login.js"></script>
<% }%>

	<%= request.getParameter("tooth") %>
	
	<%= request.getParameter("clitext") %>
	<%= request.getParameter("m_id") %>
	<%= request.getParameter("clitime")%>

<%-- Footer 시작 --%>
<%@include file="./footer/footer.jsp" %>
<%-- Footer 종료 --%>
</body>
</html>