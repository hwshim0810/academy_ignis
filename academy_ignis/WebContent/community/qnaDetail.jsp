<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.bean.ig_qna" %>
<%@ page import="java.util.*" %>
<%
    int pagenum=1;//현재 페이지
    pagenum=(Integer)request.getAttribute("pagenum");
    String id = null;
    if (!(session.getAttribute("m_id") !=null)) {
		out.println("<script>");
		out.println("alert('로그인후 이용해주시기 바랍니다.');");
		out.println("location.href='/academy_ignis/login?page=qnaDetail&pagenum="+pagenum+"';");
		out.println("</script>");
    } else {
		id = (String) session.getAttribute("m_id");
    }
    int qb_groupCount=1;
    qb_groupCount=(Integer)request.getAttribute("qb_groupCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaDetail</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css">
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
		  <div class="col-xs-12 col-sm-9 col-md-10 ">
		  		<h3>Q&A</h3><hr>
			 <table class="table">
			    <tbody>
			    <%List<ig_qna> list=null;
			    if(request.getAttribute("qnaDetail")!=null){
			    	list = (List)request.getAttribute("qnaDetail");
			    	
			    	if(list.get(0).getQb_private()==1){
			    		if(!session.getAttribute("m_id").equals(request.getAttribute("replyOwenr").toString())){
			    		if(!list.get(0).getM_id().equals(session.getAttribute("m_id")) 
			    				&&!session.getAttribute("m_level").toString().equals("3")
			    				){
			    			out.println("<script>");
			    			out.println("alert('비공개 문의는 본인만 보기 가능합니다..');");
			    			out.println("location.href='/academy_ignis/qna';");
			    			out.println("</script>");
			    		}
			    		}
			    	}
			    	%>
			      <tr>
			      <th>말머리</th>
			        <td><%=list.get(0).getQb_mal() %></td>
			        <th>작성자</th>
			        <td colspan="3"><%=list.get(0).getM_id()%></td>
			      </tr><tr>
			      <th>제목</th>
			        <td><%=list.get(0).getQb_title() %></td>
			        <th>등록일</th>
			        <td><%=list.get(0).getQb_regdate() %></td>
			        <th>조회수</th>
			        <td><%=list.get(0).getQb_readcount() %></td>
			      </tr>
			      <tr>
			      	<td colspan="6">
			      		<%=list.get(0).getQb_content() %>
			      	</td>
			      </tr>
			    </tbody>
			  </table>
			      <%
			    } %>
			
			<a href="qna?pagenum=<%=pagenum%>"><button type="button" class="btn btn-info" >목록</button></a>
			<%if(list.get(0).getM_id().equals(session.getAttribute("m_id"))&&qb_groupCount!=2) {%>
			<a href="qnaUpdateView?pagenum=<%=pagenum%>&qb_num=<%=list.get(0).getQb_num()%>"><button type="button" class="btn btn-primary" >수정</button></a>
			<button type="button" class="btn btn-danger"  data-toggle="collapse" data-target="#demo1">삭제</button>
			<div class="container">
			  <div id="demo1" class="collapse">
			  <form action="qnaDelete?pagenum=<%=pagenum%>&qb_num=<%=list.get(0).getQb_num()%>"  method="post" >
			확인을 위하여 비밀번호를 입력해주세요.<input type="password" name="password">
			<button type="submit" class="btn btn-danger" >삭제 확인</button>
			</form>
		  </div>
		</div>
		
		<%}else if(list.get(0).getM_id().equals(session.getAttribute("m_id"))&&qb_groupCount==2){%>
		<button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#demo2">삭제</button>
		<div class="container">
		  <div id="demo2" class="collapse">
		  <form action="qnaDelete?pagenum=<%=pagenum%>&qb_groupnum=<%=list.get(0).getQb_num()%>"  method="post" >
		확인을 위하여 비밀번호를 입력해주세요.<input type="password" name="password">
		<button type="submit" class="btn btn-danger" >삭제 확인</button>
		</form>
	  </div>
	</div>
	
	<%} %>
	<%
	if(list.get(0).getQb_num()== list.get(0).getQb_groupnum() 
	&&((Integer)request.getAttribute("qb_groupCount"))<2
	&&session.getAttribute("m_level").toString().equals("3")){%>
	<a href="qnaReplyView?qb_num=<%=list.get(0).getQb_num()%>&pagenum=<%=pagenum%>"><button type="button" class="btn btn-danger" >답변</button></a>
	<%} %>
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