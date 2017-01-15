<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"  %>
<%@ page import="ignis.dao.MemberDAO" %>
<%@ page import="ignis.bean.User" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.EventBiz" %>
<%@ page import = "ignis.bean.ig_event" %>
<%@ page import = "ignis.bean.ig_evententry" %>
<%@ page import = "ignis.dao.EventDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id= null;
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis/member/login.jsp");
	
	EventDAO eventDao = EventDAO.getInstance();
	int totalRows = eventDao.getListCount(); // 전체 게시물 갯수
%>
<%@include file="../paging/getPageNum.jsp" %>
<%
	List<ig_evententry> list = eventDao.eventEntryById(begin, end, id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
<link rel="stylesheet" href="/academy_ignis/css/daterangepicker.css">
<link rel="stylesheet" href="/academy_ignis/css/common.css?v=2">
<title>Ignis치과</title>
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("../header/header.jsp");
%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
<div class="wrapper">
	<div class="container godo normal w400">
		<%
			pageContext.include("../ignisCompany_info/leftList2.jsp"); 
		%>
		<div class="col-xs-12 col-sm-12 col-md-10">
			<h3>내 이벤트 확인하기</h3>
			<table class="table">
				<caption class="sr-only">내 이벤트 확인 테이블</caption>
				<thead>
					<tr>
						<th>이벤트명</th>
						<th class="hidden-xs">기간</th>
						<th class="hidden-xs">발표일</th>
						<th>상세보기</th>
						<th>응모 취소</th>
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
					<%
						java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
						Date today = new Date();
						String endDate = event.getEb_period().substring(13);
						Date endDay = formatter.parse(endDate);
						int result = today.compareTo(endDay);
					%>
					<tr>
						<td><%= event.getEb_title()%></td>
						<td class="hidden-xs"><%= event.getEb_period() %></td>
						<td class="hidden-xs"><%= event.getEb_announceday() %></td>
						<td>
							<a href="/academy_ignis/EventView?login=member&pageNo=1&num=<%= eb_num %>">보기</a>
						</td>
						<td>
							<% if(result <= 0)  {%>
								<a href="/academy_ignis/myEventCancle?num=<%= eb_num %>&login=member" class="btn btn-danger">취소</a>
							<% } %>
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
			</table>
			<ul class="pager">
			  <li><a href="/academy_ignis/Event?login=member&pageNo=1">첫 페이지</a></li>
			  <li>
			  	<% if (prevPage != 0) { %><a href="/academy_ignis/myEvent?pageNo=<%=prevPage %>">◁</a><% } %>
			  </li>
			 	<% for (int i = beginPage; i <= endPage; i++) { %>
			  <li><a href="/academy_ignis/myEvent?pageNo=<%=i %>"><%=i %></a></li>
			  	<% } %>
			  <li>
			 	 <% if (nextPage != 0) { %><a href="/academy_ignis/myEvent?pageNo=<%=nextPage%>">▷</a><% } %>
			  </li>
			  <li><a href="/academy_ignis/myEvent?pageNo=<%=totalPages %>">마지막 페이지</a></li>
			</ul>
		</div>
	</div>
</div>
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/myPage.js?v=6"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=1"></script>
<script type="text/javascript"src="/academy_ignis/script/moment.js"></script>
<script type="text/javascript"src="/academy_ignis/script/daterangepicker.js"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>