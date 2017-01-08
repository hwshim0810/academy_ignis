<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ignis.biz.ReservBiz"%>
<%@ page import="ignis.dao.ReservDAO"%>
<%@ page import="ignis.action.ActionForward"%>
<%@ page import="ignis.bean.ig_reserv"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Ignis치과</title>

<script type="text/javascript">
function btnPress1(){
	location.href = "./reserv/reservUpdate.jsp";

}
function btnPress2(){
	
	opener.winodw("")
}
function btnPress3(){
	
}
</script>


</head>
<body>
<%pageContext.include("../ignisCompany_info/header_noTop.jsp"); %>
<%pageContext.include("../header/header.jsp"); %>
<%pageContext.include("../ignisCompany_info/leftList2.jsp"); %>

		
<div class="container text-center">    
	<div class="col-sm-8 col-md-9 well">
	<div class="row">
			<div class="col-xs-10">
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>예약 번호</span></div>
					<div class="col-xs-8 form-group" >
						<input type="text" readonly="readonly" value="55" >
					</div>
				</div>				
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>진료 시간</span></div>
					<div class="col-xs-8 form-group">
						<input type="text" readonly="readonly" value="55">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 form-group">
					<span id=letter>상담 내용</span></div>
					<div class="col-xs-8 form-group">
						<input type="text" readonly="readonly" value="55">
					</div>
				</div>
			<input type="button" value="예약 수정" onclick = "btnPress1()">
			<input type="button" value="예약 삭제" onclick = "btnPress2()">				
			<input type="button" value="뒤로 가기" onclick = "btnPress3()">				
			</div>
	</div>
	</div>
</div>


<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js"></script>
</body>
</html>