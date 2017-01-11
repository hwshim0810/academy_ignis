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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<div class="wrapper">
	<div class="container">
		<%pageContext.include("leftList.jsp"); %> 
		<%-- Body 영역 --%>
		<div class="container-fluid">
			<div class="row content">
				<div class="col-sm-9">
					<h4>FAQ</h4>
					<hr>
					<div class="panel-group" id="accordion">
						<%-- FAQ1 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">FAQ1</a>
					        </h4>
					      </div>
					      <div id="collapse1" class="panel-collapse collapse in">
					        <div class="panel-body">FAQ Content1</div>
					      </div>
					    </div>
					    <%-- FAQ1 종료 --%>
					    <%-- FAQ2 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">FAQ2</a>
					        </h4>
					      </div>
					      <div id="collapse2" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content2</div>
					      </div>
					    </div>
					    <%-- FAQ2 종료 --%>
					    <%-- FAQ3 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">FAQ3</a>
					        </h4>
					      </div>
					      <div id="collapse3" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content3</div>
					      </div>
					    </div>
					    <%-- FAQ3 종료 --%>
					    <%-- FAQ4 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">FAQ4</a>
					        </h4>
					      </div>
					      <div id="collapse4" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content4</div>
					      </div>
					    </div>
					    <%-- FAQ4 종료 --%>
					    <%-- FAQ5 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">FAQ5</a>
					        </h4>
					      </div>
					      <div id="collapse5" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content5</div>
					      </div>
					    </div>
					    <%-- FAQ5 종료 --%>
					    <%-- FAQ6 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">FAQ6</a>
					        </h4>
					      </div>
					      <div id="collapse6" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content6</div>
					      </div>
					    </div>
					    <%-- FAQ6 종료 --%>
					    <%-- FAQ7 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">FAQ7</a>
					        </h4>
					      </div>
					      <div id="collapse7" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content7</div>
					      </div>
					    </div>
					    <%-- FAQ7 종료 --%>
					    <%-- FAQ8 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">FAQ8</a>
					        </h4>
					      </div>
					      <div id="collapse8" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content8</div>
					      </div>
					    </div>
					    <%-- FAQ8 종료 --%>
					    <%-- FAQ9 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse9">FAQ9</a>
					        </h4>
					      </div>
					      <div id="collapse9" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content9</div>
					      </div>
					    </div>
					    <%-- FAQ9 종료 --%>
					    <%-- FAQ10 시작 --%>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse10">FAQ10</a>
					        </h4>
					      </div>
					      <div id="collapse10" class="panel-collapse collapse">
					        <div class="panel-body">FAQ Content10</div>
					      </div>
					    </div>
					    <%-- FAQ10 종료 --%>
					</div> 
				</div>
			</div>
		</div>
		<%-- Body 영역 --%>
	</div>
</div>
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