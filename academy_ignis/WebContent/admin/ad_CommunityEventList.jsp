<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.EventBiz" %>
<%@ page import = "ignis.bean.ig_event" %>
<%@ page import = "ignis.dao.EventDAO" %>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("./ad_Login.jsp");
	
	EventDAO eventDao = EventDAO.getInstance();
	int totalRows = eventDao.getListCount(); // 전체 게시물 갯수
%>
<%@include file="../paging/getPageNum.jsp" %>
<%
List<ig_event> list = eventDao.eventList(begin, end);
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
				EVENT
			</div>
			<div class="panel-body">
				<%
					if(session.getAttribute("m_id").equals("admin")) {
				%>
				<table class="table">
					<caption>이벤트 게시판</caption>
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>기 간</th>
							<th>응모 가능 인원</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<%
						Iterator<ig_event> it = list.iterator();
						int cnt = 0;
						while(it.hasNext()){
							cnt++;
							ig_event event = it.next();				
					%>
					<tr>
						<td><%=totalRows %></td>
						<td>
							<a href="/academy_ignis/EventView?login=admin&pageNo=<%= pageNo %>&num=<%= event.getEb_num()%>"><%= event.getEb_title() %></a>
						</td>
						<td><%= event.getEb_period() %></td>
						<td style="color : #f00;"><%= event.getEb_winner() %></td>
						<td><%= event.getEb_regdate() %></td>
						<td><%= event.getEb_readcount() %></td>
					</tr>
					<%
						totalRows--;
						}
						if (cnt == 0) {
					%>
					<tr>
						<td colspan="5">현재 등록된 이벤트가 없습니다.</td>
					</tr>
					<% } %> 
					</tbody>
				<% } %>
				</table>
				<div class="form-group">
					<input type="button"  class="btn btn-primary" value="write" onclick="document.location.href='ad_CommunityEventWrite.jsp'">
				</div>
				<ul class="pager">
				  <li><a href="/academy_ignis/Event?login=admin&pageNo=1">첫 페이지</a></li>
				  <li>
				  	<% if (prevPage != 0) { %><a href="/academy_ignis/Event?login=admin&pageNo=<%=prevPage %>">◁</a><% } %>
				  </li>
				 	<% for (int i = beginPage; i <= endPage; i++) { %>
				  <li><a href="/academy_ignis/Event?login=admin&pageNo=<%=i %>"><%=i %></a></li>
				  	<% } %>
				  <li>
				 	 <% if (nextPage != 0) { %><a href="/academy_ignis/Event?login=admin&pageNo=<%=nextPage%>">▷</a><% } %>
				  </li>
				  <li><a href="/academy_ignis/Event?login=admin&pageNo=<%=totalPages %>">마지막 페이지</a></li>
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