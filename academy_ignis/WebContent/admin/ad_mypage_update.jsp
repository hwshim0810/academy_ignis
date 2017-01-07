<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.MemberDAO" %>
<%@ page import="ignis.bean.User" %>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis/admin/ad_Login.jsp");
	 
	String userId = null;
	
	if (request.getParameter("userId") != null)
		userId = request.getParameter("userId");
	else
		response.sendRedirect("/academy_ignis/admin/ad_Login.jsp");
	
	MemberDAO memDao = MemberDAO.getInstance();
	User user = memDao.isMember(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link href="/academy_ignis/css/messagebox.css" rel="stylesheet">
  <link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>
<%
	pageContext.include("./manage_Header.jsp");
%>
  	<div class="container-fluid main-container">
<%
	pageContext.include("./manage_sideNav.jsp");
%>
	<div class="col-md-10 content">
		 <div class="panel panel-default">
		 	<div class="panel-heading">
				<h2 id="memTitle">회원 정보</h2>
				<h5>&nbsp;현재 보고있는 회원 : <%=user.getM_name() %>&nbsp;님</h5>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" method="post" action="/academy_ignis/memUpProcess?page=admin">
				<fieldset>
				
				<!-- Form Name -->
				<legend class="sr-only">회원정보</legend>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">아이디</label>  
				  <div class="col-md-4">
				  <input name="m_id" type="text" placeholder="아이디" readonly="readonly" class="form-control input-md" value="<%=user.getM_id()%>">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">가입일</label>  
				  <div class="col-md-4">
				  <input name="m_enterdate" type="text" placeholder="가입일" readonly="readonly" class="form-control input-md" value="<%=user.getM_enterdate()%>">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">이름</label>  
				  <div class="col-md-4">
				  <input name="m_name" type="text" placeholder="이름" class="form-control input-md" value="<%=user.getM_name()%>">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">생년월일</label>  
				  <div class="col-md-4">
				  <input name="m_birth" type="text" placeholder="생년월일" class="form-control input-md" value="<%=user.getM_birth()%>">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">주소</label>  
				  <div class="col-md-4">
				  <input name="m_addr" type="text" placeholder="주소" class="form-control input-md" value="<%=user.getM_addr()%>">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">휴대폰 번호</label>  
				  <div class="col-md-4">
				  <input name="m_phone" type="tel" placeholder="휴대폰 번호" class="form-control input-md" value="<%=user.getM_phone()%>">
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">Email 주소</label>  
				  <div class="col-md-4">
				  <input name="m_email" type="email" placeholder="Email 주소" class="form-control input-md" value="<%=user.getM_email()%>">
				    
				  </div>
				</div>
				
				<!-- Select Basic -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="selectbasic">회원레벨</label>
				  <div class="col-md-4">
				    <select id="selectbasic" name="m_level" class="form-control">
				      <% if (user.getM_level() == 2) { %>		      
				      	<option value="2" selected="selected">회원</option>
				      	<option value="3">관리자</option>
				      <% } else { %>
				      	<option value="2">회원</option>
				      	<option value="3" selected="selected">관리자</option>
				      <% } %>
				    </select>
				  </div>
				</div>
				
				<!-- Button -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="singlebutton"></label>
				  <div class="col-md-4">
				    <button id="singlebutton" name="singlebutton" type="submit" class="btn btn-primary">수정하기</button>
				  </div>
				</div>
				
				</fieldset>
				</form>
				<div class="row">
					<div class="col-xs-2">
						<input class="btn btn-default" value="돌아가기">
					</div>
				</div>
			</div>
		</div>
	</div>
		
<%
	pageContext.include("./manage_Footer.jsp");
%>
  	</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
 <script src="/academy_ignis/script/messagebox.js" type="text/javascript"></script>
 <script src="/academy_ignis/script/ad_mypage_update.js"></script>
</body>
</html>