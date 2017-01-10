<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="/academy_ignis/css/index.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>
function btnPress1(){
	checkFrom.submit();
}

function btnPress2(url){
	location.href=url;

}

</script>
	
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
	%>



<div class="container text-center">    
	<div class="col-sm-8 col-md-9 well">
	<div class="row">
		<form method="post" action="./reservCheckProcess" name="checkFrom">
			<div class="col-xs-10">
				<div class="row">
					<div class="col-xs-4 form-group">
					<div class="col-xs-8 form-group" >
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>예약 번호</span></div>
					<div class="col-xs-8 form-group" >
						<input type="text" value="hi"  name="abc">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>진료 항목</span></div>
					<div class="col-xs-8 form-group" >
						<input type="text" value="hi"  name="tooth">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>환자 ID</span></div>
					<div class="col-xs-8 form-group">
						<input type="text" value="수정 불가" name="bcd">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>진료 시간</span></div>
					<div class="col-xs-8 form-group">
						<input type="text" value="hi" name="clitime">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>상담 내용</span></div>
					<div class="col-xs-8 form-group">
						<input type="text" value="hi" name="clitext">
					</div>
				</div>		
			<input type="button" value="수정 완료" onclick = "btnPress1()">
			<input type="button" value="수정 취소" onclick = "btnPress2('reservCheck.jsp')">				
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