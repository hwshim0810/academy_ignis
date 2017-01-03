<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  	<style type="text/css">
  	    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;   
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
      text-align : center;
      margin-bottom : 50px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }


	/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>
<%pageContext.include("header_noTop.jsp"); %>
<%pageContext.include("../header/header.jsp"); %>
 <div class="container">
 <%--
 <%pageContext.include("leftList.jsp"); %>
  --%>
 </div>
 
<%-- Body 영역 --%>
<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-3">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="#section1">공지사항</a></li>
				<li class="active"><a href="#">이벤트</a></li>
				<li><a href="#">치료후기</a></li>
				<li><a href="#">Q&A</a></li>
				<li><a href="#">FAQ</a></li>
			</ul><br>
			<%-- 검색기능
			<div class="input-group">
			<input type="text" class="form-control" placeholder="Search Blog..">
			<span class="input-group-btn">
			<button class="btn btn-default" type="button">
			 <span class="glyphicon glyphicon-search"></span>
			</button>
			</span>
			</div>
			 --%>
		</div>
		
		
		<div class="col-sm-9">
			<h4>EVENT</h4>
			<hr>
		</div>
	</div>
</div>

<%-- Body 영역 --%>
 <%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
</body>
</html>