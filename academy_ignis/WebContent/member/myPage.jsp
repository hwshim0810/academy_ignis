<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("./ad_Login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Ignis치과</title>
</head>
<body>
<%
	pageContext.include("../header/header.jsp");
	
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
<div class="container">
	<form class="form-horizontal" method="post" action="./memUpProcess?page=mypage">
	<fieldset>
	
	<!-- Form Name -->
	<legend>회원정보</legend>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">아이디</label>  
	  <div class="col-md-4">
	  <input name="m_id" type="text" placeholder="아이디" class="form-control input-md">
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">이름</label>  
	  <div class="col-md-4">
	  <input name="m_name" type="text" placeholder="이름" class="form-control input-md">
	  </div>
	</div>
	
	<!-- File Button --> 
	<!--  <div class="form-group">
	  <label class="col-md-4 control-label" for="filebutton">photo</label>
	  <div class="col-md-4">
	    <input id="filebutton" name="filebutton" class="input-file" type="file">
	  </div>
	</div> -->
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">생년월일</label>  
	  <div class="col-md-4">
	  <input name="m_birth" type="text" placeholder="생년월일" class="form-control input-md">
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">주소</label>  
	  <div class="col-md-4">
	  <input name="m_addr" type="text" placeholder="주소" class="form-control input-md">
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">휴대폰 번호</label>  
	  <div class="col-md-4">
	  <input name="m_phone" type="tel" placeholder="휴대폰 번호" class="form-control input-md">
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">Email 주소</label>  
	  <div class="col-md-4">
	  <input name="m_email" type="email" placeholder="Email 주소" class="form-control input-md">
	    
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">가입일</label>  
	  <div class="col-md-4">
	  <input name="m_enterdate" type="text" placeholder="가입일" class="form-control input-md">
	  </div>
	</div>
	
	<!-- Select Basic -->
	<!--  <div class="form-group">
	  <label class="col-md-4 control-label" for="selectbasic">Country</label>
	  <div class="col-md-4">
	    <select id="selectbasic" name="selectbasic" class="form-control">
	      <option value="1">Iran</option>
	      <option value="2">USA</option>
	    </select>
	  </div>
	</div>-->
	
	<!-- Select Basic -->
	<!-- <div class="form-group">
	  <label class="col-md-4 control-label" for="selectbasic">gender</label>
	  <div class="col-md-4">
	    <select id="selectbasic" name="selectbasic" class="form-control">
	      <option value="1">Male</option>
	      <option value="2">Female</option>
	    </select>
	  </div>
	</div> -->
	
	
	<!-- Button -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="singlebutton"></label>
	  <div class="col-md-4">
	    <button id="singlebutton" name="singlebutton" type="submit" class="btn btn-primary">수정</button>
	  </div>
	</div>
	
	</fieldset>
	</form>

</div>


<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
</body>
</html>