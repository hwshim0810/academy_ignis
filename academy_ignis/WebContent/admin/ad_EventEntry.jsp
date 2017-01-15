<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.EventBiz" %>
<%@ page import = "ignis.bean.ig_event" %>
<%@ page import = "ignis.bean.ig_evententry" %>
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
<%--
HashMap<String, Object> resultMap = eventDao.entryList(begin, end);
List<ig_event> eventlist = (List<ig_event>) resultMap.get("eventlist");
List<ig_evententry> entrylist = (List<ig_evententry>) resultMap.get("evententry");
--%>
<%
	List<ig_evententry> list = eventDao.eventEntryList(begin, end);
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
				응모 이벤트 관리
			</div>
			<div class="panel-body">
				<div id="contentArea">
					<table class="table">
					<%
						if(session.getAttribute("m_id").equals("admin")) {
					%>
						<caption class="sr-only">응모 이벤트 게시판</caption>
						<thead>
							<tr>
								<th>회원ID</th>
								<th>이벤트명</th>
								<th class="hidden-xs hidden-sm">응모 기간</th>
								<th class="hidden-xs hidden-sm">발표일</th>
								<th class="hidden-xs hidden-sm">응모한 날짜</th>
								<th>취소</th>
							</tr>
						</thead>
						<tbody>
						<%
						Iterator<ig_evententry> it = list.iterator();
						int cnt = 0;
						int no = list.size();
						while(it.hasNext()){
							cnt ++;
							ig_evententry evententry = it.next();
							int eb_num = evententry.getEb_num();
							ig_event event = eventDao.eventSelectOne(eb_num);
						%>
						<tr>
							<td><%= evententry.getM_name() %></td>
							<td><%= event.getEb_title()%></td>
							<td class="hidden-xs hidden-sm"><%= event.getEb_period() %></td>
							<td class="hidden-xs hidden-sm"><%= event.getEb_announceday() %></td>
							<td class="hidden-xs hidden-sm"><%= evententry.getEb_entrydate()%></td>
							<td>
								<a href="/academy_ignis/myEventCancle?num=<%= eb_num %>&login=admin" class="btn btn-danger">취소</a>
							</td>
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
				</div>
			</div>
			<ul class="pager">
			  <li><a href="/academy_ignis/EventEntryList?pageNo=1">첫 페이지</a></li>
			  <li>
			  	<% if (prevPage != 0) { %><a href="/academy_ignis/EventEntryList?pageNo=<%=prevPage %>">◁</a><% } %>
			  </li>
			 	<% for (int i = beginPage; i <= endPage; i++) { %>
			  <li><a href="/academy_ignis/EventEntryList?pageNo=<%=i %>"><%=i %></a></li>
			  	<% } %>
			  <li>
			 	 <% if (nextPage != 0) { %><a href="/academy_ignis/EventEntryList?pageNo=<%=nextPage%>">▷</a><% } %>
			  </li>
			  <li><a href="/academy_ignis/EventEntryList?pageNo=<%=totalPages %>">마지막 페이지</a></li>
			</ul>
		</div>
 	</div>
	<%
		pageContext.include("./manage_Footer.jsp");
	%>
</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
 <script type="text/javascript" charset="utf-8" src="/academy_ignis/script/search_evententry.js"></script>
</body>
</html>