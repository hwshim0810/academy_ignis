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
	
	EventDAO eventDao = EventDAO.getInstance();
	int totalRows = eventDao.getListCount(); // 전체 게시물 갯수
%>
<%@include file="../paging/getPageNum.jsp" %>
<%
	List<ig_event> list = eventDao.eventList(begin, end);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link href="/academy_ignis/css/messagebox.css" rel="stylesheet">
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
	<%pageContext.include("leftList.jsp"); %> 
	<%-- Body 영역 --%>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3">
				<%--
					<ul class="nav nav-pills nav-stacked">
					<li><a href="notice.jsp">공지사항</a></li>
					<li class="active"><a href="comm_event.jsp">이벤트</a></li>
					<li><a href="#">치료후기</a></li>
					<li><a href="qna.jsp">Q&A</a></li>
					<li><a href="#">FAQ</a></li>
				</ul>
				--%>
				<br>
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
				<h4>EVENT</h4>
				<hr>
				<table class="table">
					<caption>이벤트 게시판</caption>
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<%
						Iterator<ig_event> it = list.iterator();
						int cnt = 0;
						int no = list.size();
						while(it.hasNext()){
							cnt++;
							ig_event event = it.next();				
					%>
					<tr>
						<td><%= no %></td>
						<td>
							<a href="/academy_ignis/EventView?login=member&pageNo=<%= pageNo %>&num=<%= event.getEb_num()%> ">
								<%= event.getEb_title() %>
							</a>
						</td>
						<td>이그니스 치과</td>
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
					<% }%>
					</tbody>
				</table>
				<ul class="pager">
				  <li><a href="/academy_ignis/Event?login=member&pageNo=1">첫 페이지</a></li>
				  <li>
				  	<% if (prevPage != 0) { %><a href="/academy_ignis/Event?login=member&pageNo=<%=prevPage %>">◁</a><% } %>
				  </li>
				 	<% for (int i = beginPage; i <= endPage; i++) { %>
				  <li><a href="/academy_ignis/Event?login=member&pageNo=<%=i %>"><%=i %></a></li>
				  	<% } %>
				  <li>
				 	 <% if (nextPage != 0) { %><a href="/academy_ignis/Event?login=member&pageNo=<%=nextPage%>">▷</a><% } %>
				  </li>
				  <li><a href="/academy_ignis/Event?login=member&pageNo=<%=totalPages %>">마지막 페이지</a></li>
				</ul>
				<form class="form-inline">
					<select name="eventSearch" class="form-control" id="eventSearch">
						<option value="">전체</option>
						<option value="title">제목</option>
						<option value="regdate">등록일</option>
					</select>
					<div class="form-group">
						<input type="text" class="form-control" id="searchEvent">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
			</div>
		</div>
	</div>
	<%-- Body 영역 --%>
</div>
<%-- Footer 시작 --%>
<%
	pageContext.include("../footer/footer.jsp");
%>
<%-- Footer 종료 --%>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script src="/academy_ignis/script/messagebox.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</html>