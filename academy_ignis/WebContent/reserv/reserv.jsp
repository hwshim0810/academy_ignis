<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("utf-8");

	Calendar cal = Calendar.getInstance(); //현재 시스템이 가지고 있는 날짜 데이터 가지고 오기

	int y = cal.get(Calendar.YEAR);
	int m = cal.get(Calendar.MONTH) + 1;
	int d = cal.get(Calendar.DATE);
	
	String _y = request.getParameter("y");
	String _m = request.getParameter("m");

	String _d = request.getParameter("d");
	
	if (_y != null)
		y = Integer.parseInt(_y);
	if (_m != null)
		m = Integer.parseInt(_m);
	if (_d != null)
		d = Integer.parseInt(_d);
	
	
	//y년 m월 1일의 요일
	cal.set(y, m - 1, 1);
	y = cal.get(Calendar.YEAR);
	m = cal.get(Calendar.MONTH) + 1;

	int w = cal.get(Calendar.DAY_OF_WEEK); //1(일)~7(토) => 일요일일때 w에 1. 메소드를 외우면 된다.
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
.select1 { width : 30%; height : 40px; padding : 5px; }
.select11 { width : 60%; height : 80px; margin : 10px 0; padding : 5px; }

.form-group label { font-size : 1.2em; }
table td a { color : #000; }
table td:first-child a { color : #f00!Important; }
table td:last-child a { color : blue!Important; }
table td { font-size : 1.2em; padding : 7px 0; }
</style>

<script type="text/javascript">
	function changeDate() {
		var y = document.getElementById("y").value;
		var m = document.getElementById("m").value;
		var d = documnet.getElementById("d").value;
		var url = "reserv.jsp?y=" + y + "&m=" + m + "&d=" + d;
		location.href = url; //url이 가지고 있는 값으로 이동
	}
	
	function changeTime(num) {
		var y = document.getElementById("num").value;
		var url = "reserv.jsp?num=" + num;
		location.href = url; //url이 가지고 있는 값으로 이동
	}
	
	function changeDay() {
		alert("하이");
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
								<input type="radio"  value="치아교정" name="tooth"  checked/><label for="치아교정">치아교정</label>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  value="임플란트" name="tooth" /><label for="임플란트">임플란트</label>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  value="치아미백" name="tooth" /><label for="치아미백">치아미백</label>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  value="일반진료" name="tooth" /><label for="일반진료">일반진료</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>예약날짜 선택</label>
							</div>
							<div class="col-sm-7 form-group">
							<select class="select1" id="y" onchange="changeDate();">
									<%
										for (int i = y - 5; i <= y-1; i++) {
									%>
									<option value="<%=i%>"><%=i%>년
									</option>
									<%
										}
									%>
									<option value="<%=y%>" selected="selected"><%=y%>년
									</option>
									<%
										for (int i = y + 1; i <= y + 5; i++) {
									%>
									<option value="<%=i%>"><%=i%>년
									</option>
									<%
										}
									%>
							</select> 
							<select class="select1"  id="m" onchange="changeDate();">
									<%
										for (int i = 1; i <= 12; i++) {
									%>
									<option value="<%=i%>"
										<%=m == i ? "selected='selected'" : ""%>><%=i%>월
									</option>
									<% } %>
							</select>
							<select class="select1"  id="d" onchange="changeDate();">
									<%
										for (int i = 1; i <= cal.getActualMaximum(Calendar.DATE); i++) {
									%>
									<option value="<%=i%>"
										<%=d == i ? "selected='selected'" : ""%>><%=i%>일
									</option>
									<% } %>
							</select>
							<br/>
							
								<table>
									<caption style="height: 5px;"></caption>
									<tr height="25">
										<td width="100" bgcolor="#c8c8c8" align="center"><font
											color="red">	일</font></td>
										<td width="100" bgcolor="#c8c8c8" align="center">월</td>
										<td width="100" bgcolor="#c8c8c8" align="center">화</td>
										<td width="100" bgcolor="#c8c8c8" align="center">수</td>
										<td width="100" bgcolor="#c8c8c8" align="center">목</td>
										<td width="100" bgcolor="#c8c8c8" align="center">금</td>
										<td width="100" bgcolor="#c8c8c8" align="center"><font
											color="blue">토</font></td>
									</tr>
								<%
										//1일 앞부분 공백처리
										out.println("<tr height='25'>");
										for (int i = 1; i < w; i++) { // 6월의 1일은 토요일이라 w=7 따라서 공백 6번을 써준다.
											out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
										}
										//1~마지막일 계산
										String fc;
										for (int i = 1; i <= cal.getActualMaximum(Calendar.DATE); i++) {
											fc = w % 7 == 1 ? "red" : (w % 7 == 0 ? "blue" : "black");
											out.println("<td align='center' bgcolor='#ffffff' height='70'>");
											out.println(i + "<br/>");
											out.println("<span id='안녕' onclick='changeDay()'><a href = '#'>예약</a></span></td>");
											
											w++;
											if (w % 7 == 1 && i != cal.getActualMaximum(Calendar.DATE)) {
												out.println("</tr>");
											}
										}

										// 뒷부분 공백처리
										if (w % 7 != 1) {
											if (w % 7 == 0) {
												out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
											} else {
												for (int i = w % 7; i <= 7; i++)
													out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
											}
											out.println("</tr>");
										}
									%>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>예약시간 선택</label>
							</div>
							<div class="col-sm-7">
								<select class="select11" name="clitime" onchange="changeTime(this.value);" multiple = "multiple">
									<%--
										boolean isDoc = false;
										String value = null;
										// 의사의 진료 여부 확인.
										// true값이면 진료 있음, false이면 진료 없음.
										if(isDoc == true)value = "(예약불가)"; else value="(예약가능)";
										
										
										String isBook1= "(이용불가)";
										
										--%>
									
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
								<textarea style="resize : none; width : 100%;" rows="5" ; cols="70"; title="원하는 상담 내용을 입력하세요."  name="clitext"  placeholder="원하는 상담 내용을 입력하세요."></textarea>
							</div>
						</div>
						<input type="submit" class="btn btn-lg btn-info" value="예약하기">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>










