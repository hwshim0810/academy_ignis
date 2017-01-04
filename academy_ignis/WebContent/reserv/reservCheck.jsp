<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if (session.getAttribute("id") != null) 
		id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="/academy_ignis/css/index.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
<%pageContext.include("../ignisCompany_info/header_noTop.jsp"); %>

<%
	pageContext.include("../header/header.jsp");
	
	if (id != null) { %> 
	<script type="text/javascript" charset="utf-8" src="./script/index_login.js"></script>
<% }%>
<%pageContext.include("../ignisCompany_info/leftList.jsp"); %>
 <%
   String tooth = request.getParameter("tooth");
   String clitext = request.getParameter("clitext");
   String m_id = request.getParameter("m_id");
   String clitime = request.getParameter("clitime");  %>
   


<div class="container text-center">    
	<div class="col-sm-8 col-md-9 well">
	<div class="row">
		<form method="get" action="#">
			<div class="col-xs-10">
				<div class="row">
				
					
					<div class="col-xs-10 form-group">
						<input type="text" Disabled value=tooth>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-10 form-group">
						<input type="text" Disabled value=clitext>
					</div>
				</div>		
				<div class="row">
					<div class="col-xs-10 form-group">
						<input type="text" Disabled value=m_id>
					</div>	
				</div>
				<div class="row">
					<div class="col-xs-10 form-group">
						<input type="text" Disabled value=clitime>
					</div>	
				</div>						
			<input type="submit" class="btn btn-lg btn-info" value="예약 확인">				
			</div>
		</form> 
	</div>
	</div>
  
  
  
  
  
  
  
  
  
</div>
<%-- Footer 시작 --%>
<%
	pageContext.include("../footer/footer.jsp");
%>
<%-- Footer 종료 --%>
</body>
</html>