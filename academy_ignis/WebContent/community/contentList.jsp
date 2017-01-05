<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ignis.bean.ig_notice" %>
    <%@ page import="java.util.*" %>
    <%@ page import="ignis.dao.noticeDAO" %>
    <%@ page import="ignis.biz.NoticeBiz" %>
    <%
    int pagenum=1;//현재 페이지
	int pagelimit=10;//한 페이지 리스트수
	int pageCount=10;//마지막 페이지
	int startpage=1;//페이지 범위
	int endpage=10;//페이지 범위
	pagelimit=(Integer)request.getAttribute("pagelimit");
	pageCount=(Integer)request.getAttribute("pageCount");
	startpage=(Integer)request.getAttribute("startpage");
	endpage=(Integer)request.getAttribute("endpage");
    if(request.getParameter("pagenum")!=null){
    	pagenum=Integer.parseInt(request.getParameter("pagenum"));
    }else{pagenum=1;}
	if(endpage>pageCount){endpage=pageCount;}
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
  function searchAll(){
	  
	  var searchOption=$("#searchOption").val();
	  var searchContent=$("#searchContent").val();
	  alert(searchOption);	
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
		xhttp.open("GET","searchList",true);
		xhttp.send();
  }
  </script>
</head>
<body>
  <div class="col-xs-12 col-sm-9 col-md-10 ">
 <h4>공지사항</h4><hr>
 <table class="table">
    <thead>
      <tr class="info">
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
       <th>조회</th>
      </tr>
    </thead>
    <tbody>
    <%List<ig_notice> list=null;
    if(request.getAttribute("noticelist")!=null){
    	list = (List)request.getAttribute("noticelist");
    	
    for(int i=0;i<list.size();i++){
    	list.get(i).getNb_num();
    	%>
      <tr>
        <td><%=list.get(i).getNb_num() %></td>
        <td><a href="noticeDetail?nb_num=<%=list.get(i).getNb_num()%>&pagenum=<%=pagenum%>"><%=list.get(i).getNb_title() %></a></td>
        <td><%=list.get(i).getNb_regdate() %></td>
        <td><%=list.get(i).getNb_readcount() %></td>
      </tr>
      <%}
    } %>
    </tbody>
  </table>
  <ul class="pager">
  <li><a href="notice?pagenum=1">첫 페이지</a></li>
  <li><a href="notice?pagenum=<%=pagenum-1%>">◁</a></li>
 <%for(int pagelist=startpage ; pagelist<=endpage ; pagelist++){ %>
  <li><a href="notice?pagenum=<%=pagelist%>"><%=pagelist %></a></li>
  <%} %>
  <li><a href="notice?pagenum=<%=pagenum+1%>">▷</a></li>
  <li><a href="notice?pagenum=<%=pageCount%>">마지막 페이지</a></li>
</ul>

  <form class="form-inline" >
   <label for="sel1">검색 범위</label>
  <select class="form-control" id="searchOption">
    <option value="nb_all">전체</option>
    <option value="nb_title">제목</option>
    <option value="nb_content">내용</option>
  </select>
  <div class="form-group">
    <label class="sr-only" for="search">검색 내용:</label>
    <input type="text" class="form-control" id="searchContent">
  </div>
  <input type="button" class="btn btn-default" onclick="searchAll()" value="검색" />
</form>
  
  </div>
</body>
</html>