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
  <link rel="stylesheet" href="/academy_ignis/css/common.css?v=1">
</head>
<body>
<%
	pageContext.include("../header/header.jsp"); 
%>
<div class="wrapper">
	<div class="container">
<%
	pageContext.include("leftList.jsp");
%>
		<div class="col-xs-12 col-sm-9 col-md-10">
			<div></div>
			<div id="map" style="width:100%;height:400px;" alt="찾아오시는 길"></div>
			<h2 class="text-center godo normal w400"  alt="교통수단 안내">교통수단 안내</h2>
			<ul class="nav nav-tabs">
				<li class="active"><a href="#home" data-toggle="tab" alt="지하철">지하철</a></li>
				<li><a href="#menu1" data-toggle="tab" alt="버스">버스</a></li>
				<li><a href="#menu2" data-toggle="tab" alt="자가용">자가용</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="home">
					<p>지하철 2호선</p>
				</div>
				<div class="tab-pane fade" id="menu1">
					<p>버스 번호:146<br>버스 번호:341<br></p>
				</div>
				<div class="tab-pane fade" id="menu2">
					<p>서울 강남구 테헤란로 119<br>
(우) 06134 (135-912) | 대호빌딩</p>
				</div>
			</div>
		</div>
	</div>
</div>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=60028587da6bdcb31d41cbd67222999d"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/map_to_the_ignis.js?v=6"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>