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
								
								</div>							
							</div>
						</div>
						<div class = "container-large col-xs-12">
							<div class="container-median">
								<div class="container-small col-xs-5">
									<img alt="사진" src="/academy_ignis/image/imple.jpg" class="img-rounded img-responsive">
								</div>
								<div class="container-small col-xs-7">
								
								</div>							
							</div>
						</div>
						<div class = "container-large col-xs-12">
							<div class="container-median">
								<div class="container-small col-xs-5">
									<img alt="사진" src="/academy_ignis/image/mibak.png" class="img-rounded img-responsive">
								</div>
								<div class="container-small col-xs-7">
								
								</div>
							</div>
						</div>
						<div class = "container-large col-xs-12">
							<div class="container-median">
								<div class="container-small col-xs-5">
									<img alt="사진" src="/academy_ignis/image/normal.png" class="img-rounded img-responsive">
								</div>
								<div class="container-small col-xs-7">
								
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
	%>
	<script type="text/javascript">
		userLogin();
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		userLogout();
	</script>
	<%  } %>
</body>
</html>