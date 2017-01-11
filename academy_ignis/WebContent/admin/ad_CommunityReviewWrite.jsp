<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("./login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
					Review 글쓰기
				</div>
				<div class="panel-body">
					<form class="form-horizontal" name="insertReview" method="post" action="/academy_ignis/ReviewWrite?login=admin" enctype="multipart/form-data">
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
<%
	pageContext.include("./manage_Footer.jsp");
%>
  	</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
</body>
</html>