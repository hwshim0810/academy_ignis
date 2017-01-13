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
<body>
<%pageContext.include("../header/header.jsp"); %>
<div class="wrapper">
  <div class="container">
<%pageContext.include("leftList.jsp"); %>
	<div class="col-xs-12 col-sm-9 col-md-10">
			<div class="container-fulid">
				<div class="col-xs-12 " >
					<img alt="사진" src="/academy_ignis/image/01.jpg" class="img-rounded img-responsive" >
				</div>
				<div class="col-xs-12"></div>
			</div>
			<h3>
늘 가족처럼 열린 마음으로 <br>
늘 친절한 상담으로<br>
늘 정성을 다하는 진료로<br>
늘 연구하고 진보하는 자세로 다가가겠습니다.<br>
또한 증상만을 해결하려는 단편적인 진료가 아닌<br>
이후에 나타날 수 있는 모든 상황과 질병의 예방까지 고려한 포괄적인<br>
진료를 하겠습니다.
</h3>
		</div>
	</div>
</div>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
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