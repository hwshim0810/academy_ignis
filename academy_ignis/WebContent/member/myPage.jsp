<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.MemberDAO" %>
<%@ page import="ignis.bean.User" %>
<% 
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis");
	
	MemberDAO memDao = MemberDAO.getInstance();
	User userInfo = memDao.isMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
<link rel="stylesheet" href="/academy_ignis/css/daterangepicker.css">
<link rel="stylesheet" href="/academy_ignis/css/common.css">
<title>Ignis치과</title>
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
		<%
			pageContext.include("../ignisCompany_info/leftList2.jsp"); 
		%>
		<div class="container-fluid">
			<div class="row content">
				<div class="col-sm-9">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab">회원정보 보기</a></li>
							<li><a href="#menu1" data-toggle="tab">비밀번호 변경</a></li>
							<li><a href="#menu2" data-toggle="tab">회원정보 수정</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="home">
								<h3>나의 회원정보</h3>
								<form class="form-horizontal">
								<fieldset>
								
								<!-- Form Name -->
								<legend class="sr-only">회원정보 보기</legend>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">아이디</label>  
								  <div class="col-md-4">
								  <input type="text" placeholder="아이디" readonly="readonly" class="form-control input-md" value="<%=userInfo.getM_id()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">이름</label>  
								  <div class="col-md-4">
								  <input type="text" placeholder="이름" readonly="readonly" class="form-control input-md" value="<%=userInfo.getM_name()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">가입일</label>  
								  <div class="col-md-4">
								  <input type="text" placeholder="가입일" readonly="readonly" class="form-control input-md" value="<%=userInfo.getM_enterdate()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">생년월일</label>  
								  <div class="col-md-4">
								  <input type="text" readonly="readonly" placeholder="생년월일" class="form-control input-md" value="<%=userInfo.getM_birth()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">주소</label>  
								  <div class="col-md-4">
								  <input type="text" readonly="readonly" placeholder="주소" class="form-control input-md" value="<%=userInfo.getM_addr()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">휴대폰 번호</label>  
								  <div class="col-md-4">
								  <input type="tel" readonly="readonly" placeholder="휴대폰 번호" class="form-control input-md" value="<%=userInfo.getM_phone()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">Email 주소</label>  
								  <div class="col-md-4">
								  <input type="email" readonly="readonly" placeholder="Email 주소" class="form-control input-md" value="<%=userInfo.getM_email()%>">
								  </div>
								</div>
								
								<!-- Button 
								<div class="form-group">
								  <label class="col-md-4 control-label" for="singlebutton"></label>
								  <div class="col-md-4">
								    <button name="singlebutton" class="btn btn-primary backBtn">돌아가기</button>
								  </div>
								</div>-->
								
								</fieldset>
								</form>
							</div>
							<div class="tab-pane fade" id="menu1">
								<h3>비밀번호 변경</h3>
								<form class="form-horizontal">
								<fieldset>
								<legend class="sr-only">비밀번호 변경</legend>
								
								<div class="form-group">
									<div class="col-xs-12">
										<p>개인정보 보호를 위하여 비밀번호를 입력해주십시오.</p>
									</div>
								</div>
								
								<div class="form-group">
								<label class="col-md-4 control-label" for="m_pass">비밀번호</label>
									<div class="col-md-4">
										<input name="hidden_id" id="hidden_id" type="hidden" value="<%=id%>">
										<input name="m_pass" id="m_pass" type="password" placeholder="비밀번호" class="form-control input-md">
									</div>
								</div>
								
								<div class="form-group">
								  <label class="col-md-4 control-label" for="singlebutton"></label>
								  <div class="col-md-4">
								    <a id="passChk" class="btn btn-primary">입력하기</a>
								  </div>
								</div>
								
								</fieldset>
								</form>
							</div>
							<div class="tab-pane fade" id="menu2">
								<h3>나의 정보수정</h3>
								<form class="form-horizontal" method="post" action="./memUpProcess?page=mypage">
								<fieldset>
								
								<!-- Form Name -->
								<legend class="sr-only">회원정보</legend>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">아이디</label>  
								  <div class="col-md-4">
								  <input name="m_id" type="text" placeholder="아이디" readonly="readonly" class="form-control input-md" value="<%=userInfo.getM_id()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">이름</label>  
								  <div class="col-md-4">
								  <input name="m_name" type="text" placeholder="이름" readonly="readonly" class="form-control input-md" value="<%=userInfo.getM_name()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">가입일</label>  
								  <div class="col-md-4">
								  <input name="m_enterdate" type="text" placeholder="가입일" readonly="readonly" class="form-control input-md" value="<%=userInfo.getM_enterdate()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="m_birth">생년월일</label>  
								  <div class="col-md-4">
								  <input name="m_birth" id="m_birth" type="text" placeholder="생년월일" class="form-control input-md" value="<%=userInfo.getM_birth()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="m_addr">주소</label>  
								  <div class="col-md-4">
								  <input name="m_addr" id="m_addr" type="text" placeholder="주소" class="form-control input-md" value="<%=userInfo.getM_addr()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="m_phone">휴대폰 번호</label>  
								  <div class="col-md-4">
								  <input name="m_phone" id="m_phone" type="tel" placeholder="휴대폰 번호" class="form-control input-md" value="<%=userInfo.getM_phone()%>">
								  </div>
								</div>
								
								<!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="m_email">Email 주소</label>  
								  <div class="col-md-4">
								  <input name="m_email" id="m_email" type="email" placeholder="Email 주소" class="form-control input-md" value="<%=userInfo.getM_email()%>">
								  </div>
								</div>
								
								<!-- Button -->
								<div class="form-group">
								  <label class="col-md-4 control-label"></label>
								  <div class="col-md-4">
								    <button type="submit" class="btn btn-primary">수정하기</button>
								    <!-- <button id="backBtn" class="btn btn-primary backBtn">돌아가기</button> -->
								  </div>
								</div>
								
								</fieldset>
							</form>
						</div>
					</div>
				</div>
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
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/myPage.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
<script type="text/javascript"src="/academy_ignis/script/moment.js"></script>
<script type="text/javascript"src="/academy_ignis/script/daterangepicker.js"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>