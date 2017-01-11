<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.ReviewBiz" %>
<%@ page import = "ignis.bean.ig_review" %>
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
	String pageNo = request.getParameter("pageNo");
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
<%pageContext.include("../header/header.jsp"); %>
<div class="container">
	<%pageContext.include("leftList.jsp"); %> 
	<%-- Body 영역 --%>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-9">
				<h4>Review</h4>
				<hr>
				<form class="form-horizontal" name="updateReview" method="post" action="/academy_ignis/ReviewEdit?login=member&pageNo=<%= pageNo %>&num=<%= num %>"  enctype="multipart/form-data">
					<table class="table">
					<%
						ig_review view = reviewDao.reviewSelectOne(num);		
					%>
						<tbody>
							<tr>
								<th>제목</th>
								<td>
									<div class="form-group">
               							<input type="text" name="rb_title" id="rb_title"  class="form-control" value="<%= view.getRb_title() %>" />
           							</div>
								</td>
							</tr>
							<tr>
								<th>글쓴이</th>
								<td>
									<div class="form-group">
               							<input type="text" class="form-control"  name="rb_writer" id="rb_writer" value="<%=id%>" readonly>
           							</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="form-group">
										<textarea class="form-control" name="rb_content" id="rb_content"><%= view.getRb_content() %></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<div class="form-group">
										<input type="file" accept=".gif, .jpg, .png" class="form-control" name="rb_file" id="rb_file" value="<%= view.getRb_file() %>" >
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align : center;">
									<div class="form-group">
							            <div class="col-md-offset-2 col-md-10">
							                <button type="button" class="btn btn-danger" onclick="document.location.href='/academy_ignis/ReviewView?login=member&pageNo=<%= pageNo%>&num=<%= view.getRb_num()%>'">취소</button>
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
	<%-- Body 영역 --%>
</div>
<%-- Footer 시작 --%>
<%
	pageContext.include("../footer/footer.jsp");
%>
<%-- Footer 종료 --%>
</body>
</html>