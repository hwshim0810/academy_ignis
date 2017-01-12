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
		response.sendRedirect("/academy_ignis/admin/ad_Login.jsp");

	MemberDAO memDao = MemberDAO.getInstance();
	int totalRows = memDao.getUserCount(); // 전체 게시물 갯수
%>
<%@include file="../paging/getPageNum.jsp" %>
<% List<User> userList = memDao.getUserAll(begin, end); %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link href="/academy_ignis/css/messagebox.css" rel="stylesheet">
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
					<h5>&nbsp;현재 회원수 : <%=totalRows %></h5>
				</div>
				<div class="panel-body" id="panel-body">
				<div id="tableArea">
					<div>
					<table id="myTable" class="table table-responsive table-hover">
						<caption class="sr-only">회원명단</caption>
						<thead>
							<tr><th>아이디</th><th class="hidden-xs hidden-sm">이름</th><th class="hidden-xs hidden-sm">생일</th><th class="hidden-xs hidden-sm">주소</th>
							<th class="hidden-xs hidden-sm">휴대폰번호</th><th class="hidden-xs hidden-sm">Email</th><th class="hidden-xs hidden-sm">가입일</th><th></th></tr>
						</thead>
						<tbody>
						<% 
							if (userList != null) {
								for (int i = 0; i < userList.size(); i++) {
									User user = userList.get(i);
						%>
						<tr>
							<td><%=user.getM_id() %></td><td class="hidden-xs hidden-sm"><%=user.getM_name() %></td>
							<td class="hidden-xs hidden-sm"><%=user.getM_birth() %></td><td class="hidden-xs hidden-sm"><%=user.getM_addr() %></td>
							<td class="hidden-xs hidden-sm"><%=user.getM_phone() %></td><td class="hidden-xs hidden-sm"><%=user.getM_email() %></td>
							<td class="hidden-xs hidden-sm"><%=user.getM_enterdate() %></td><td><a href="/academy_ignis/adMyPage?userId=<%=user.getM_id()%>">보기</a></td>
						</tr>
						<%
								}
							} else {
						%>
						<tr><td colspan="8">가입된 회원이 존재하지 않습니다</td></tr>
						<%	} %>
						</tbody>
					</table>
					</div>
						<ul class="pager">
						  <li><a href="/academy_ignis/member?pageNo=1">첫 페이지</a></li>
						  <li>
						  	<% if (prevPage != 0) { %><a href="/academy_ignis/member?pageNo=<%=prevPage %>">◁</a><% } %>
						  </li>
						 	<% for (int i = beginPage; i <= endPage; i++) { %>
						  <li><a href="/academy_ignis/member?pageNo=<%=i %>"><%=i %></a></li>
						  	<% } %>
						  <li>
						 	 <% if (nextPage != 0) { %><a href="/academy_ignis/member?pageNo=<%=nextPage%>">▷</a><% } %>
						  </li>
						  <li><a href="/academy_ignis/member?pageNo=<%=totalPages %>">마지막 페이지</a></li>
						</ul>
					</div>
						<form class="form-inline">
						<div class="form-group">
						<label for="sel1">검색 범위</label>
						  <select class="form-control" id="searchType">
						    <option value="all">전체</option>
						    <option value="m_id">아이디</option>
						    <option value="m_name">이름</option>
						    <option value="m_phone">휴대폰번호</option>
						    <option value="m_email">Email</option>
						  </select>
						    <label class="sr-only">검색 내용:</label>
						    <input type="text" class="form-control" id="searchContent" name="searchContent">
						  </div>
						  <a type="button" id="searchBtn" class="btn btn-default">검색</a>
						  <a class="btn btn-success" href="/academy_ignis/memberJoin?page=admin">추가</a>
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
 <script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
 <script src="/academy_ignis/script/messagebox.js" type="text/javascript"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
 <script type="text/javascript" charset="utf-8" src="/academy_ignis/script/manage_member.js?v=18"></script>
</body>
</html>