<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id= null;
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
	response.sendRedirect("./login");
	
	System.out.println("id는 " +id);
%>

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

.reservForm select {
	
	font-size : 1.5em
 }
 
 .row_second {margin : 60px 0;}
.select1 { width : 30%; height : 40px; padding : 5px; }
.select11 { width : 60%; height : 80px; margin : 10px 0; padding : 5px; }
#datepicker {font-size : 16px; width : 30%; margin:5px 0; padding : 5px;}
.form-group label { font-size : 1.2em; }
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
<script type="text/javascript">
	function chooseDate(num) {
		var y = document.getElementById("num").value;
		var url = "reserv?num=" + num;
		location.href = url; //url이 가지고 있는 값으로 이동
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h3 class="well">상담 및 예약</h3>
		<div class="col-lg-12 well">
			<div class="row reservForm">
				<form name="joinform" action="./reservProcess" method="post">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>진료 항목 </label>
							</div>
							<div class="col-sm-7 form-group" >
								<select class="select1" id="y" onchange="changeDate();" name="r_guide">
								<option value="치아교정">치아교정</option>
								<option value="임플란트">임플란트</option>
								<option value="치아미백">치아미백</option>
								<option value="일반진료">일반진료</option>
								</select> 
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>예약날짜 선택</label>
							</div>
							<div class="col-sm-7 form-group">
								<p><input type="text" id="datepicker" value="날짜를 선택하세요" 
								onfocus="if(this.value=='날짜를 선택하세요'){this.value=''}"
								onblur="if(this.value==''){this.value='날짜를 선택하세요'}" onclick ="chooseDate(this.value)" name="r_day"/></p>	
							</div>
						</div>
						<div class="row">
							<div class = "row_second">
							<div class="col-sm-3 form-group">
								<label>예약시간 선택</label>
							</div>	
							<div class="col-sm-7">
								<select class="select11" name="r_time" onchange="changeTime(this.value);" multiple = "multiple">
									<option value = "09:00" selected>09:00&nbsp;&nbsp;(예약 가능)</option> 
									<option value = "09:30">09:30&nbsp;&nbsp;(예약 가능)</option>
									<option value = "10:00">10:00&nbsp;&nbsp;(예약 가능)</option>
									<option value = "10:30">10:30&nbsp;&nbsp;(예약 가능)</option>
									<option value = "11:00">11:00&nbsp;&nbsp;(예약 가능)</option>
									<option value = "11:30">11:30&nbsp;&nbsp;(예약 가능)</option>
									<option value = "12:00">12:00&nbsp;&nbsp;(예약 가능)</option>
									<option value = "14:00">14:00&nbsp;&nbsp;(예약 가능)</option>
									<option value = "14:30">14:30&nbsp;&nbsp;(예약 가능)</option>
									<option value = "15:00">15:00&nbsp;&nbsp;(예약 가능)</option>
									<option value = "15:30">15:30&nbsp;&nbsp;(예약 가능)</option>
									<option value = "16:00">16:00&nbsp;&nbsp;(예약 가능)</option>
									<option value = "16:30">16:30&nbsp;&nbsp;(예약 가능)</option>
									<option value = "17:00">17:00&nbsp;&nbsp;(예약 가능)</option>
							</select>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>내용</label>
							</div>
							<div class="col-sm-7 form-group">
								
							</div>
						</div>
						<input type="text" name="m_id" value="<%=id %>" hidden="hidden">
						<input type="submit" class="btn btn-lg btn-info" value="예약하기">
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>










