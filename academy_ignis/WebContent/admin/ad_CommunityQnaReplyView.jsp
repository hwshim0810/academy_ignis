<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna" %>
<%@ page import="java.util.*" %>
  <%
	if ((Integer)session.getAttribute("m_level") <3) {
		response.sendRedirect("./login"); return;}
  int pagenum=1;//현재 페이지
  if(request.getAttribute("pagenum")!=null){
		pagenum=(Integer)request.getAttribute("pagenum");
	}

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ad_CommunityQnaReplyView</title>
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
				<h3>QNA 답변</h3>
			</div>
			<div class="panel-body">
				<div class="form-group">
<form class="form-horizontal" alt="qnaReply" method="post" action="./qnaReply?login=admin&pagenum=<%=pagenum%>">
<table class="table">
						
<tbody>
 <%  List<ig_qna> list=null;
    if(request.getAttribute("qnaDetail")!=null){
    	list = (List)request.getAttribute("qnaDetail");
    	%>

<tr>
<th>문의 작성자</th>
<td>
<div class="form-group">
<input type="text" class="form-control"  value="<%=list.get(0).getM_id()%>" readonly="readonly"/>
</div>
</td>
</tr>
<tr>
<th>문의 제목</th>
<td>
<div class="form-group">
<input type="text"  class="form-control"  value="<%=list.get(0).getQb_title() %>" readonly="readonly"/>
</div>
</td>
</tr>
<tr>
<th>답변 제목</th>
<td>
<div class="form-group">
<input type="text" name="qb_title"  class="form-control"  value="Re:<%=list.get(0).getQb_title()%>" required="required"/>
</div>
</td>
</tr>
<tr>
<th>답변</th>
<td>
<div class="form-group">
<textarea class="form-control" name="qb_content" rows="5" required="required"></textarea>
</div>
</td>
</tr>
<tr>
<td colspan="2" style="text-align : center;">
<div class="form-group">
<div class="col-md-offset-2 col-md-10">
<button type="submit" class="btn btn-primary">등록</button>
<a href="javascript:history.go(-1)"><button type="button" class="btn btn-danger" >취소</button></a>
<input  type="hidden" name="qb_private"  value="<%=list.get(0).getQb_private()%>"/>
<input  type="hidden" name="qb_groupnum"  value="<%=list.get(0).getQb_num()%>"/>
<input  type="hidden" name="qb_mal"  value="<%=list.get(0).getQb_mal()%>"/>
<input  type="hidden" name="qb_num"  value="<%=list.get(0).getQb_num()%>"/>
</div>
 </div>
</td>
</tr>
</tbody>
</table>
<%} %>
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