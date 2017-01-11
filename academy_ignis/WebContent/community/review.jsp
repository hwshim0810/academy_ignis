<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.ReviewBiz" %>
<%@ page import = "ignis.bean.ig_review" %>
<%@ page import = "ignis.bean.ig_comment" %>
<%@ page import = "ignis.dao.ReviewDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id= null;
	if (session.getAttribute("m_id") != null) {
		id = (String) session.getAttribute("m_id");
	}
	else{
		response.sendRedirect("/academy_ignis/member/login.jsp");
		System.out.println("회원");
	}
%>
<% 
	ReviewDAO reviewDao = ReviewDAO.getInstance();
	int totalRows = reviewDao.getListCount(); // 전체 게시물 갯수
	int commPageNo = 1;
%>
<%@include file="../paging/getPageNum.jsp" %>
<%
	System.out.println(beginPage);
	System.out.println(endPage);
	List<ig_review> list = reviewDao.reviewList(begin, end);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이그니스 치과</title>
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
	<%-- Body 영역 --%>
	<div class="col-xs-12 col-sm-9 col-md-10"">
		<h3>Review</h3><hr>
		<table class="table table-responsive">
			<caption class="sr-only">Review게시판</caption>
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
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
					<td><%= review.getRb_num() %></td>
					<td>
						<a href="/academy_ignis/ReviewView?login=member&pageNo=<%= pageNo %>&num=<%= review.getRb_num()%>&commPageNo=<%= commPageNo%>"><%= review.getRb_title() %></a>
							<span class="badge"><%=commentCount %></span>
							<%
								if(review.getRb_file() != null && review.getRb_file().length() > 0 ){
							%>
								<span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
							<% } %>
					</td>
					<td><%= review.getM_name() %></td>
					<td><%= review.getRb_regdate() %></td>
					<td><%= review.getRb_readcount() %></td>
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
		<div class="form-group">
			<input type="button"  class="btn btn-primary" value="write" onclick="document.location.href='reviewWrite.jsp'">
		</div>
		<ul class="pager">
			<li><a href="/academy_ignis/Review?login=member&pageNo=1">첫 페이지</a></li>
			<li>
				<% if (prevPage != 0) { %><a href="/academy_ignis/Review?login=member&pageNo=<%=prevPage %>">◁</a><% } %>
			</li>
			<% for (int i = beginPage; i <= endPage; i++) { %>
			<li><a href="/academy_ignis/Review?login=member&pageNo=<%=i %>"><%=i %></a></li>
			<% } %>
			<li>
			 <% if (nextPage != 0) { %><a href="/academy_ignis/Review?login=member&pageNo=<%=nextPage%>">▷</a><% } %>
			</li>
			<li><a href="/academy_ignis/Review?login=member&pageNo=<%=totalPages %>">마지막 페이지</a></li>
		</ul>
		<form class="form-inline">
			<select name="reviewSearch" class="form-control" id="reviewSearch">
				<option value="">전체</option>
				<option value="title">제목</option>
				<option value="writer">글쓴이</option>
				<option value="regdate">등록일</option>
			</select>
			<div class="form-group">
				<input type="text" class="form-control" id="searchReview">
			</div>
			<button type="submit" class="btn btn-default">검색</button>
		</form>
	</div>
</div>
</div>
<%-- Body 종료 --%>
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