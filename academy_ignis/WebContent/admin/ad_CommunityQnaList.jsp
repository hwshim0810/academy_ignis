<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna" %>
<%@ page import="java.util.*" %>
<%
if (session.getAttribute("m_level")==null||(Integer)session.getAttribute("m_level") <3) 
	response.sendRedirect("./login");
int pagenum=1;//현재 페이지
int pagelimit=10;//한 페이지 리스트수
int pageCount=10;//마지막 페이지
int startpage=1;//페이지 범위
int endpage=10;//페이지 범위
pagelimit=(Integer)request.getAttribute("pagelimit");
pageCount=(Integer)request.getAttribute("pageCount");
startpage=(Integer)request.getAttribute("startpage");
endpage=(Integer)request.getAttribute("endpage");
if(request.getAttribute("pagenum")!=null){
	pagenum=(Integer)request.getAttribute("pagenum");
}
if(request.getParameter("pagenum")!=null){
	pagenum=Integer.parseInt(request.getParameter("pagenum"));
}
if(endpage>pageCount){endpage=pageCount;}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 QNA</title>
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
				관리자 QNA
			</div>
			<div class="panel-body">
				<table class="table">
					<caption>관리자 QNA</caption>
					<thead>
						<tr>
        <th>말머리</th>
        <th>제목</th>
        <th>작성자</th>
        <th>공개여부</th>
        <th>등록일</th>
       <th>조회수</th>
						</tr>
					</thead>
					<tbody>
 <%List<ig_qna> list=null;
    if(request.getAttribute("qnalist")!=null){
    	list = (List)request.getAttribute("qnalist");
    for(int i=0;i<list.size();i++){
    	%>
					<tr>
						<td><%=list.get(i).getQb_mal() %></td>
						<td>
<%if(list.get(i).getQb_num()!= list.get(i).getQb_groupnum()){
%>&nbsp;&nbsp;&nbsp;▶<%}%><a href="qnaDetail?login=admin&qb_num=<%=list.get(i).getQb_num()%>&pagenum=<%=pagenum%>"><%=list.get(i).getQb_title() %>
</a><%if(list.get(i).getQb_private()==1) {%>&nbsp;<span class="glyphicon glyphicon-lock"></span><%} %></td>
						<td><%=list.get(i).getM_id() %></td>
						<td><%if(list.get(i).getQb_private()==0) {%><td>공개</td><%}else{ %><td>비공개</td><%} %></td>
						<td><%=list.get(i).getQb_regdate()%></td>
						<td><%=list.get(i).getQb_readcount()%></td>
					</tr>
<%}}else{ %>
					<tr>
						<td colspan="6">현재 등록된 QNA가 없습니다.</td>
					</tr>

					</tbody>
					<% } %> 
				</table>
				<ul class="pager">
  <%if(pagenum==1){%>
    <li><a>첫 페이지</a></li>
	  <li><a>◁</a></li>
 <% }else{ %>
   <li><a href="qna?login=admin&pagenum=1">첫 페이지</a></li>
  <li><a href="qna?login=admin&pagenum=<%=pagenum-1%>">◁</a></li>
  <%} %>
 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
 <% if(pagelist==pagenum){%>
 <li class="active"><a><%=pagelist %></a></li>
 <%}else{ %>
  <li><a href="qna?login=admin&pagenum=<%=pagelist%>"><%=pagelist %></a></li>
  <%}} %>
  <%if(pagenum==pageCount){ %>
  <li><a>▷</a></li>
  <li><a>마지막 페이지</a></li>
  <%}else{ %>
  <li><a href="qna?login=admin&pagenum=<%=pagenum+1%>">▷</a></li>
  <li><a href="qna?login=admin&pagenum=<%=pageCount%>">마지막 페이지</a></li>
  <%} %>
</ul>
				<form class="form-inline">
				<select name="eventSearch" class="form-control" id="eventSearch">
					<option value="">전체</option>
					<option value="title">제목</option>
					<option value="regdate">등록일</option>
				</select>
				<div class="form-group">
					<input type="text" class="form-control" id="searchEvent">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
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