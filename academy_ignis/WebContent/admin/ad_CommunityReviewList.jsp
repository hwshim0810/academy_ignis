<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.ReviewBiz" %>
<%@ page import = "ignis.bean.ig_review" %>
<%@ page import = "ignis.dao.ReviewDAO" %>
<%
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("./ad_Login.jsp");
%>

<% 
	ReviewDAO reviewDao = ReviewDAO.getInstance();
	int totalRows = reviewDao.getListCount(); // 전체 게시물 갯수
	int commPageNo = 1;
%>
<%@include file="../paging/getPageNum.jsp" %>
<%
	List<ig_review> list = reviewDao.reviewList(begin, end);
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
				Review
			</div>
			<div class="panel-body">
				<%
					if(session.getAttribute("m_id").equals("admin")) {
				%>
				<div id="ContentArea">
					<table class="table">
						<caption class="sr-only">Review게시판</caption>
						<thead>
							<tr>
								<th class="hidden-xs hidden-sm">No</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th class="hidden-xs hidden-sm">조회수</th>
							</tr>
						</thead>
						<tbody>
						<%
							Iterator<ig_review> it = list.iterator();
							int cnt = 0;
							int no = list.size();
							while(it.hasNext()){
								cnt ++;
								ig_review review = it.next();
								int commentCount = reviewDao.getListCommentCount(review.getRb_num());
						%>
							<tr>
								<td class="hidden-xs hidden-sm"><%= review.getRb_num() %></td>
								<td>
									<a href="/academy_ignis/ReviewView?login=admin&pageNo=<%= pageNo %>&num=<%= review.getRb_num()%>&commPageNo=<%= commPageNo%>"><%= review.getRb_title() %></a>
									<span class="badge"><%=commentCount %></span>
										<%
											if(review.getRb_file() != null && review.getRb_file().length() > 0 ){
										%>
											<span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
										<% } %>
								</td>
								<td><%= review.getM_name() %></td>
								<td><%= review.getRb_regdate() %></td>
								<td class="hidden-xs hidden-sm"><%= review.getRb_readcount() %></td>
							</tr>
						<% 
							no--;
							} 
							
							if(cnt == 0) {
						%>
						<tr>
							<td colspan="5">현재 등록된 수강후기가 없습니다.</td>
						</tr>
						<% } %>
						</tbody>
					</table>				
					<% } %>
					<ul class="pager">
					  <li><a href="/academy_ignis/Review?login=admin&pageNo=1">첫 페이지</a></li>
					  <li>
					  	<% if (prevPage != 0) { %><a href="/academy_ignis/Review?login=admin&pageNo=<%=prevPage %>">◁</a><% } %>
					  </li>
					 	<% for (int i = beginPage; i <= endPage; i++) { %>
					  <li><a href="/academy_ignis/Review?login=admin&pageNo=<%=i %>"><%=i %></a></li>
					  	<% } %>
					  <li>
					 	 <% if (nextPage != 0) { %><a href="/academy_ignis/Review?login=admin&pageNo=<%=nextPage%>">▷</a><% } %>
					  </li>
					  <li><a href="/academy_ignis/Review?login=admin&pageNo=<%=totalPages %>">마지막 페이지</a></li>
					</ul>
				</div>
				<div class="pager" style="text-align : right;">
					<input type="button"  class="btn btn-primary" value="write" onclick="document.location.href='ad_CommunityReviewWrite.jsp'">
				</div>
				<form class="form-inline">
					<div class="form-group">
						<select class="form-control" name="reviewSearch"  id="reviewSearch">
							<option value="review_all">전체</option>
							<option value="review_title">제목</option>
							<option value="review_writer">작성자</option>
							<option value="review_regdate">등록일</option>
						</select>
						<input type="text" class="form-control" name="searchReview" id="searchReview">
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
 <script type="text/javascript" charset="utf-8" src="/academy_ignis/script/search_review.js"></script>
</body>
</html>