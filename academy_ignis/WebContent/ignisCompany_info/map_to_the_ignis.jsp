<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map_to_the_ignis</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <style>
  .list-group-item {text-align:center;}
  </style>
</head>
<body>
<%pageContext.include("../header/header.jsp"); %>
  <div class="container">
  <%pageContext.include("leftList.jsp"); %>
   
      <div class="col-xs-12 col-sm-9 col-md-10"  style="background-color:orange;">
<h1>11 a</h1>
</div>
</div>
</body>
</html>