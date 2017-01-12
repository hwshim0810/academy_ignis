<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<nav class="navbar navbar-default navbar-static-top">
		<div class="wrapper">
			<div class="container-fluid">
				<div class="navbar-header">
					<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a id="logo" href="/academy_ignis" class="navbar-brand">IGNIS Dental Clinic</a>
				</div>
				<div class="collapse navbar-collapse myNavbar">
					<ul class="nav navbar-nav navbar-right nav-pills">
						<!-- 아이디 부여해놓은 부분은 나중에 세션에서 검색해서 .html()로 로그아웃/내정보로 변경 -->
						<li id="login"><a href="/academy_ignis/login">Login</a></li>
						<li id="mypage" class="dropdown"><a href="/academy_ignis/memberJoin?page=home">MemberJoin</a></li>
						<li><a href="/academy_ignis/siteMap.jsp">SiteMap</a></li>
					</ul>
				</div>
			</div>
			<div class="collapse navbar-collapse myNavbar">
				<ul class="nav navbar-nav navbar-left">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">병원소개
						<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="abouts_us">병원소개</a></li>
							<li><a href="Introduction_of_medical_staff">의료진 소개</a></li>
							<li><a href="medical_procedure">진료 절차</a></li>
							<li><a href="map_to_the_ignis">찾아오시는 길</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a class="dropdown-toggle" href="departmentAll">진료과목
						</a>
					</li>
					
					<li><a href="/academy_ignis/reserv">상담 및 예약</a></li>
					
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티
						<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							 <li><a href="/academy_ignis/notice">공지사항</a></li>
					         <li><a href="/academy_ignis/Event?login=member">이벤트</a></li>
					         <li><a href="/academy_ignis/Review?login=member">수술후기</a></li>
					         <li><a href="/academy_ignis/qna">QNA</a></li>
					         <li><a href="/academy_ignis/community/faq.jsp">FAQ</a></li>
						</ul>
					</li>
					
				</ul>
			</div>
		</div>
	</nav>
</header>