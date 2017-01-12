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
<title>Introduction_of_medical_staff</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css">
  <style>
  .list-group-item {text-align:center;}
  </style>
</head>
<body>
<%pageContext.include("../header/header.jsp"); %>
<div class="wrapper">
	<div class="container">
 <%pageContext.include("leftList.jsp"); %>
		<div class="col-xs-12 col-sm-9 col-md-10">
			<h1>1asdfasd fasdf asfsa fasdfsdf</h1>
			<h1>2asdfasd fasdfasf saf asdfsdf</h1>
			<h1>3asdfasdfasdfasfsafa sdfsdf</h1>
			<h1>4asdfasd fasdfa sfsaf asdfsdf</h1>
			<h1>5asdfasd fasdfasfs afasdfsdf</h1>
			<h1>6asdfasdf asdfas fsafasdfsdf</h1>
			<h1>6asdfasdf asdfas fsafasdfsdf</h1>
			
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=2"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>