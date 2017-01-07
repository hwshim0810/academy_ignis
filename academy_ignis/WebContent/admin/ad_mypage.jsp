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
				<!-- Text input-->
				<div class="row">
				  <label class="col-md-4 control-label">아이디</label>  
				  <div class="col-md-4">
				  <input type="hidden" name="m_id" id="m_id" value="<%=user.getM_id()%>">
				  <h4><%=user.getM_id() %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="row">
				  <label class="col-md-4 control-label">이름</label>  
				  <div class="col-md-4">
				  <h4><%=user.getM_name() %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="row">
				  <label class="col-md-4 control-label">가입일</label>  
				  <div class="col-md-4">
				  <h4><%=user.getM_enterdate() %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="row">
				  <label class="col-md-4 control-label">생년월일</label>  
				  <div class="col-md-4">
				  <h4><%=user.getM_birth() %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="row">
				  <label class="col-md-4 control-label">주소</label>  
				  <div class="col-md-4">
				  <h4><%=user.getM_addr() %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="row">
				  <label class="col-md-4 control-label">휴대폰 번호</label>  
				  <div class="col-md-4">
				  <h4><%=user.getM_phone() %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="row">
				  <label class="col-md-4 control-label">Email 주소</label>  
				  <div class="col-md-4">
				  <h4><%=user.getM_email() %></h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="row">
				  <label class="col-md-4 control-label">회원 레벨</label>  
				  <div class="col-md-4">
				      <% if (user.getM_level() == 2) { %>		      
						<h4>회원</h4>
				      <% } else { %>
				      	<h4>관리자</h4>
				      <% } %>
				  </div>
				</div>
		
				<!-- Button -->
				<div class="row">
				  <div class="col-md-5">
				  </div>
				  <div class="col-md-7">
				  <a class="btn btn-default" href="/academy_ignis/admin/ad_mypage_update.jsp?userId=<%=userId%>">정보수정</a>
				  <button id="delBtn" class="btn btn-default">정보삭제</button>
				  <button id="backBtn" class="btn btn-default">돌아가기</button>
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
 <script src="/academy_ignis/script/ad_mypage.js?v=1"></script>
</body>
</html>