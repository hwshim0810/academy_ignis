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
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis/member/login.jsp");
%>
<% 
	
	int num = 0;
	if (request.getParameter("num") != null || Integer.parseInt(request.getParameter("num")) != 0) {
		num = Integer.valueOf((String) request.getParameter("num"));
		
	}
	else {
		response.sendRedirect("/academy_ignis/Review?login=member");
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
<title>Review</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  	<style type="text/css">
  	    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;   
      border-radius: 0;
    }
                        
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
      text-align : center;
      margin-bottom : 50px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }


	/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>
<%pageContext.include("header_noTop.jsp"); %>
<%pageContext.include("../header/header.jsp"); %>
 <div class="container">
 <%--
 <%pageContext.include("leftList.jsp"); %>
  --%>
 </div>
 
<%-- Body 영역 --%>
<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-3">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="notice.jsp">공지사항</a></li>
				<li><a href="comm_event.jsp">이벤트</a></li>
				<li class="active"><a href="#">치료후기</a></li>
				<li><a href="qna.jsp">Q&A</a></li>
				<li><a href="#">FAQ</a></li>
			</ul><br>
			<%-- 검색기능
			<div class="input-group">
			<input type="text" class="form-control" placeholder="Search Blog..">
			<span class="input-group-btn">
			<button class="btn btn-default" type="button">
			 <span class="glyphicon glyphicon-search"></span>
			</button>
			</span>
			</div>
			 --%>
		</div>
		
		
		<div class="col-sm-9">
			<h4>Review</h4>
			<hr>
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
								<img src="/academy_ignis/reviewUpload/<%= view.getRb_file() %>">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align : center;">
							<div class="form-group">
					            <div class="col-md-offset-2 col-md-10">
					                <button type="button" class="btn btn-info"  onclick="document.location.href='/academy_ignis/Review?login=member&pageNo=<%=pageNo %>'">목록</button>
					                <%-- 자신이 쓴 글인 경우에만 가능 --%>
					                <%
					                	if(id.equals(view.getM_name())){
					                %>
					                		<button type="button" class="btn btn-primary" onclick="document.location.href='/academy_ignis/ReviewEditView?login=member&pageNo=<%= pageNo %>&num=<%= view.getRb_num()%>'">수정</button>
									        <button type="button" class="btn btn-danger" onclick="document.location.href='/academy_ignis/ReviewDelete?login=member&num=<%= view.getRb_num() %>'">삭제</button>
							        <%
					                	}
					                %>
					               <%-- 자신이 쓴 글인 경우에만 가능 --%>
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
			<form name="" class="form-inline" method="post" action="/academy_ignis/CommentPlus?login=member&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%= cPageNo %>">
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
						<%-- 자신이 쓴 글인 경우에만 삭제 가능 --%>
		                <% 
		                	if(id.equals(comment.getM_name())){
		                %>
	                		<button type="button" class="btn btn-danger"  onclick="document.location.href='/academy_ignis/CommentDelete?login=member&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%= cPageNo %>&coNum=<%= comment.getCo_num()  %>'">삭제</button>
	                	<%
		                	}
		                %>
		               <%-- 자신이 쓴 글인 경우에만 삭제 가능 --%>
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
				<li><a href="/academy_ignis/ReviewView?login=member&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=1">첫 페이지</a></li>
				<li>
					<% if (prevPage != 0) { %><a href="/academy_ignis/ReviewView?login=member&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%=prevPage %>">◁</a><% } %>
				</li>
				<% for (int i = beginPage; i <= endPage; i++) { %>
				<li><a href="/academy_ignis/ReviewView?login=member&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%=i %>"><%=i %></a></li>
				<% } %>
				<li>
				 <% if (nextPage != 0) { %><a href="/academy_ignis/ReviewView?login=member&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%=nextPage%>">▷</a><% } %>
				</li>
				<li><a href="/academy_ignis/ReviewView?login=member&pageNo=<%= pageNo %>&num=<%= num %>&commPageNo=<%=totalPages %>">마지막 페이지</a></li>
			</ul>
			<%-- 댓글 영역 --%>
		</div>
	</div>
</div>

<%-- Body 영역 --%>
<%-- Footer 시작 --%>
<%
	pageContext.include("../footer/footer.jsp");
%>
<%-- Footer 종료 --%>

</body>
</html>