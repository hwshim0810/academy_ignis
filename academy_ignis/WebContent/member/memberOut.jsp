<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReviewDAO" %>
<% 
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis");
	
	ReviewDAO revDao = new ReviewDAO();
	int revCount = revDao.getReviewCount(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis 치과</title>
  <link rel="stylesheet" href="/academy_ignis/css/memberJoin.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link href="/academy_ignis/css/messagebox.css" rel="stylesheet">
</head>
<body>
<%
	pageContext.include("../header/header.jsp");
%>
<div class="container">
    <h1 class="well">회원 탈퇴</h1>
	<div class="col-lg-12 well">
	
	<div class="row">
		<form id="joinForm" class="form-horizontal" method="post" action="/academy_ignis/joinProcess?page=home">
			<fieldset>
				
				<!-- Form Name -->
				<legend class="sr-only">회원탈퇴</legend>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label">회원님의 예약건수 : </label>  
				  <div class="col-md-4">
				  <h4></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label">회원님이 쓴 글 수 : </label>  
				  <div class="col-md-4">
				  <h4>리뷰 게시판 : <%=revCount %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label"></label>
				  <div class="col-md-4">
				  <h4><%=revCount %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">회원님이 쓴 댓글 수 : </label>  
				  <div class="col-md-4">
				  <h4></h4>
				  </div>
				</div>
				
				<!-- Button -->
				<div class="form-group">
				  <label class="col-md-4 control-label"></label>
				  <div class="col-md-4">
				    <button id="outBtn" name="singlebutton" class="btn btn-primary">회원탈퇴</button>
				  </div>
				</div>
				
			</fieldset>
		</form> 
	</div>
	</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script src="/academy_ignis/script/messagebox.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/memberJoin.js?v=3"></script>
</body>
</html>