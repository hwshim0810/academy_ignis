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

	if (_y != null)
		y = Integer.parseInt(_y);
	if (_m != null)
		m = Integer.parseInt(_m);

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
textarea { rows="10"; cols="70"; }
tr.days {
	text-align: center;
}

td {
	font-size: 9pt;
}

a {
	text-decoration: none;
}

a:HOVER {
	text =decoration: underline;
	color: tomato;
}
body { font-size: 20px;}
</style>

<script type="text/javascript">
	function changeDate() {
		var y = document.getElementById("y").value;
		var m = document.getElementById("m").value;
		var url = "reserv.jsp?y=" + y + "&m=" + m;
		location.href = url; //url이 가지고 있는 값으로 이동
	}
	
	function changeTime(num) {
		var y = document.getElementById("num").value;
		var url = "reserv.jsp?num=" + num;
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
			<div class="row">
				<form name="joinform" action="./reservProcess" method="post">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>진료 항목 </label>
							</div>
							<div class="col-sm-7 form-group" >
								<input type="radio"  value="치아교정" name="tooth" />치아교정&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  value="임플란트" name="tooth" />임플란트&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  value="치아미백" name="tooth" />치아미백&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  value="일반진료" name="tooth" />일반진료
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>예약시간 선택</label>
							</div>
							<div class="col-sm-7 form-group">
								<select id="selectBox"  name="clitime" onchange="changeTime(this.value);">
									<option value = "09:00" >09:00</option><option value = "09:30">09:30</option>
									<option value = "10:00">10:00</option><option value = "10:30">10:30</option>
									<option value = "11:00">11:00</option><option value = "11:30">11:30</option>
									<option value = "12:00">12:00</option><option value = "14:00">14:00</option>
									<option value = "14:30">14:30</option><option value = "15:00">15:00</option>
									<option value = "15:30">15:30</option><option value = "16:00">16:00</option>
									<option value = "16:30">16:30</option><option value = "17:00">17:00</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>예약날짜 선택</label>
							</div>
							<div class="col-sm-7 form-group">
								<table>
									<caption style="height: 40px;">
										<select id="y" onchange="changeDate();">
											<%
												for (int i = y - 5; i <= y; i++) {
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
										</select> <select id="m" onchange="changeDate();">
											<%
												for (int i = 1; i <= 12; i++) {
											%>
											<option value="<%=i%>"
												<%=m == i ? "selected='selected'" : ""%>><%=i%>월
											</option>
											<%
												}
											%>
										</select>

									</caption>

									<tr height="25">
										<td width="100" bgcolor="#c8c8c8" align="center"><font
											color="red">일</font></td>
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
											out.println("<td align='center' bgcolor='#ffffff' style='color:" + fc + ";'>");

											out.print(i + "</td>");

											w++;
											if (w % 7 == 1 && i != cal.getActualMaximum(Calendar.DATE)) {
												
												out.println("</tr>");
												out.println("<tr height='70'>"); // 공백 부분
												for (int j = 1; j <= 7; j++)
													out.println("<td align='center' bgcolor='#ffffff';>&nbsp;</td>");
												out.println("</tr>"); //  공백 부분
												out.println("<tr height='25'>");
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
											out.println("<tr height='100'>");// 맨아랫 부분 공백 
											for (int j = 1; j <= 7; j++)
												out.println("<td align='center' bgcolor='#ffffff';>&nbsp;</td>");
											out.println("</tr>");
										}
									%>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>내용</label>
							</div>
							<div class="col-sm-7 form-group">
								<textarea style="resize : none; width : 100%;" title="원하는 상담 내용을 입력하세요."  name="clitext"  placeholder="원하는 상담 내용을 입력하세요."></textarea>
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










