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
	
	int num = 0;
	if (request.getParameter("num") != null || Integer.parseInt(request.getParameter("num")) != 0) {
		num = Integer.valueOf((String) request.getParameter("num"));
		
	}
	else {
		response.sendRedirect("/academy_ignis/admin/ad_CommunityEventList.jsp");
	}
	
	EventDAO eventDao = new EventDAO();
	ig_event view = eventDao.eventSelectOne(num);
	
	String pageNo = request.getParameter("pageNo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css">
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("../header/header.jsp");
%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
<div class="wrapper">
	<div class="container">
		<%pageContext.include("leftList.jsp"); %>
		<div class="col-xs-12 col-sm-9 col-md-10"">
			<h3>EVENT</h3><hr>
			<table class="table table-bordered">
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
						<td colspan="3"><%= view.getEb_period() %></td>
						<th>발표 날짜</th>
						<td><%= view.getEb_announceday() %></td>
					</tr>
					<tr>
						<th>이벤트 내용</th>
						<td colspan="5" style="min-height : 100px;"><%= view.getEb_content() %></td>
					</tr>
					<tr>
						<td colspan="6" style="text-align : center;">
							<div class="form-group">
					            <div class="col-md-offset-2 col-md-10">
					                <button type="button" class="btn btn-info"  onclick="document.location.href='/academy_ignis/Event?login=member&pageNo=<%=pageNo %>'">목록</button>
									<button type="button" class="btn btn-danger" onclick="document.location.href='/academy_ignis/EventEntry?num=<%= view.getEb_num()%>&id=<%= id %>'">응모하기</button>								
					            </div>
					        </div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%-- Body 영역 --%>
<%-- Footer 시작 --%>
<%
	pageContext.include("../footer/footer.jsp");
%>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=2"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>