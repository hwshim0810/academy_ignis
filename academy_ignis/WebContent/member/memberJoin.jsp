<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis 치과</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel = "stylesheet" type = "text/css" href="../script/memberJoin.js">
</head>
<body>
<div class="container">
    <h1 class="well">회원 가입</h1>
	<div class="col-lg-12 well">
	<div class="row">
		<form>
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
					<div class="row">
						<div class="col-xs-8 form-group">
						<input type="text" id="sample3_postcode" placeholder="우편번호" class="form-control">
						</div>
						<div class="col-xs-4 form-group">
						<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" class="form-control">
						</div>
					</div>
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
					<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					<input type="text" id="sample3_address" class="d_form large form-control col-sm-12" placeholder="주소">
				</div>	
				<div class="row">
					<div class="col-xs-4 form-group">
						<label>이름
						<input type="text" placeholder="이름" class="form-control">
						</label>
					</div>	
					<div class="col-xs-4 form-group">
						<label>State</label>
						<input type="text" placeholder="Enter State Name Here.." class="form-control">
					</div>	
					<div class="col-xs-4 form-group">
						<label>Zip</label>
						<input type="text" placeholder="Enter Zip Code Here.." class="form-control">
					</div>		
				</div>
				<div class="row">
					<div class="col-xs-6 form-group">
						<label>휴대폰번호</label>
						<input type="text" placeholder="휴대폰번호" class="form-control">
					</div>		
					<div class="col-xs-6 form-group">
						<label>이메일</label>
						<input type="email" placeholder="이메일" class="form-control">
					</div>	
				</div>						
			<button type="button" class="btn btn-lg btn-info">Submit</button>					
			</div>
		</form> 
	</div>
	</div>
	</div>
</body>
</html>