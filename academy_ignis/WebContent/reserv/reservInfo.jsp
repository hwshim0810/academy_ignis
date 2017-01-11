
<%@page import="ignis.action.MemberLoginAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReservDAO" %>
<%@ page import="ignis.bean.ig_reserv" %>
<%@ page import="java.util.List" %>
<% 
	String id = null;
	if (session.getAttribute("m_id") != null) {
		id = (String) session.getAttribute("m_id");
	}
	else
		response.sendRedirect("./member/login.jsp");
%>
    
<% String reserv_num = request.getParameter("getR_num"); %>
<%  	ReservDAO reservDao = ReservDAO.getInstance(); %>
<% List<ig_reserv> reservList = reservDao.getReservInfo(reserv_num);  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script>
	$(function() {
		$('#reservSubmit').click(function () {
			
			$.ajax({
				type : "post",
	 			url : "./reserv/welcome.jsp",
			  	data : {reservSearch : $('#reservSearch').val().trim()},
				success : function(data) { $('#reservContent').html(data); },
				error : function error(){alert("error"); }
			});
			return false;
		});
	});
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
</head>
<body>

<% pageContext.include("../header/header.jsp"); %>
<% pageContext.include("../ignisCompany_info/leftList2.jsp"); %>

  	<div class="container-fluid main-container">
  		<div class="col-md-10 content" >
  			  <div class="panel panel-default">
				<div class="panel-heading">
					<h2 id="memTitle">예약 관리 리스트</h2>
				</div>
				<table class="table">
					<caption class="sr-only">회원명단</caption>
					<thead>
						<tr class="info"><th>항목</th><th>내용</th></tr>
					</thead>
					<tbody>
					
					<%
						if (reservList != null) {
							for (int i = 0; i < reservList.size(); i++) {
								ig_reserv reserv = reservList.get(i);
							
					%>
					<tr><td>예약 번호</td><td><%=reserv.getR_num() %></td></tr>
					<tr><td>예약 항목</td><td><%=reserv.getR_guide() %></td></tr>
					<tr><td>예약 일자</td><td><%=reserv.getR_day() %></td></tr>
					<tr><td>예약 시간</td><td><%=reserv.getR_time() %></td></tr>
					<tr><td>예약 신청일</td><td><%=reserv.getR_regdate() %></td></tr>
					<%
							}
						} else {
					%>
					<tr><td colspan="7">예약 정보가 없습니다.</td></tr>
					<%	} %>
					</tbody>
				</table>
				<div class="panel-end">
					<button type="button" class="btn btn-default add"  id="reservUpdate"  style="list-style-position: "><strong>예약 수정</strong></button>
					<button type="button" class="btn btn-default add"  id="reservDelete"  style="list-style-position: "><strong>예약 삭제</strong></button>
					<a href="javascript:history.go(-1)"><button type="button" class="btn btn-default add"><strong>뒤로 가기</strong></button></a></div>
			</div>
</div>
<%@include file="../footer/footer.jsp" %>

  	
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
 
 
 
</div>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=2"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/myPage.js"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>
