<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if (session.getAttribute("id") != null) 
		id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/index.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  </style>
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("./header/header.jsp");
	
	if (id != null) { %> 
	<script type="text/javascript" charset="utf-8" src="./script/index_login.js"></script>
<% }%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <a href="#">	
        	<img src="/academy_ignis/image/slide1.png" alt="Image">
        </a>    
      </div>
      <div class="item">
        <a href="#">	
        	<img src="/academy_ignis/image/slide2.png" alt="Image">
        </a>     
      </div>
      <div class="item">
        <a href="#">	
        	<img src="/academy_ignis/image/slide3.png" alt="Image">
        </a>      
      </div> 
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
  <br><br>
  <div class="row">
  	<div class="col-sm-6">
      <div class="well">
      	<p>공지사항</p>
      </div>
      <div class="well">
       <p>이벤트</p>
      </div>
    </div>
    <div class="col-sm-6">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>진료안내 (예약)</p>
    </div>
  </div>
</div>
<br>
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="./footer/footer.jsp" %>
<%-- Footer 종료 --%>
</body>
</html>