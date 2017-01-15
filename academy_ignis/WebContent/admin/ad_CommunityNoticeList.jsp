<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_notice" %>
<%@ page import="java.util.*" %>
<%
if ((Integer)session.getAttribute("m_level") <3) {
	response.sendRedirect("./login"); return;}
%>
    <%
    int pagenum=1;//현재 페이지
	int pagelimit=10;//한 페이지 리스트수
	int pageCount=10;//마지막 페이지
	int startpage=1;//페이지 범위
	int endpage=10;//페이지 범위
	pagelimit=(Integer)request.getAttribute("pagelimit");
	pageCount=(Integer)request.getAttribute("pageCount");
	startpage=(Integer)request.getAttribute("startpage");
	endpage=(Integer)request.getAttribute("endpage");
    if(request.getParameter("pagenum")!=null){
    	pagenum=Integer.parseInt(request.getParameter("pagenum"));
    }else{pagenum=1;}
	if(endpage>pageCount){endpage=pageCount;}
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ad_CommunityNoticeList</title>
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
				<h3>공지사항</h3>
			</div>
			<div class="panel-body">
				<table class="table">
					<caption>공지사항 게시판</caption>
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					    <%List<ig_notice> list=null;
    if(request.getAttribute("noticelist")!=null){
    	list = (List)request.getAttribute("noticelist");
    	
    for(int i=0;i<list.size();i++){
    	list.get(i).getNb_num();
    						%>
						<tr>
							<td><%= list.get(i).getNb_num()%></td>
							<td>
								<a href="noticeDetail?login=admin&pagenum=<%=pagenum%>&nb_num=<%=list.get(i).getNb_num()%> ">
									<%=list.get(i).getNb_title() %>
								</a>
							</td>
							<td><%= list.get(i).getNb_regdate() %></td>
							<td><%= list.get(i).getNb_readcount() %></td>
						</tr>
					<% 
						}
    			}else{
					%>
					<tr>
						<td colspan="4">현재 등록된 수강후기가 없습니다.</td>
					</tr>
					<% } %>
					</tbody>
				</table>
				<div class="form-group">
					<input type="button"  class="btn btn-primary" value="공지사항 등록" 
					onclick="document.location.href='noticeInsertView?login=admin'">
				</div>
  <%String searchOption=null;
  String searchContent=null;
  if(request.getAttribute("searchOption")!=null&&request.getAttribute("searchContent")!=null){
  searchOption=request.getAttribute("searchOption").toString();
	searchContent=request.getAttribute("searchContent").toString();%>
	<ul class="pager">
  <%if(pagenum==1){%>
    <li><a>첫 페이지</a></li>
	  <li><a>◁</a></li>
 <% }else{ %>
   <li><a href="notice?login=admin&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=1">첫 페이지</a></li>
  <li><a href="notice?login=admin&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=<%=pagenum-1%>">◁</a></li>
  <%} %>
 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
 
 <% if(pagelist==pagenum){%>
 <li class="active"><a><%=pagelist %></a></li>
 <%}else{ %>
  <li><a href="notice?login=admin&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=<%=pagelist%>"><%=pagelist %></a></li>
  <%}} %>
  <%if(pagenum==pageCount){ %>
  <li><a>▷</a></li>
  <li><a>마지막 페이지</a></li>
  <%}else{ %>
  <li><a href="notice?login=admin&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=<%=pagenum+1%>">▷</a></li>
  <li><a href="notice?login=admin&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>&pagenum=<%=pageCount%>">마지막 페이지</a></li>
  <%} %>
</ul>
<%}else{ 

%>
  <ul class="pager">
  <%if(pagenum==1){%>
    <li><a>첫 페이지</a></li>
	  <li><a>◁</a></li>
 <% }else{ %>
   <li><a href="notice?login=admin&pagenum=1">첫 페이지</a></li>
  <li><a href="notice?login=admin&pagenum=<%=pagenum-1%>">◁</a></li>
  <%} %>
 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
 
 <% if(pagelist==pagenum){%>
 <li class="active"><a><%=pagelist %></a></li>
 <%}else{ %>
  <li><a href="notice?login=admin&pagenum=<%=pagelist%>"><%=pagelist %></a></li>
  <%}} %>
  <%if(pagenum==pageCount){ %>
  <li><a>▷</a></li>
  <li><a>마지막 페이지</a></li>
  <%}else{ %>
  <li><a href="notice?login=admin&pagenum=<%=pagenum+1%>">▷</a></li>
  <li><a href="notice?login=admin&pagenum=<%=pageCount%>">마지막 페이지</a></li>
  <%} }%>
</ul>
			<form name="search" class="form-inline"  action="notice?login=admin" method="get">
				<label for="sel1">검색 범위</label>
				<select class="form-control" id="searchOption" name="searchOption">
					<option value="nb_all">전체</option>
					<option value="nb_title">제목</option>
					<option value="nb_content">내용</option>
				</select>
				<div class="form-group">
					<label class="sr-only" for="search">검색 내용:</label>
					<input type="text" class="form-control" id="searchContent" name="searchContent" required="required">
				</div>
				<input type="submit" class="btn btn-default"  value="검색" />
<input  type="hidden" name="login"  value="admin"/>
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