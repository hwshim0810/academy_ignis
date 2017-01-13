<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css?v=1">
  <link rel="stylesheet" href="/academy_ignis/css/index.css">
  <style>
  #wellColor {background-color:#f2f2f2 ;margin-bottom: 0;}
  ul {text-align: left;}
  .left {text-align: left;}
  </style>
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("./header/header.jsp");
%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
	      <div class="well container" id="wellColor">
	       <h2>SITEMAP</h2>
	      </div>
<div class="wrapper">
	<div class="container text-center" style="max-width : 970px;">    
	  <div class="row">
	  	<div class="col-sm-3">
<div class="container-fulid">
  <h2 class="left">병원소개</h2>
<ul class="list-group">
<div class="row"></div>
<p><a href="abouts_us"><h4>병원소개</h4></a></p>
<p><a href="medical_procedure"><h4>진료 절차</h4></a></p>
<p><a href="map_to_the_ignis"><h4>찾아 오시는 길</h4></a></p>
</ul>
</div>
</div>
	  	<div class="col-sm-3">
<div class="container-fulid">
  <h2 class="left">진료과목</h2>
<ul class="list-group">
<div class="row"></div>
<p><a href="/academy_ignis/departmentInfo?guide=gyoj"><h4>치아교정</h4></a></p>
<p><a href="/academy_ignis/departmentInfo?guide=imple"><h4>임플란트</h4></a></p>
<p><a href="/academy_ignis/departmentInfo?guide=mibak"><h4>치아미백</h4></a></p>
<p><a href="/academy_ignis/departmentInfo?guide=normal"><h4>일반진료</h4></a></p>
</ul>
</div>
</div>
	  	<div class="col-sm-3">
<div class="container-fulid">
  <h2 class="left">상담 및 예약</h2>
<ul class="list-group">
<div class="row"></div>
<p><a href="/academy_ignis/reserv"><h4>상담 및 예약</h4></a></p>
</ul>
</div>
</div>
	  	<div class="col-sm-3">
<div class="container-fulid">
  <h2 class="left">커뮤니티</h2>
<ul class="list-group">
<div class="row"></div>
<p><a href="/academy_ignis/notice"><h4>공지사항</h4></a></p>
<p><a href="/academy_ignis/Event?login=member"><h4>이벤트</h4></a></p>
<p><a href="/academy_ignis/Review?login=membe"><h4>수술후기</h4></a></p>
<p><a href="/academy_ignis/qna"><h4>Q&A</h4></a></p>
<p><a href="/academy_ignis/community/faq.jsp"><h4>자주묻는 질문</h4></a></p>
</ul>
</div>
</div>
	  </div>
	</div>	
</div>
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="./footer/footer.jsp" %>
<%-- Footer 종료 --%>
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