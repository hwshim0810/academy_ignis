<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis 치과</title>
  <link rel="stylesheet" href="/academy_ignis/css/memberJoin.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
	pageContext.include("../header/header.jsp");
%>
<div class="container">
    <h1 class="well">회원 가입</h1>
	<div class="col-lg-12 well">
	<div class="row">
		<form method="post" action="./joinProcess">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-8 form-group">
						<label>아이디
						<input type="text" placeholder="아이디" name="m_id" class="form-control" required="required">
						</label>
					</div>
					<div class="col-xs-4 form-group">
						<button class="btn" value="중복체크"></button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
						<label>비밀번호
						<input type="password" placeholder="아이디" name="m_pass" class="form-control" required="required">
						</label>
					</div>
					<div class="col-xs-4 form-group">
						<label>비밀번호 확인
						<input type="password" placeholder="아이디" name="m_confirm" class="form-control" required="required">
						</label>
					</div>
					<div class="col-xs-4 form-group">
						<span id="passConfirm"></span>
					</div>
				</div>		
				<div class="form-group">
					<label>주소</label>
					<input type="text" name="m_addr" class="d_form large form-control col-sm-12" placeholder="주소">
				</div>	
				<div class="row">
					<div class="col-xs-4 form-group">
						<label>이름
						<input type="text" placeholder="이름" name="m_name" class="form-control">
						</label>
					</div>	
					<div class="col-xs-4 form-group">
						<label>생년월일</label>
						<input type="text" placeholder="생일" name="m_birth" class="form-control">
					</div>	
					<div class="col-xs-4 form-group">
					
					</div>		
				</div>
				<div class="row">
					<div class="col-xs-6 form-group">
						<label>휴대폰번호</label>
						<input type="text" placeholder="휴대폰번호" name="m_phone" class="form-control">
					</div>		
					<div class="col-xs-6 form-group">
						<label>이메일</label>
						<input type="email" placeholder="이메일" name="m_email" class="form-control">
					</div>	
				</div>						
			<input type="submit" class="btn btn-lg btn-info" value="회원가입">				
			</div>
		</form> 
	</div>
	</div>
	</div>
</body>
</html>