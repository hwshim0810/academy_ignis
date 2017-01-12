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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ignis 치과</title>
    <link rel="stylesheet" href="/academy_ignis/css/memberJoin.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
    <link href="/academy_ignis/css/messagebox.css" rel="stylesheet">
	<link rel="stylesheet" href="/academy_ignis/css/common.css">
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
				<form id="outForm" class="form-horizontal" method="post" action="/academy_ignis/memDelProcess">
					<fieldset>
						<!-- Form Name -->
						<legend class="sr-only">회원탈퇴</legend>
						
						<!-- Text input-->
						<div class="form-group">
						  <div class="col-xs-12 col-sm-12 col-md-12 alert alert-warning text-center">
						  <input type="hidden" name="m_id" value="<%=id%>">
						  	<h4><strong>주의사항!!</strong></h4>탈퇴시 예약은 모두 취소되고,<br>같은 아이디로 3개월간 재가입하실수 없으며<br>
						  	게시판의 모든 글은 3개월 후 삭제됩니다.
						  </div>
						</div>
						
						<div class="alert alert-info">
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-xs-6 col-sm-5 control-label">회원님의 예약건수</label>  
							  <div class="col-xs-6 col-sm-7 text-center">
							  <h4>현재 <%=resCount %>건</h4>
							  </div>
							</div>
							<br>
							
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-xs-6 col-sm-5 control-label">회원님이 쓴 글 수</label>  
							  <div class="col-xs-6 col-sm-7 text-center">
							  <h4>리뷰 게시판 <%=revCount %>개</h4>
							  </div>
							</div>
							
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-xs-6 col-sm-5 control-label"></label>
							  <div class="col-xs-6 col-sm-7 text-center">
							  <h4>Qna 게시판 <%=qnaCount %>개</h4>
							  </div>
							</div>
							<br>
							
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-xs-6 col-sm-5 control-label" for="textinput">회원님이 쓴 댓글 수</label>  
							  <div class="col-xs-6 col-sm-7 text-center">
							  <h4>리뷰 게시판 <%=revReplyCount %>개</h4>
							  </div>
							</div>
						</div>
						
						<!-- Button -->
						<div class="form-group">
						  <label class="col-xs-6 col-sm-5 control-label"></label>
						  <div class="col-xs-4 col-sm-7">
						    <input id="outBtn" class="btn btn-danger pull-right" value="회원탈퇴">
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
<script src="/academy_ignis/script/messagebox.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/memberOut.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>