<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis 치과</title>
<style type="text/css">
table, tr, td {
	border: 1px solid #aaa;
	border-collapse;
	collapse;
	width="300"
}
tr.days {text-align: center;}
td {	font-size: 9pt;}

a {
	text-decoration: none;
}

a:HOVER {
	text =decoration: underline;
	color: tomato;
}
body { font-size: 20px;}

 .row_second {margin : 60px 0;}
.select1 { width : 30%; height : 40px; padding : 5px; }
.select11 { width : 60%; height : 80px; margin : 10px 0; padding : 5px; }
#datepicker {font-size : 16px; margin:5px 0; padding : 5px;}

</style>
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
<link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="/academy_ignis/css/common.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
<%
String type=request.getParameter("type");
System.out.println(type);
	request.setCharacterEncoding("utf-8");
	String id= null;
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else{ %>
	<script>
		alert("로그인 후 이용해주시기 바랍니다.");
	</script>
	<%
		response.sendRedirect("./member/login.jsp");
	}
	System.out.println("id는 " +id);

%>
<script>
  $( function() {
    $( "#datepicker" ).datepicker({
        minDate : 0
    });
  });
</script>
<script type="text/javascript">
	function chooseDate(num) {
		var y = document.getElementById("num").value;
		var url = "reserv?num=" + num;
		location.href = url; //url이 가지고 있는 값으로 이동
	}
</script>
<%-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
</head>
<body>
<% pageContext.include("../header/header.jsp"); %>
	<div class="wrapper">
		<div class="container godo">
			<%
				pageContext.include("../ignisCompany_info/leftList2.jsp");
			%>
			<div class="col-xs-12 col-sm-9 col-md-10">
				<div class="panel panel-default">
				
					<div class="panel-heading form-group">
						<h3 id="memTitle">상담 및 예약</h3>
					</div>

					<div class="panel-end">
						<div class="row reservForm">
							<form name="joinform" action="./reservProcess" method="post">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-3 form-group">
											<label>&nbsp;&nbsp;진료 항목 </label>
										</div>
										<div class="col-sm-6 form-group">
											<select class="form-control input-lg" id="y"
												onchange="changeDate();" name="r_guide" >
												 <option value="치아교정" <%if(type.equals("gyoj")) {%>selected<%} %> >치아교정</option>			
												 <option value="임플란트" <%if(type.equals("imple")) {%>selected<%} %>>임플란트</option>				
												 <option value="치아미백" <%if(type.equals("mibak")) {%>selected<%} %>>치아미백</option>			
												 <option value="일반진료" <%if(type.equals("normal")) {%>selected<%} %>>일반진료</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-3 form-group">
											<label>&nbsp;&nbsp;예약날짜 선택</label>
										</div>
										<div class="col-xs-12 col-sm-6 form-group">
											<input type="text" class="form-control input-lg col-xs-12"
												id="datepicker" name="r_day" required="required" >
										</div>
									</div>
									
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									
									<div class="row">
										<div class="row_second">
											<div class="col-sm-3 form-group">
												<label>&nbsp;&nbsp;예약시간 선택</label>
											</div>
											<div class="col-sm-6 form-group">
												<select class="form-control  input-lg" name="r_time"
													onchange="changeTime(this.value);" multiple="multiple">
													<option value="09:00" selected>09:00&nbsp;&nbsp;</option>
													<option value="09:30">09:30&nbsp;&nbsp;</option>
													<option value="10:00">10:00&nbsp;&nbsp;</option>
													<option value="10:30">10:30&nbsp;&nbsp;</option>
													<option value="11:00">11:00&nbsp;&nbsp;</option>
													<option value="11:30">11:30&nbsp;&nbsp;</option>
													<option value="12:00">12:00&nbsp;&nbsp;</option>
													<option value="14:00">14:00&nbsp;&nbsp;</option>
													<option value="14:30">14:30&nbsp;&nbsp;</option>
													<option value="15:00">15:00&nbsp;&nbsp;</option>
													<option value="15:30">15:30&nbsp;&nbsp;</option>
													<option value="16:00">16:00&nbsp;&nbsp;</option>
													<option value="16:30">16:30&nbsp;&nbsp;</option>
													<option value="17:00">17:00&nbsp;&nbsp;</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row" style="text-align: center; margin-top: 3%;">
										<div class="col-sm-12 form-group">
											<input type="text" name="m_id" value="<%=id%>"
												hidden="hidden"> <input type="submit"
												class="btn btn-lg btn-info" value="예약하기"> 
											<a href="javascript:history.go(-1)"><button type="button"
												class="btn btn-lg btn-info">뒤로 가기</button></a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<%@include file="../footer/footer.jsp" %>
 <script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
 <script type="text/javascript" charset="utf-8" src="/academy_ignis/script/myPage.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>

</body>
</html>

