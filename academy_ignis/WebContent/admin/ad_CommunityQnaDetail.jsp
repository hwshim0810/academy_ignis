<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna" %>
<%@ page import="java.util.*" %>
<%
        if ((Integer)session.getAttribute("m_id") <3) 
        	response.sendRedirect("./ad_Login.jsp");
    int pagenum=1;//현재 페이지
    int qb_groupCount=1;
    pagenum=(Integer)request.getAttribute("pagenum");
    qb_groupCount=(Integer)request.getAttribute("qb_groupCount");
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ad_CommunityQnaDetail</title>
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
				<h3>관리자 QNA</h3>
			</div>
			<div class="panel-body">
<table class="table">
    <%List<ig_qna> list=null;
    if(request.getAttribute("qnaDetail")!=null){
    	list = (List)request.getAttribute("qnaDetail");

    	%>
<tbody>
<tr>
<th>말머리</th>
<td>
<div class="form-group">
<%=list.get(0).getQb_mal() %>
</div>
</td>
</tr>
<tr>
<th>작성자</th>
<td>
<div class="form-group">
<%=list.get(0).getM_id()%>
</div>
</td>
</tr>
<tr>
<th>등록일</th>
<td>
<div class="form-group">
<%=list.get(0).getQb_regdate() %>
</div>
</td>
</tr>
<tr>
<th>조회수</th>
<td>
<div class="form-group">
<%=list.get(0).getQb_readcount() %>
</div>
</td>
</tr>
<tr>
<th>제목</th>
<td>
<div class="form-group">
<%=list.get(0).getQb_title() %>
</div>
</td>
</tr>
<tr>
<th>내용</th>
<td>
<div class="form-group">
<%=list.get(0).getQb_content() %>
</div>
</td>
</tr><%}%>
							<tr>
								<td colspan="2" style="text-align : left;">

<a href="qna?login=admin&pagenum=<%=pagenum%>"><button type="button" class="btn btn-info" >목록</button></a>
<%if(list.get(0).getM_id().equals(session.getAttribute("m_id"))&&qb_groupCount!=2) {%>
<a href="qnaUpdateView?login=admin&pagenum=<%=pagenum%>&qb_num=<%=list.get(0).getQb_num()%>"><button type="button" class="btn btn-primary" >수정</button></a>
<button type="button" class="btn btn-danger"  data-toggle="collapse" data-target="#demo1">삭제</button>
<div class="container">
  <div id="demo1" class="collapse">
  <form action="qnaDelete?login=admin&pagenum=<%=pagenum%>&qb_num=<%=list.get(0).getQb_num()%>"  method="post" >
확인을 위하여 비밀번호를 입력해주세요.<input type="password" name="password">
<button type="submit" class="btn btn-danger" >삭제 확인</button>
</form>
  </div>
</div>

<%}else if(list.get(0).getM_id().equals(session.getAttribute("m_id"))&&qb_groupCount==2){%>
<button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#demo2">그룹삭제</button>
<div class="container">
  <div id="demo2" class="collapse">
  <form action="qnaDelete?login=admin&pagenum=<%=pagenum%>&qb_groupnum=<%=list.get(0).getQb_num()%>"  method="post" >
확인을 위하여 비밀번호를 입력해주세요.<input type="password" name="password">
<button type="submit" class="btn btn-danger" >그룹삭제 확인</button>
</form>
  </div>
</div>

<%} %>
<%
if(list.get(0).getQb_num()== list.get(0).getQb_groupnum() 
&&qb_groupCount<2
&&session.getAttribute("m_level").toString().equals("3")){%>
<a href="qnaReplyView?login=admin&qb_num=<%=list.get(0).getQb_num()%>&pagenum=<%=pagenum%>"><button type="button" class="btn btn-danger" >답변</button></a>
<%} %>
								</td>
							</tr>
						</tbody>
					</table>
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