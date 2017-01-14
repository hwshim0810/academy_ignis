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

	int num = 0;
	if (request.getParameter("num") != null || Integer.parseInt(request.getParameter("num")) != 0) {
		num = Integer.valueOf((String) request.getParameter("num"));
		
	}
	else {
		response.sendRedirect("/academy_ignis/admin/ad_CommunityEventList.jsp");
	}
	
	EventDAO eventDao = new EventDAO();
	ig_event view = eventDao.eventSelectOne(num);
	int entryCount = eventDao.eventEntryCount(num);
	String pageNo = request.getParameter("pageNo");
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
					<table class="table table-bordered">
					<%
								
						%>
						<tbody>
							<tr>
								<th>제목</th>
								<td>
										<%= view.getEb_title() %>
								</td>
								<th>글쓴이</th>
								<td>
									이그니스 치과
								</td>
								<th>당첨자 수</th>
								<td><%= view.getEb_winner() %></td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><%= view.getEb_period() %></td>
								<th>발표 날짜</th>
								<td><%= view.getEb_announceday() %></td>
								<th>응모자 수</th>
								<td><%= entryCount %></td>
							</tr>
							<tr>
								<th>이벤트 내용</th>
								<td colspan="5" style="min-height : 100px;"><%= view.getEb_content() %></td>
							</tr>
							<tr>
								<td colspan="6" style="text-align : center;">
									<div class="form-group">
							            <div class="col-md-offset-2 col-md-10">
							                <button type="button" class="btn btn-info"  onclick="document.location.href='/academy_ignis/Event?login=admin&pageNo=<%=pageNo %>'">목록</button>
							            	<button type="button" class="btn btn-primary" onclick="document.location.href='/academy_ignis/EventEditView?pageNo=<%= pageNo %>&num=<%= view.getEb_num()%>'">수정</button>
							            	<button type="button" class="btn btn-danger" onclick="document.location.href='/academy_ignis/EventDelete?pageNo=<%= pageNo %>&num=<%= view.getEb_num() %>'">삭제</button>
							            </div>
							        </div>
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