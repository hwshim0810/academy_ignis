<%@page import="ignis.action.MemberLoginAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.MemberDAO" %>
<%@ page import="ignis.bean.User" %>
<%@ page import="java.util.List" %>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("./ad_Login.jsp");

	MemberDAO memDao = MemberDAO.getInstance();
	int totalRows = memDao.getUserCount(); // 전체 게시물 갯수
%>
<%@include file="../paging/getPageNum.jsp" %>
<% List<User> userList = memDao.getUserAll(begin, end); %>
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
					<h2 id="memTitle">전체 회원명단</h2>
				</div>
				<div class="panel-body">
				<table class="table">
					<caption class="sr-only">회원명단</caption>
					<thead>
					<tr class="info"><th>아이디</th><th>이름</th><th>생일</th><th>주소</th>
					<th>휴대폰번호</th><th>Email</th><th>가입일</th></tr>
					</thead>
					<tbody>
					<% 
						if (userList != null) {
							for (int i = 0; i < userList.size(); i++) {
								User user = userList.get(i);
					%>
					<tr>
						<td><%=user.getM_id() %></td><td><%=user.getM_name() %></td>
						<td><%=user.getM_birth() %></td><td><%=user.getM_addr() %></td>
						<td><%=user.getM_phone() %></td><td><%=user.getM_email() %></td>
						<td><%=user.getM_enterdate() %></td>
					</tr>
					<%
							}
						} else {
					%>
					<tr><td colspan="7">가입된 회원이 존재하지 않습니다</td></tr>
					<%	} %>
					</tbody>
				</table>
					<form class="form-inline" >
					   <label for="sel1">검색 범위</label>
					  <select class="form-control" id="sel1">
					    <option>전체</option>
					    <option>제목</option>
					    <option>내용</option>
					  </select>
					  <div class="form-group">
					    <label class="sr-only" for="search">검색 내용:</label>
					    <input type="text" class=form-control id="search">
					  </div>
					  <button type="submit" class="btn btn-default">검색</button>
					</form>
					<ul class="pager">
					  <li><a href="/academy_ignis/member?pageNo=1">첫 페이지</a></li>
					  <li>
					  	<% if (prevPage != 0) { %><a href="/academy_ignis/member?pageNo=<%=prevPage %>">◁</a><% } %>
					  </li>
					 	<% for (int i = beginPage; i <= endPage; i++) { %>
					  <li><a href="/academy_ignis/member?pageNo=<%=i %>"><%=i %></a></li>
					  	<% } %>
					  <li>
					 	 <% if (nextPage != 0) { %><a href="list.jsp?pageNo=<%=nextPage%>">▷</a><% } %>
					  </li>
					  <li><a href="/academy_ignis/member?pageNo=<%=endPage %>">마지막 페이지</a></li>
					</ul>
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