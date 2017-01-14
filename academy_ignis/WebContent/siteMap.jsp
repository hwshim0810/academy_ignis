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
  </style>
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("./header/header.jsp");
%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
<div class="container" id="wellColor">
	<h2>SITEMAP</h2>
</div>
<div class="wrapper">
	<div class="container text-center" style="max-width : 970px;">    
		<div class="row godo">
			<div class="col-sm-3">
				<div class="container-fulid text-center">
					<h2 class="left">병원소개</h2>
					<ul class="list-unstyled">
						<li><a href="abouts_us">병원소개</a></li>
						<li><a href="medical_procedure">진료 절차</a></li>
						<li><a href="map_to_the_ignis">찾아 오시는 길</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="container-fulid">
					<h2 class="left">진료과목</h2>
					<ul class="list-unstyled">
						<li><a href="/academy_ignis/departmentInfo?guide=gyoj">치아교정</a></li>
						<li><a href="/academy_ignis/departmentInfo?guide=imple">임플란트</a></li>
						<li><a href="/academy_ignis/departmentInfo?guide=mibak">치아미백</a></li>
						<li><a href="/academy_ignis/departmentInfo?guide=normal">일반진료</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="container-fulid">
					<h2 class="left">상담 및 예약</h2>
					<ul class="list-unstyled">
						<li><a href="/academy_ignis/reserv">상담 및 예약</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="container-fulid">
					<h2 class="left">커뮤니티</h2>
					<ul class="list-unstyled">
						<li><a href="/academy_ignis/notice">공지사항</a></li>
						<li><a href="/academy_ignis/Event?login=member">이벤트</a></li>
						<li><a href="/academy_ignis/Review?login=membe">수술후기</a></li>
						<li><a href="/academy_ignis/qna">Q&A</a></li>
						<li><a href="/academy_ignis/community/faq.jsp">자주묻는 질문</a></li>
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