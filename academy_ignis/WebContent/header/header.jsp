<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	div.divNav { 
	  	position : relative;
	  	display : block;
	  	z-index : 1;
	  }
	div.wrapper { 
		position : relative;
		max-width : 970px; 
		margin : 0 auto;
		padding : 0;
		overflow : hidden;	
	}
</style>
<header>
	<nav class="navbar navbar-default navbar-fixed-top" style="background-color : #fff!Important;">
		<div class="wrapper">
			<div class="container-fluid">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="/academy_ignis" class="navbar-brand">
					<%-- <img src="/academy_ignis/image/logo.jpg" alt="로고" title="로고"/> --%>
					IGNIS
				</a>
			</div>
			<div class="collapse navbar-collapse myNavbar">
				<ul class="nav navbar-nav navbar-right nav-pills">
				<!-- 아이디 부여해놓은 부분은 나중에 세션에서 검색해서 .html()로 로그아웃/내정보로 변경 -->
					<li id="login"><a href="/academy_ignis/login">Login</a></li>
					<li id="mypage"><a href="/academy_ignis/memberJoin?page=home">MemberJoin</a></li>
					<li><a href="#">SiteMap</a></li>
				</ul>
			</div>
		</div>
       <div class="collapse navbar-collapse myNavbar">
              <ul class="nav navbar-nav navbar-left">
                  <li><a href="abouts_us">병원소개</a></li>
                  <li><a href="#">진료과목</a></li>
                  <li><a href="reserv">상담 및 예약</a></li>
                  <li><a href="/academy_ignis/notice">커뮤니티</a></li>
              </ul>
        </div>
		</div>
	</nav>
	<%-- nav 영역 맞추기 --%>
	<div class="divNav">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="collapse navbar-collapse myNavbar">
					<ul class="nav navbar-nav navbar-right nav-pills">
						<li><a href="#">　</a></li>
					</ul>
				</div>
			</div>
	       <div class="collapse navbar-collapse myNavbar">
	              <ul class="nav navbar-nav navbar-left">
	                  <li><a href="#">　</a></li>  
	              </ul>
	        </div>
		</nav>
	</div>
	<%-- nav 영역 맞추기 --%>
</header>