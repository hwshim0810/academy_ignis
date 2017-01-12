<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = null;
	
	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	else
		response.sendRedirect("./ad_Login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ignis치과 관리자페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/academy_ignis/css/ad_Manage.css">
<link rel="stylesheet" href="/academy_ignis/css/daterangepicker.css">
</head>
<body>
<%
	pageContext.include("./manage_Header.jsp");
%>
  	<div class="container-fluid main-container">
<%
	pageContext.include("./manage_sideNav.jsp");
%>
  		<div class="col-md-10 content">
  			  <div class="panel panel-default">
				<div class="panel-heading">
					EVENT 글쓰기
				</div>
				<div class="panel-body">
					<form class="form-horizontal" name="insertEvent" method="post" action="/academy_ignis/EventWrite">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>제목</th>
									<td>
										<div class="form-group col-xs-12">
                							<input type="text" name="eb_title" required="required" class="form-control" />
            							</div>
									</td>
									<th>글쓴이</th>
									<td>
										<div class="form-group col-xs-12">
                							<input type="text" name="eb_writer" required="required" class="form-control" value="이그니스 치과" readonly />
            							</div>
									</td>
								</tr>
								<tr>
									<th>이벤트 기간</th>
									<td colspan="3">
										<div class="form-group col-xs-12">
                							<input type="text" name="eb_period" required="required" class="form-control" />
            							</div>
									</td>
								</tr>
								<tr>
									<th>당첨자 수</th>
									<td>
										<div class="form-group col-xs-12">
                							<input type="number" name="eb_winner" required="required" class="form-control">
            							</div>
									</td>
									<th>발표 날짜</th>
									<td>
										<div class="form-group col-xs-12">
                							<input type="text" name="eb_announceday" required="required" class="form-control" />
            							</div>
									</td>
								</tr>
								<tr>
									<th>이벤트 내용</th>
									<td colspan="3">
										<div class="form-group col-xs-12">
											<textarea class="form-control" rows="5" required="required" name="eb_content"></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align : center;">
										<div class="form-group">
								            <div class="col-md-offset-2 col-md-10">
								                <button type="button" class="btn btn-danger"  onclick="document.location.href='/academy_ignis/Event?login=admin'">취소</button>
								            	<button type="submit" class="btn btn-primary">등록</button>
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
<%
	pageContext.include("./manage_Footer.jsp");
%>
  	</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript"src="/academy_ignis/script/moment.js"></script>
 <script type="text/javascript"src="/academy_ignis/script/daterangepicker.js"></script>
 <script src="/academy_ignis/script/ad_Manage.js"></script>
 <script src="/academy_ignis/script/event.js"></script>
</body>
</html>