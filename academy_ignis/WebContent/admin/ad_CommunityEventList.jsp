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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지 이벤트 게시판</title>
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
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						<%
							List<ig_event> list = EventDAO.eventList();
							Iterator<ig_event> it = list.iterator();
							int cnt = 0;
							int no = list.size();
							while(it.hasNext()){
								cnt++;
								ig_event event = it.next();				
						%>
						<tr>
							<td><%= no %></td>
							<td><%= event.getEb_title() %></td>
							<td><%= event.getEb_regdate() %></td>
							<td><%= event.getEb_readcount() %></td>
						</tr>
						<%
								no--;
							}
							System.out.println(cnt);
							if (cnt == 0) {
						%>
						<tr>
							<td colspan="4">현재 등록된 이벤트가 없습니다.</td>
						</tr>
						<% } %>
						</tbody>
					<% } %>
					</table>
					<div class="form-group">
						<input type="button" value="write" onclick="document.location.href='ad_CommunityEventWrite.jsp'">
						
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