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
<title>abouts_us</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css">



</head>
<style>
	.container-small {border-style:none;}
	img {width:70%; height:20%; }
</style>

<body>
	<%
		pageContext.include("../header/header.jsp");
	%>
	<div class="wrapper">
		<div class="container">
			<%--
				pageContext.include("departmentLeftList.jsp");
			--%>
			<div class="col-xs-12 col-sm-9 col-md-10">
				<div class="container-fulid">
					<div class="col-xs-12 ">

						<div class = "container-large col-xs-12">
							<div class="container-median">
								<div class="container-small col-xs-5">
									<img alt="사진" src="/academy_ignis/image/gyoj.jpg" class="img-rounded img-responsive">
								</div>
								<div class="container-small col-xs-7">
									<label class="sub-letter">
										<strong>
										치아교정이란? 변색 치아를 하얗게 만드는 시술로서	<br>
										 치과에서의 미백(office bleaching)은	15% 고농도		<br>
										15% 고농도의 과산화수소를 사용하여 산화 작용으로	<br>
										착색제 구조를 단순화시켜 미백이 일어나는 것입니다.<br>
										</strong>
									<a href ="./reserv"><button type="button" >예약하기</button></a>							
									<button type="button" class="dentiDetail">상세보기</button>	
									</label>						
								</div>							
							</div>
						</div>
						<div class = "container-large col-xs-12">
							<div class="container-median">
								<div class="container-small col-xs-5">
									<img alt="사진" src="/academy_ignis/image/imple.jpg" class="img-rounded img-responsive">
								</div>
								<div class="container-small col-xs-7">
									<label class="sub-letter">
										<strong>
										치아미백이란? 변색 치아를 하얗게 만드는 시술로서	<br>
										 치과에서의 미백(office bleaching)은	15% 고농도		<br>
										15% 고농도의 과산화수소를 사용하여 산화 작용으로	<br>
										착색제 구조를 단순화시켜 미백이 일어나는 것입니다.<br>
										</strong>
									<a href ="./reserv"><button type="button" >예약하기</button></a>							
									<button type="button" class="dentiDetail">상세보기</button>	
									</label>
								</div>							
							</div>
						</div>
						<div class = "container-large col-xs-12">
							<div class="container-median">
								<div class="container-small col-xs-5">
									<img alt="사진" src="/academy_ignis/image/mibak.png" class="img-rounded img-responsive">
								</div>
								<div class="container-small col-xs-7">
									<label class="sub-letter">
										<strong>
										치아미백이란? 변색 치아를 하얗게 만드는 시술로서	<br>
										 치과에서의 미백(office bleaching)은	15% 고농도		<br>
										15% 고농도의 과산화수소를 사용하여 산화 작용으로	<br>
										착색제 구조를 단순화시켜 미백이 일어나는 것입니다.<br>
										</strong>
									<a href ="./reserv"><button type="button" >예약하기</button></a>							
									<button type="button" class="dentiDetail">상세보기</button>	
									</label>
								</div>
							</div>
						</div>
						<div class = "container-large col-xs-12">
							<div class="container-median">
								<div class="container-small col-xs-5">
									<img alt="사진" src="/academy_ignis/image/normal.png" class="img-rounded img-responsive">
								</div>
								<div class="container-small col-xs-7">
									<label class="sub-letter">
										<strong>
										치아미백이란? 변색 치아를 하얗게 만드는 시술로서	<br>
										 치과에서의 미백(office bleaching)은	15% 고농도		<br>
										15% 고농도의 과산화수소를 사용하여 산화 작용으로	<br>
										착색제 구조를 단순화시켜 미백이 일어나는 것입니다.<br>
										</strong>
									<a href ="./reserv"><button type="button" >예약하기</button></a>							
									<a href ="./departmentInfo"><button type="button" >예약하기</button></a>							
									
									<button type="button" class="dentiDetail">상세보기</button>	
									</label>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="/academy_ignis/script/jquery-confirm.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="/academy_ignis/script/index_login.js?v=2"></script>
		
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>