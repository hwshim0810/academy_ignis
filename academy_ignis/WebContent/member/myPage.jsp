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
<link rel="stylesheet" href="/academy_ignis/css/common.css?v=2">
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
	<div class="container godo normal w400">
		<%
			pageContext.include("../ignisCompany_info/leftList2.jsp"); 
		%>
		<div class="col-xs-12 col-sm-9 col-md-10">
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
					  <label class="col-md-4 control-label">아이디</label>  
					  <div class="col-md-4">
					 	<h5><%=userInfo.getM_id()%></h5>
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label">이름</label>  
					  <div class="col-md-4">
					  	<h5><%=userInfo.getM_name()%></h5>
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label">가입일</label>  
					  <div class="col-md-4">
					  	<h5><%=userInfo.getM_enterdate()%></h5>
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label">생년월일</label>  
					  <div class="col-md-4">
					  	<h5><%=userInfo.getM_birth()%></h5>
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label">주소</label>  
					  <div class="col-md-7">
					  	<h5><%=userInfo.getM_addr()%></h5>
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label">휴대폰 번호</label>  
					  <div class="col-md-4">
					  	<h5><%=userInfo.getM_phone()%></h5>
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label">Email 주소</label>  
					  <div class="col-md-4">
					  	<h5><%=userInfo.getM_email()%></h5>
					  </div>
					</div>
					
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
					
					<!-- 우편번호 API 이용 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="m_addr">주소*</label>
						<div class="col-md-4">
						  <div class="input-group">
							  <input type="text" id="m_postcode" readonly="readonly" placeholder="우편번호" class="form-control input-md">
							  <div class="input-group-btn">
							  <a class="btn btn-default" id="postSearch2"><i class="glyphicon glyphicon-search"></i></a>
							  </div>
						  </div>
					  </div>
					</div>
					
					<div class="form-group">
						<div class="col-md-4">
						</div>
						<div class="col-md-6">
							<div id="wrap" style="display:none;border:1px solid;width:300px;height:300px;margin:5px 0;position:relative">
							<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
							<input type="text" id="m_addr" name="m_addr" placeholder="주소" class="form-control input-md" value="<%=userInfo.getM_addr()%>">
						</div>
					</div>
					
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/memberJoin_post.js?v=12"></script>
					
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
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/myPage.js?v=6"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=1"></script>
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