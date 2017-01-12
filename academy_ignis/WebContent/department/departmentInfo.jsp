<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	
	String guideValue = String.valueOf(request.getParameter("guide"));
	System.out.println("guideValue의 값은 " +guideValue);
	String pictureName = null;
	String guideContent = null;
	
	switch (guideValue) {
	case "치아교정" :pictureName="gyoj.jpg";
	guideContent="치아교정 세부 내용"; break;
	
	case "임플란트" :pictureName="imple.jpg";
	guideContent="임플란트 세부 내용"; break;
	
	case "치아미백" :pictureName="mibak.png";
	guideContent="치아미백 세부 내용"; break;
	
	case "일반진료" :pictureName="normal.png";
	guideContent="일반진료 세부 내용"; break;
	
	default : System.out.println(guideValue+"는 오류입니다.");
	}
	%>
	

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
					<div class = "container-large col-xs-12">
						<div class="container-small col-sm-5">
							<img alt="사진" src="/academy_ignis/image/<%=pictureName %>" class="img-rounded img-responsive">
						</div>
						<div class="container-small col-sm-7">
							<label><strong>
							<%=guideContent %>							
							</strong></label>
						</div>
						<a href ="./reserv"><button type="button" class="btn btn-default btn-reserv">예약하기</button></a>&nbsp;			
						<a href="javascript:history.go(-1)"><button type="button" class="btn btn-lg btn-info">뒤로 가기</button></a>
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