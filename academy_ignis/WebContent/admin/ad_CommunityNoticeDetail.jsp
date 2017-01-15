<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_notice" %>
<%@ page import="java.util.*" %>
<%
    int pagenum=1;//현재 페이지
    pagenum=(Integer)request.getAttribute("pagenum");
	if ((Integer)session.getAttribute("m_level") <3) {
		response.sendRedirect("./login"); return;}
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ad_CommunityNoticeDetail</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>
<%pageContext.include("./manage_Header.jsp");%>
  	<div class="container-fluid main-container">
<%pageContext.include("./manage_sideNav.jsp");%>
  	<div class="col-md-10 content">
 			  <div class="panel panel-default">
			<div class="panel-heading">
				<h3>공지사항</h3>
			</div>
			<div class="panel-body">
<table class="table">
				    <%List<ig_notice> list=null;
				    if(request.getAttribute("noticeDetail")!=null){
				    	list = (List)request.getAttribute("noticeDetail");
				    	%>	
						<tbody>
							<tr>
								<th>제목</th>
								<td>
									<div class="form-group">
										<%=list.get(0).getNb_title() %>
									</div>
								</td>
							</tr>
							<tr>
								<th>공지사항 내용</th>
								<td>
									<div class="form-group">
										<%= list.get(0).getNb_content() %>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align : left;">
									<div class="form-group  ">
							            <div class="col-md-12 ">
<a href="notice?login=admin&pagenum=<%=pagenum%>"><button type="button" class="btn btn-info" >목록</button></a>
<button type="button" class="btn btn-primary" 
onclick="document.location.href='noticeUpdateView?pagenum=<%= pagenum %>&nb_num=<%= list.get(0).getNb_num()%>'">수정</button>
<button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#demo1">삭제</button>
 <form id="demo1"  class="collapse" action="noticeDelete?pagenum=<%=pagenum%>&nb_num=<%=list.get(0).getNb_num()%>"  method="post" >
확인을 위하여 비밀번호를 입력해주세요.<input type="password" name="password"  required="required">
<button type="submit" class="btn btn-danger btn-sm" >공지사항 삭제 확인</button>
</form>
							            </div>
							        </div>
								</td>
							</tr>
						</tbody>
					</table>
			</div>
		</div>
 	</div>
	<%}
		pageContext.include("./manage_Footer.jsp");
	%>
</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
</body>
</html>