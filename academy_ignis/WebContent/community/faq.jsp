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
		<div class="col-xs-12 col-sm-9 col-md-10">
			<h3>FAQ</h3>
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
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
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