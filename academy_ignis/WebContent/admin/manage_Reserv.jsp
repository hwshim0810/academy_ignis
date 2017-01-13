<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.ReservDAO" %>
<%@ page import="ignis.bean.ig_reserv" %>
<%@ page import="java.util.List" %>
<%request.setCharacterEncoding("UTF-8"); %>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("/academy_ignis/admin/ad_Login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/academy_ignis/script/ad_Manage.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
<script>
	$(function() {
		$('#reservSubmit').click(function (event) {
			$.ajax({
				type : "post",
	 			url : "/academy_ignis/admin/search_Reserv.jsp",
			  	data : {searchType : $('#searchType').val(), 
			  		searchContent : $("#searchContent").val(), 
			  		pageNum : 1},
				success : function(data) { $('#reservContent').html(data); },
				error : function(request, status, error){alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); }
			});
			return false;
		});
	});
</script>
</head>
<style>
.add {background-color: #e1e1e1; color: black;}
.delete {background-color: #f44336;}
</style>
<body>

<% 
	ReservDAO reservDao = ReservDAO.getInstance();
	 int totalRows = reservDao.getListcount(); %> 
	 <%-- getListcount는 모든 회원의 전체 예약 수 --%>
<% ReservDAO reservDAO = new ReservDAO(); %>
<%@include file="../paging/getPageNum.jsp" %>
<% List<ig_reserv> reservList = reservDAO.getReservListAll(begin, end); %>
	 <%-- getReservListAll은 begin부터 end까지의 게시물을 최신글(r_num의 역순)
	 순서대로 조회 --%>
<% pageContext.include("./manage_Header.jsp"); %>
	 <div class="container-fluid main-container">	
	<% pageContext.include("./manage_sideNav.jsp"); %>
  		<div class="col-md-10 content">
  			  <div class="panel panel-default">
				<div class="panel-heading">
					<h2 id="memTitle">예약 관리 리스트</h2>
					<h5>&nbsp;총 예약수 : <%=totalRows %></h5>
				</div>
				<div class="panel-body" >
				<div id="reservContent">
					<table class="table table-responsive">
					<caption class="sr-only">회원명단</caption>
					<thead>
						<tr><th>예약번호</th><th>회원 아이디</th><th>진료 항목</th><th>진료 일자</th>
						<th>진료 시간</th><th>예약 신청일</th><th>상세보기</th></tr>
					</thead>
					<tbody>
					<% 
						if (reservList != null) {
							for (int i = 0; i < reservList.size(); i++) {
								ig_reserv reserv = reservList.get(i);
					%>
						<tr>
						<td><%=reserv.getR_num() %></td>
						<td><%=reserv.getM_id() %></td>
						<td><%=reserv.getR_guide() %></td>
						<td><%=reserv.getR_day() %></td>
						<td><%=reserv.getR_time() %></td>
						<td><%=reserv.getR_regdate() %></td>
						<td><a href="/academy_ignis/reservInfo?getR_num=<%=reserv.getR_num()%>">보기</a>
						
						<%-- 추후 수정 예정
						<% if(reserv.getR_findDoc() == "true")
						{
							%>
							<td>진료 가능</td>
						<% } else { %>
							<td>진료 불가</td>
								
						<%=reserv.getR_findDoc() %></td>
						 --%>
						</tr>
					<%
							}
						} else {
					%>
					<tr><td colspan="7">예약 정보가 없습니다.</td></tr>
					<%	} %>
					</tbody>
				</table>
				<div class="panel-end">
					<ul class="pager">
					  <li><a href="/academy_ignis/manage_Reserv?pageNo=1">첫 페이지</a></li>
					  <li>
					  	<% if (prevPage != 0) { %><a href="/academy_ignis/manage_Reserv?pageNo=<%=prevPage %>">◁</a><% } %>
					  </li>
					 	<% for (int i = beginPage; i <= endPage; i++) { %>
					  <li><a href="/academy_ignis/manage_Reserv?pageNo=<%=i %>"><%=i %></a></li>
					  	<% } %>
					  <li>
					 	 <% if (nextPage != 0) { %><a href="/academy_ignis/manage_Reserv?pageNo=<%=nextPage%>">▷</a><% } %>
					  </li>
					  <li><a href="/academy_ignis/manage_Reserv?pageNo=<%=totalPages %>">마지막 페이지</a></li>
					</ul>
				</div>
			</div>
			
					<form class="form-inline">
					  <div class="form-group">
					  	<label for="sel1">검색 범위</label>
					  <select class="form-control" id="searchType" name="searchType">
					    <option value="all">전체</option>
					    <option value="r_num">예약번호</option>
					    <option value="m_id">회원아이디</option>
					    <option value="r_guide">진료 항목</option>
					    <option value="r_day">진료 일자</option>
					    <option value="r_time">진료 시간</option>
					    <option value="r_regdate">예약 신청일</option>
					  </select>
					  </div>
					  <div class="form-group">
					    <label class="sr-only" for="search">검색 내용:</label>
					    <input type="text" class="form-control" id="searchContent" name ="searchContent">
					  </div>
					  <button type="button" class="btn btn-default"  id="reservSubmit">검색</button>
					
					 
					</form>
					<div style="float : right">
						<a href="/academy_ignis/reservAdd"><button type="button" class="btn btn-default add"  id="reservAdd"  style="list-style-position: "><strong>예약 추가</strong></button></a>
					
					</div>
			</div>
			</div>
		</div>
		<%pageContext.include("./manage_Footer.jsp"); %>
</div>
</body>
</html>