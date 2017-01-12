<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_notice" %>
<%@ page import="java.util.*" %>
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css">
  <script>
  function Act(){
	  
	  var searchOption=document.getElementById("searchOption").value;
	  var searchContent=document.getElementById("searchContent").value;
	  var a={"searchOption":searchOption,"searchContent":searchContent};
	var xhttp;
			xhttp = new XMLHttpRequest();
		//응답을 받아왔을때 처리할 형식 정의
		xhttp.onreadystatechange=function(){
			//onreadystatechange속성이 변경될때마다
			if(xhttp.readyState == 4&&xhttp.status==200){
				//readystate=4는 응답완료상태
				//status=200은 정상적으로 페이지 호출 성공
				//alert(xhttp.responseText);
				document.getElementById("demo").innerHTML=xhttp.responseText;
			}
		};
		//open send 함수 설정
		//get방식으로 요청 데이터를 받을 페이지 true는 비동기통신을 지정
		xhttp.open("GET","/academy_ignis/test.jsp?searchOption="+searchOption+"&searchContent="+
				searchContent,true);
		xhttp.send();
  }
  </script>
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
		<div class="col-xs-12 col-sm-9 col-md-10">
		<div id="demo">
			<%pageContext.include("contentList.jsp"); %>
					</div>
			<form name="search" class="form-inline"  action="notice" method="get">
				<label for="sel1">검색 범위</label>
				<select class="form-control" id="searchOption" name="searchOption">
					<option value="nb_all">전체</option>
					<option value="nb_title">제목</option>
					<option value="nb_content">내용</option>
				</select>
				<div class="form-group">
					<label class="sr-only" for="search">검색 내용:</label>
					<input type="text" class="form-control" id="searchContent" name="searchContent" required="required">
				</div>
				<input type="submit" class="btn btn-default"  value="검색" />
				<input type="button" class="btn btn-default"  onclick="Act()" value="테스트" />
			</form>
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