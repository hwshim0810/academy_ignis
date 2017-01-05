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
	ig_event eventBean = new ig_event();
	
	int num = 0;
	
	if (request.getParameter("num") != null || Integer.parseInt(request.getParameter("num")) != 0) {
		num = Integer.valueOf((String) request.getParameter("num"));
		
	}
	else {
		response.sendRedirect("/academy_ignis/admin/ad_CommunityEventList.jsp");
	}
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
					EVENT 수정
				</div>
				<div class="panel-body">
					<form class="form-horizontal" name="updateEvent" method="post" action="/academy_ignis/EventEdit?num=<%= num %>">
						<table class="table">
						<%
							ig_event view = eventDao.eventSelectOne(num);		
						%>
							<tbody>
								<tr>
									<th>글쓴이</th>
									<td>
										<div class="form-group">
                							<input type="text" name="eb_writer"  class="form-control" value="이그니스 치과" readonly />
            							</div>
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td>
										<div class="form-group">
                							<input type="text" name="eb_title"  class="form-control" value="<%= view.getEb_title() %>" />
            							</div>
									</td>
								</tr>
								<tr>
									<th>이벤트 내용</th>
									<td>
										<div class="form-group">
											<textarea class="form-control" name="eb_content"><%= view.getEb_content() %></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align : center;">
										<div class="form-group">
								            <div class="col-md-offset-2 col-md-10">
								                <button type="button" class="btn btn-danger" onclick="document.location.href='/academy_ignis/EventView?num=<%= view.getEb_num()%>'">취소</button>
								            	<button type="submit" class="btn btn-primary">수정</button>
								            </div>
								        </div>
									</td>
								</tr>
							</tbody>
						</table>
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