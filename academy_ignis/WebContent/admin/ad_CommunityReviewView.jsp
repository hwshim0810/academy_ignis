<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.ReviewBiz" %>
<%@ page import = "ignis.bean.ig_review" %>
<%@ page import = "ignis.bean.ig_comment" %>
<%@ page import = "ignis.dao.ReviewDAO" %>
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
		response.sendRedirect("/academy_ignis/Review?login=admin");
	}
	
	ReviewDAO reviewDao = ReviewDAO.getInstance();
	ig_review view = reviewDao.reviewSelectOne(num);
	
	String pageNo = request.getParameter("pageNo");
	System.out.println(pageNo);
	System.out.println(num);
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
					Review
				</div>
				<div class="panel-body">
					<table class="table">
						<tbody>
							<tr>
								<th>글번호</th>
								<td>
									<div class="form-group">
										<%= view.getRb_num() %>
									</div>
								</td>
								<th>등록일</th>
								<td><%= view.getRb_regdate() %></td>
							</tr>
							<tr>
								<th>글쓴이</th>
								<td colspan="3">
									<div class="form-group">
										<%= view.getM_name() %>
									</div>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3">
									<div class="form-group">
										<%= view.getRb_title() %>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<div class="form-group">
										<%= view.getRb_content() %>
										<%
											if(view.getRb_file() != null && view.getRb_file().length() > 0 ){
										%>
											<img src="/academy_ignis/reviewUpload/<%= view.getRb_file() %>">
										<% } %>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align : center;">
									<div class="form-group">
							            <div class="col-md-offset-2 col-md-10">
							                <button type="button" class="btn btn-info"  onclick="document.location.href='/academy_ignis/Review?login=admin&pageNo=<%=pageNo %>'">목록</button>
							                <button type="button" class="btn btn-primary" onclick="document.location.href='/academy_ignis/ReviewEditView?login=admin&pageNo=<%= pageNo %>&num=<%= view.getRb_num()%>'">수정</button>
							            	<button type="button" class="btn btn-danger" onclick="document.location.href='/academy_ignis/ReviewDelete?login=admin&num=<%= view.getRb_num() %>'">삭제</button>
							            </div>
							        </div>
								</td>
							</tr>
						</tbody>
					</table>
					<%-- 댓글 영역 --%>
					<% 
						int totalRows = reviewDao.getListCommentCount(num); // 전체 게시물 갯수
					%>
					<%@include file="../paging/getCommentPageNum.jsp" %>
					<%
					System.out.println("begin : " + begin);
					System.out.println("end : "  + end);
					List<ig_comment> clist = reviewDao.commentList(begin, end, num);
					String cPageNo = request.getParameter("commPageNo");
					System.out.println("====댓글영역====");
					System.out.println("댓글 페이징 : " + cPageNo);
					System.out.println("리뷰 게시판 페이징 : " + pageNo);
					System.out.println("리뷰 게시글 번호 : " + num);
					%>
					<form name="" class="form-inline" method="post" action="/academy_ignis/CommentPlus?login=admin&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%= cPageNo %>">
						<div class="form-group">
							<label for="comment_writer"></label>
							<input type="text" class="form-control" name="m_name" id="m_name" value="<%= id %>" readonly>
						</div>
						<div class="form-group">
							<label for="comment_content"></label>
							<input type="text" class="form-control" name="co_content" id="co_content" value="">
						</div>
						<button type="submit" class="btn btn-default">등록</button>
					</form>
					<table class="table">
						<caption>댓글 테이블</caption>
						<thead> 
							<tr>
								<th>글쓴이</th>
								<th>댓글 내용</th>
								<th>등록일</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
						<%
							Iterator<ig_comment> cit = clist.iterator();
							int ccnt = 0;
							int cno = clist.size();
							while(cit.hasNext()){
								ccnt ++;
								ig_comment comment = cit.next();
						%>
							<tr>
								<td><%= comment.getM_name() %></td>
								<td><%= comment.getCo_content() %></td>
								<td><%= comment.getCo_regdate() %></td>
								<td>
			                		<button type="button" class="btn btn-danger"  onclick="document.location.href='/academy_ignis/CommentDelete?login=admin&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%= cPageNo %>&coNum=<%= comment.getCo_num()  %>'">삭제</button>
				              	</td>
							</tr>
						<%
							cno--;
							}
							if(ccnt == 0) {
						%>
							<tr>
								<td colspan="4">
									게시글에 등록된 댓글이 없습니다.
								</td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
					<ul class="pager">
						<li><a href="/academy_ignis/ReviewView?login=admin&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=1">첫 페이지</a></li>
						<li>
							<% if (prevPage != 0) { %><a href="/academy_ignis/ReviewView?login=admin&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%=prevPage %>">◁</a><% } %>
						</li>
						<% for (int i = beginPage; i <= endPage; i++) { %>
						<li><a href="/academy_ignis/ReviewView?login=admin&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%=i %>"><%=i %></a></li>
						<% } %>
						<li>
						 <% if (nextPage != 0) { %><a href="/academy_ignis/ReviewView?login=admin&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%=nextPage%>">▷</a><% } %>
						</li>
						<li><a href="/academy_ignis/ReviewView?login=admin&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%=totalPages %>">마지막 페이지</a></li>
					</ul>
					<%-- 댓글 영역 --%>
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