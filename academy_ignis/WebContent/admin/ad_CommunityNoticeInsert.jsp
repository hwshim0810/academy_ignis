<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	if ((Integer)session.getAttribute("m_level") <3) 
	response.sendRedirect("./login");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice insert용</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
	<style type="text/css">
	  textarea{resize: none;}
	</style>
</head>
<body>
<%pageContext.include("./manage_Header.jsp");%>
  	<div class="container-fluid main-container">
<%pageContext.include("./manage_sideNav.jsp");%>
<div class="col-md-10 content">
 			  <div class="panel panel-default">
			<div class="panel-heading">
				<h3>공지사항 등록</h3>
			</div>
			<div class="panel-body">
				<div class="form-group">
<form class="form-horizontal" alt="insertNotice" method="post" action="./noticeInsert">
<table class="table">
						
<tbody>
<tr>
<th>제목</th>
<td>
<div class="form-group">
<input type="text" name="nb_title"  class="form-control" required="required" />
</div>
</td>
</tr>
<tr>
<th>문내용</th>
<td>
<div class="form-group">
<textarea class="form-control" name="nb_content" rows="5" required="required"></textarea>
</div>
</td>
</tr>
<tr>
<td colspan="2" style="text-align : center;">
<div class="form-group">
<div class="col-md-offset-2 col-md-10">
<button type="submit" class="btn btn-primary">등록</button>
<a href="javascript:history.go(-1)"><button type="button" class="btn btn-danger" >취소</button></a>
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
	<%
		pageContext.include("./manage_Footer.jsp");
	%>
</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
</body>
</html>