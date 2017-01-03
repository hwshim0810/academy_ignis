<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="./" class="navbar-brand"><img src="../image/logo.jpg" alt="로고" title="로고"></a>
			</div>
			<div class="collapse navbar-collapse myNavbar">
				<ul class="nav navbar-nav navbar-right nav-pills">
				<!-- 아이디 부여해놓은 부분은 나중에 세션에서 검색해서 .html()로 로그아웃/내정보로 변경 -->
					<li id="login"><a href="./login">Login</a></li>
					<li id="mypage"><a href="./memberJoin">MemberJoin</a></li>
					<li><a href="#">SiteMap</a></li>
				</ul>
			</div>
		</div>
       <div class="collapse navbar-collapse myNavbar">
              <ul class="nav navbar-nav navbar-left">
                  <li><a href="abouts_us">병원소개</a></li>
                  <li><a href="#">진료과목</a></li>
                  <li><a href="#">상담 및 예약</a></li>
                  <li><a href="notice">커뮤니티</a></li>
              </ul>
        </div>
	</nav>
</header>