<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"  %>
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
				<div id="ContentArea">
					<%
						if(session.getAttribute("m_id").equals("admin")) {
					%>
					<table class="table" style="text-align : center;">
						<caption class="sr-only">이벤트 게시판</caption>
						<thead>
							<tr>
								<th class="hidden-xs hidden-sm" style="text-align : center;">No</th>
								<th style="text-align : center;">제목</th>
								<th style="text-align : center;">기 간</th>
								<th style="text-align : center;">응모 가능 인원</th>
								<th class="hidden-xs hidden-sm" style="text-align : center;">등록일</th>
								<th class="hidden-xs hidden-sm" style="text-align : center;">조회수</th>
							</tr>
						</thead>
						<tbody>
						<%
							Iterator<ig_event> it = list.iterator();
							int cnt = 0;
							int no = list.size();
							while(it.hasNext()){
								cnt++;
								ig_event event = it.next();				
						%>
						<%
						java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
						Date today = new Date();
						String endDate = event.getEb_period().substring(13);
						Date endDay = formatter.parse(endDate);
						int result = today.compareTo(endDay);
						%>
						<tr>
							<td class="hidden-xs hidden-sm"><%=totalRows %></td>
							<td style="text-align : left;">
								<a href="/academy_ignis/EventView?login=admin&pageNo=<%= pageNo %>&num=<%= event.getEb_num()%>"><%= event.getEb_title() %></a>
							</td>
							<td><%= event.getEb_period() %></td>
							<td style="color : #f00;">
								<% if(result > 0){ %>
									이벤트 마감
								<% } else { 
									 if( event.getEb_winner() > 0) { %>
										<%= event.getEb_winner() %>
									<% } else { %>
										이벤트 마감
									<% } %>
								<% } %>
							</td>
							<td class="hidden-xs hidden-sm"><%= event.getEb_regdate() %></td>
							<td class="hidden-xs hidden-sm"><%= event.getEb_readcount() %></td>
						</tr>
						<%
							no--;
							}
							if (cnt == 0) {
						%>
						<tr>
							<td colspan="6">현재 등록된 이벤트가 없습니다.</td>
						</tr>
						<% } %> 
						</tbody>
					<% } %>
					</table>
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
				</div>
				<div class="pager" style="text-align : right;">
					<input type="button"  class="btn btn-primary" value="write" onclick="document.location.href='ad_CommunityEventWrite.jsp'">
				</div>
				<form class="form-inline">
					<select class="form-control" name="eventSearch" id="eventSearch">
						<option value="event_all">전체</option>
						<option value="event_title">제목</option>
					</select>
					<div class="form-group">
						<input type="text" class="form-control" name="searchEvent" id="searchEvent">
					</div>
					<a type="button" class="btn btn-default" id="searchBtn">검색</a>
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
 <script type="text/javascript" charset="utf-8" src="/academy_ignis/script/search_event.js"></script>
</body>
</html>