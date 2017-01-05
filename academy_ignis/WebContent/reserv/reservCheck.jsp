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
<script type="text/javascript">
	function btnPress1(){
		alert("여기찍혔습니다.1");
	}
	
	function btnPress2(){
		alert("여기찍혔습니다.2");
	}
	
</script>
<body>
<%pageContext.include("../ignisCompany_info/header_noTop.jsp"); %>

<%
	pageContext.include("../header/header.jsp");
	
	if (id != null) { %> 
	<script type="text/javascript" charset="utf-8" src="./script/index_login.js"></script>
<% }%>
 
 


<div class="container text-center">    
	<div class="col-sm-8 col-md-9 well">
	<div class="row">
		<form method="post" action="./reservCheckProcess">
			<div class="col-xs-10">
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>이 름</span></div>
					<div class="col-xs-8 form-group" >
						<input type="text" disabled value="<%= request.getParameter("tooth") %>">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>예약 번호</span></div>
					<div class="col-xs-8 form-group" >
						<input type="text" disabled value="<%= request.getParameter("abc") %>" >
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>진료 항목</span></div>
					<div class="col-xs-8 form-group" >
						<input type="text" disabled value="<%= request.getParameter("tooth") %>">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>환자 ID</span></div>
					<div class="col-xs-8 form-group">
						<input type="text" disabled value="수정 불가">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>진료 시간</span></div>
					<div class="col-xs-8 form-group">
						<input type="text" disabled value="<%= request.getParameter("clitime") %>">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>상담 내용</span></div>
					<div class="col-xs-8 form-group">
						<input type="text" disabled value="<%= request.getParameter("clitext") %>">
					</div>
				</div>		
			<input type="text" name="m_id" value="아이디">
			<input type="button" value="HOME" onclick = "btnPress1()">
			<input type="button" value="예약 완료" onclick = "btnPress2()">				
			<input type="submit" class="btn btn-lg btn-info" value="예약 완료">				
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