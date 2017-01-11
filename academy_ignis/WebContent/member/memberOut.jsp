<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReviewDAO" %>
<%@ page import="ignis.dao.QnaDAO" %>
<%@ page import="ignis.dao.ReservDAO" %>
<% 
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis");
	
	ReviewDAO revDao = new ReviewDAO();
	ReservDAO resDao = new ReservDAO();
	QnaDAO qnaDao = new QnaDAO();
	int resCount = resDao.getResCount(id);
	int revCount = revDao.getReviewCount(id);
	int revReplyCount = revDao.getReplyCount(id);
	int qnaCount = qnaDao.getQnaCount(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis 치과</title>
  <link rel="stylesheet" href="/academy_ignis/css/memberJoin.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link href="/academy_ignis/css/messagebox.css" rel="stylesheet">
</head>
<body>
<%
	pageContext.include("../header/header.jsp");
%>
<div class="container">
    <h1 class="well">회원 탈퇴</h1>
	<div class="col-lg-12 well">
	
	<div class="row">
		<form id="outForm" class="form-horizontal" method="post" action="/academy_ignis/memDelProcess">
			<fieldset>
				
				<!-- Form Name -->
				<legend class="sr-only">회원탈퇴</legend>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label">주의사항</label>  
				  <div class="col-md-4">
				  <input type="hidden" name="m_id" value="<%=id%>">
				  <h4>탈퇴시 예약은 모두 취소되며, 같은 아이디로 3개월간 재가입하실수 없으며</h4>
				  <h4>게시판의 모든 글은 3개월 후 삭제됩니다.</h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label">회원님의 예약건수 : </label>  
				  <div class="col-md-4">
				  <h4>현재 : <%=resCount %>건</h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label">회원님이 쓴 글 수 : </label>  
				  <div class="col-md-4">
				  <h4>리뷰 게시판 : <%=revCount %>개</h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label"></label>
				  <div class="col-md-4">
				  <h4>Qna 게시판 : <%=qnaCount %>개</h4>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">회원님이 쓴 댓글 수 : </label>  
				  <div class="col-md-4">
				  <h4>리뷰 게시판 : <%=revReplyCount %>개</h4>
				  </div>
				</div>
				
				<!-- Button -->
				<div class="form-group">
				  <label class="col-md-4 control-label"></label>
				  <div class="col-md-4">
				    <button id="outBtn" name="singlebutton" class="btn btn-primary">회원탈퇴</button>
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
<script src="/academy_ignis/script/messagebox.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/memberOut.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
</body>
</html>