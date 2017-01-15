<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_notice" %>
<%@ page import="java.util.*" %>
 <%
	if ((Integer)session.getAttribute("m_level") <3) {
		response.sendRedirect("./login"); return;}
  int pagenum=1;//현재 페이지
  if(request.getAttribute("pagenum")!=null){
		pagenum=(Integer)request.getAttribute("pagenum");
	}
	if(request.getParameter("pagenum")!=null){
		pagenum=Integer.parseInt(request.getParameter("pagenum"));
	}
	   List<ig_notice> list=null;
	    if(request.getAttribute("noticeDetail")!=null){
	    	list = (List)request.getAttribute("noticeDetail");
	    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Update</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
	<style type="text/css">
	  textarea{resize: none;}
	</style>
</head>
<body>
<%
	pageContext.include("./manage_Header.jsp");
%>
  	<div class="container-fluid main-container">
<%
	pageContext.include("./manage_sideNav.jsp");
%><div class="col-md-10 content">
 			  <div class="panel panel-default">
			<div class="panel-heading">
				<h3>공지사항 수정</h3>
			</div>
			<div class="panel-body">
				<div class="form-group">
<form class="form-horizontal" alt="insertNotice" method="post" action="./noticeUpdate?pagenum=<%=pagenum %>&nb_num=<%=list.get(0).getNb_num()%>">
<table class="table">
						
<tbody>
<tr>
<th>제목</th>
<td>
<div class="form-group">
<input type="text" name="nb_title"  class="form-control" value="<%=list.get(0).getNb_title() %>"  required="required"/>
</div>
</td>
</tr>
<tr>
<th>문내용</th>
<td>
<div class="form-group">
<textarea class="form-control" name="nb_content" rows="5" required="required"><%= list.get(0).getNb_content() %></textarea>
</div>
</td>
</tr>
<tr>
<th>비밀번호</th>
<td>
  <div class="form-group">
    <input type="password" class="form-control" name="password" required="required" />
  </div>
</td>
</tr>
<tr>
<td colspan="2" style="text-align : center;">
<div class="form-group">
<div class="col-md-offset-2 col-md-10">
<button type="submit" class="btn btn-primary">수정</button>
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