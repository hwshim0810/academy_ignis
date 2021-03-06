<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.ReviewBiz" %>
<%@ page import = "ignis.bean.ig_review" %>
<%@ page import = "ignis.dao.ReviewDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id= null;
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis/member/login.jsp");
%>
<% 
	ReviewDAO reviewDao = ReviewDAO.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이그니스 치과</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
		<%pageContext.include("leftList.jsp"); %> 
		<div class="container-fluid">
			<div class="row content">
				<div class="col-sm-9">
					<h3>Review</h3>
					<hr>
					<form class="form-horizontal" name="insertReview" method="post" action="/academy_ignis/ReviewWrite?login=member" enctype="multipart/form-data">
						<table class="table">
							<caption>Review 등록</caption>
							<tbody>
								<tr>
									<th>제목</th>
									<td>
										<div class="form-group">
											<input type="text" class="form-control" name="rb_title" id="rb_title">
										</div>
									</td>
								</tr>
								<tr>
									<th>글쓴이</th>
									<td>
										<div class="form-group">
											<input type="text" class="form-control" name="rb_writer" id="rb_writer" value="<%=id%>" readonly>
										</div>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td>
										<div class="form-group">
											<textarea class="form-control" name="rb_content" id="rb_content"></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td>
										<div class="form-group">
											<input type="file" accept=".gif, .jpg, .png" class="form-control" name="rb_file" id="rb_file" >
										</div>
									</td>
								</tr>
								<tr>
										<td colspan="2" style="text-align : center;">
											<div class="form-group">
									            <div class="col-md-offset-2 col-md-10">
									                <button type="button" class="btn btn-danger"  onclick="document.location.href='/academy_ignis/Review?login=member'">취소</button>
									            	<button type="submit" class="btn btn-primary">등록</button>
									            </div>
									        </div>
										</td>
									</tr>
							</tbody>
						</table>
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
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=2"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>