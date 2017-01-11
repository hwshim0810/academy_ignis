<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "ignis.biz.EventBiz" %>
<%@ page import = "ignis.bean.ig_event" %>
<%@ page import = "ignis.dao.EventDAO" %>
<% 
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
			<h4>EVENT</h4>
			<hr>
			<table class="table">
				<tbody>
					<tr>
						<th>글번호</th>
						<td>
							<div class="form-group">
								<%= view.getEb_num() %>
							</div>
						</td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td>
							<div class="form-group">이그니스 치과</div>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<div class="form-group">
								<%= view.getEb_title() %>
							</div>
						</td>
					</tr>
					<tr>
						<th>이벤트 내용</th>
						<td>
							<div class="form-group">
								<%= view.getEb_content() %>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align : center;">
							<div class="form-group">
					            <div class="col-md-offset-2 col-md-10">
					                <button type="button" class="btn btn-info"  onclick="document.location.href='/academy_ignis/Event?login=member&pageNo=<%=pageNo %>'">목록</button>
					                <button type="button" class="btn btn-danger" onclick="document.location.href='/academy_ignis/EventEntry'">응모하기</button>
					            </div>
					        </div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
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