<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.ReviewBiz" %>
<%@ page import = "ignis.bean.ig_review" %>
<%@ page import = "ignis.dao.ReviewDAO" %>
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
<title>EVENT</title>
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
				<li class="active"><a href="comm_event.jsp">이벤트</a></li>
				<li><a href="#">치료후기</a></li>
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
								<%if (view == null) System.out.println("null일까"); %>
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
					                <button type="button" class="btn btn-primary" onclick="document.location.href='/academy_ignis/ReviewEditView?login=member&pageNo=<%= pageNo %>&num=<%= view.getRb_num()%>'">수정</button>
							        <button type="button" class="btn btn-danger" onclick="document.location.href='/academy_ignis/ReviewDelete?login=member&num=<%= view.getRb_num() %>'">삭제</button>
					            	<%-- 자신이 쓴 글인 경우에만 가능 --%>
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

</body>
</html>