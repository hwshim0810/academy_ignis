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
  <link rel="stylesheet" href="/academy_ignis/css/login.css">
  <script src="/academy_ignis/script/login.js"></script>
</head>
<body>
<%
	pageContext.include("../header/header.jsp");
%>
<div class="container">

<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" method="post" action="/academy_ignis/findProcess?find=id">
			<fieldset>
				<h2>아이디 찾기</h2>
				<hr class="colorgraph">
				<div class="form-group">
				<label>E-mail로 찾기
                    <input type="email" name="m_email" id="m_email" class="form-control input-lg" placeholder="이메일을 입력해주세요 ex@ex.com" required="required">
                </label>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="찾기">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
					</div>
				</div>
			</fieldset>
		</form>
		<hr class="colorgraph">
		<form role="form" method="post" action="/academy_ignis/findProcess?find=pass">
			<fieldset>
				<h2>비밀번호 찾기</h2>
				<div class="form-group">
				<label>회원정보로 찾기</label>
				<label>아이디
                    <input type="text" name="m_id" id="m_id" class="form-control input-lg" placeholder="아이디를 입력해주세요" required="required">
				</label>
				<label>이름
                    <input type="text" name="m_name" id="m_name" class="form-control input-lg" placeholder="이름을 입력해주세요" required="required">
				</label>
				<label>이메일
                    <input type="email" name="m_email" id="m_email" class="form-control input-lg" placeholder="이메일을 입력해주세요 ex@ex.com" required="required">
				</label>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="찾기">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
					</div>
				</div>
			</fieldset>
		</form>
				<hr class="colorgraph">
	</div>
</div>

</div>

<%
	pageContext.include("../footer/footer.jsp");
%>
</body>
</html>