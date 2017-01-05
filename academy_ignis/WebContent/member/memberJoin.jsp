<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis 치과</title>
  <link rel="stylesheet" href="/academy_ignis/css/memberJoin.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
</head>
<body>
<%
	pageContext.include("../header/header.jsp");
%>
<div class="container">
    <h1 class="well">회원 가입</h1>
	<div class="col-lg-12 well">
	<div class="row">
		<div class="col-md-4">
				  <button id="idChk" class="btn btn-default">중복체크</button>
		</div>
	</div>
	<div class="row">
		<form class="form-horizontal" method="post" action="./joinProcess?page=home">
			<fieldset>
				
				<!-- Form Name -->
				<legend class="sr-only">회원가입</legend>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">아이디*</label>  
				  <div class="col-md-4">
				  <input id="m_id" name="m_id" type="text" placeholder="아이디" class="form-control input-md">
				  </div>
				  <div class="col-md-4">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">이름*</label>  
				  <div class="col-md-4">
				  <input name="m_name" type="text" placeholder="이름" class="form-control input-md">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">패스워드*</label>  
				  <div class="col-md-4">
				  <input name="m_pass" type="password" placeholder="패스워드" class="form-control input-md">
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">패스워드확인*</label>  
				  <div class="col-md-4">
				  <input name="m_passchk" type="password" placeholder="패스워드" class="form-control input-md">
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
				  <label class="col-md-4 control-label" for="textinput">생년월일*</label>  
				  <div class="col-md-4">
				  <input name="m_birth" type="text" placeholder="생년월일" class="form-control input-md">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">주소*</label>  
				  <div class="col-md-4">
				  <input name="m_addr" type="text" placeholder="주소" class="form-control input-md">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">휴대폰 번호*</label>  
				  <div class="col-md-4">
				  <input name="m_phone" type="tel" placeholder="숫자만 입력해주세요" class="form-control input-md">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">Email 주소*</label>  
				  <div class="col-md-4">
				  <input name="m_email" type="email" placeholder="exam@example.com" class="form-control input-md">
				    
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
				
				<div class="form-group">
				  <div class="col-md-4">
				  </div>
				  <label class="col-md-4 control-label" for="textinput">(*는 필수입력란입니다.)</label> 
				</div>
				
				<!-- Button -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="singlebutton"></label>
				  <div class="col-md-4">
				    <button id="singlebutton" name="singlebutton" type="submit" class="btn btn-primary">회원가입</button>
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
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/memberJoin.js"></script>
</body>
</html>