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
<title>medical_procedure</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
      	      <div class="well container-fulid" id="wellColor">
	       <h2>IGNIS 치과 진료 절차</h2>
	      </div>
<img alt="진료절차 사진" src="/academy_ignis/image/진료절차.jpg" class="img-rounded img-responsive"">
		</div>
	</div>
</div>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
</body>
</html>