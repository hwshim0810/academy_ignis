<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	String pageURI = null;
	String login = request.getParameter("login");
	int pagenum = 1;
	
	if (request.getParameter("pagenum") != null) 
		pagenum = Integer.parseInt(request.getParameter("pagenum"));
	
	if (session.getAttribute("m_id") != null) {
		id = (String) session.getAttribute("m_id");
		response.sendRedirect("/academy_ignis");
	}
	
	if(request.getParameter("page")!=null) {
		pageURI = request.getParameter("page");
	} else {
		pageURI = "home";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="/academy_ignis/css/login.css">
	<link rel="stylesheet" href="/academy_ignis/css/common.css?v=3">
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("../header/header.jsp");
%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
<div class="wrapper">
	<div class="container">
	    <div class="row" style="margin:20px 0;">
	    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-2">
				<form role="form" method="post" action="/academy_ignis/loginProcess?page=<%=pageURI%>&pagenum=<%=pagenum%>">
					<fieldset>
						<h2>Ignis치과</h2><br><h4>로그인하시면 모든 서비스가 이용가능합니다.</h4>
						<hr class="colorgraph">
						<div class="form-group">
							<input type="hidden" name="login" value="<%=login%>">
		                    <input type="text" name="m_id" id="m_id" class="form-control input-lg" placeholder="아이디" required="required">
						</div>
						<div class="form-group">
		                    <input type="password" name="m_pass" id="m_pass" class="form-control input-lg" placeholder="비밀번호" required="required">
						</div>
						<!-- 수정예정이니 지우지말것
						<span class="button-checkbox">
							<button type="button" class="btn" data-color="info">Remember Me</button>
		                    <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
							<a href="" class="btn btn-link pull-right">Forgot Password?</a>
						</span> 
						수정예정이니 지우지말것-->
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
		                        <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="./memberJoin" class="btn btn-lg btn-primary btn-block">회원가입</a>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
		                        <br><label>아이디나 비밀번호를 잊어버리셨습니까?</label><br>
		                        <a href="./searchUser">아이디/비밀번호 찾기</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
	    </div>
	</div>
</div>
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/academy_ignis/script/login.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>