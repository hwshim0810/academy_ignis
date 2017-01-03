<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>abouts_us</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .list-group-item {text-align:center;}
  .br{margin: 100px;}
  </style>
</head>
<body>
<header>
	<nav class="navbar navbar-default ">
		<div class="container-fluid">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand"><img src="../image/logo.jpg" alt="로고" title="로고"></a>
			</div>
			<div class="collapse navbar-collapse myNavbar">
				<ul class="nav navbar-nav navbar-right nav-pills">
				<!-- 아이디 부여해놓은 부분은 나중에 세션에서 검색해서 .html()로 로그아웃/내정보로 변경 -->
					<li id="login"><a href="#">Login</a></li>
					<li id="mypage"><a href="#">MemberJoin</a></li>
					<li><a href="#">SiteMap</a></li>
				</ul>
			</div>
		</div>
       <div class="collapse navbar-collapse myNavbar">
              <ul class="nav navbar-nav navbar-left">
                  <li><a href="#">병원소개</a></li>
                  <li><a href="#">진료과목</a></li>
                  <li><a href="#">상담 및 예약</a></li>
                  <li><a href="#">커뮤니티</a></li>
              </ul>
        </div>
	</nav>
</header>
<%pageContext.include("../header/header.jsp"); %>
  <div class="container">
   <div class="col-xs-12 col-sm-3 col-md-2">
   <ul class="list-group">
  <li class="list-group-item" ><a href="abouts_us">병원소개</a></li>
  <li class="list-group-item" ><a href="Introduction_of_medical_staff">의료진 소개</a></li>
  <li class="list-group-item" ><a href="medical_procedure">진료 절차</a></li>
  <li class="list-group-item " ><a href="map_to_the_ignis">찾아오시는 길</a></li>
</ul>
   </div>
   
      <div class="col-xs-12 col-sm-9 col-md-10">
      <div class="container-fulid">
      <div class="col-xs-12 col-sm-6">
      <img alt="사진" src="../image/01.jpg" class="img-rounded">
      </div>
      <div class="col-xs-12 col-sm-6">
      <ul  class="list-group">
      <li class="list-group-item" >치료 프로세스에 대한 효율성</li>
  <li class="list-group-item" >의료진 소개</li>
  <li class="list-group-item" >진료 절차</li>
  <li class="list-group-item " >찾아오시는 길</li>
  </ul>
   </div>
</div>
<h1>123asdfasdf asdfasdfasdf</h1>
<h1>123asdfasdf asdfasdfasdf</h1>
<h1>123asdfasdf asdfasdfasdf</h1>
<h1>123asdfasdf asdfasdfasdf</h1>
<h1>123asdfasdf asdfasdfasdf</h1>
<h1>123asdfasdf asdfasdfasdf</h1>
</div>
</div>
</body>
</html>