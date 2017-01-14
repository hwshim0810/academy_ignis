<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ignis.dao.*" %>
<%@ page import="ignis.bean.*" %>
<%@ page import="java.util.*" %>   
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	
	NoticeDAO noticeDao=new NoticeDAO();
	List<ig_notice> noticeList=noticeDao.lastFiveNotice();
	
	EventDAO eventDao = EventDAO.getInstance();
	List<ig_event> eventList = eventDao.eventList(1, 5);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>IGNIS 치과</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css?v=1">
  <link rel="stylesheet" href="/academy_ignis/css/index.css">
</head>
<body>
<%-- Header 시작 --%>
<%
	pageContext.include("./header/header.jsp");
%>
<%-- Header 종료 --%>
<%-- Body 시작 --%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <a href="#">	
        	<img src="/academy_ignis/image/slide1.png" alt="Image">
        </a>
      </div>
      <div class="item">
        <a href="reserve">	
        	<img src="/academy_ignis/image/slide2.png" alt="Image">
        </a>     
      </div>
      <div class="item">
        <a href="#">	
        	<img src="/academy_ignis/image/slide3.png" alt="Image">
        </a>      
      </div> 
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
<div class="wrapper">
	<div class="container text-center" style="max-width : 970px;">    
	  <br><br>
	  <div class="row">
	  <%-- 공지사항 / 이벤트 --%>
	  	<div class="col-sm-6">
		  	<ul class="nav nav-tabs">
			  <li class="active"><a data-toggle="tab" href="#home" alt="공지사항">공지사항</a></li>
			  <li><a data-toggle="tab" href="#menu1"  alt="이벤트">이벤트</a></li>
			</ul>
	  		<div class="well" style="background-color : #fff;">
	  			<div class="container-fluid">
					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">
							<div class="list-group" >
								<% for(int i=0;i<noticeList.size();i++){ %>
								<a href="noticeDetail?nb_num=<%=noticeList.get(i).getNb_num()%>" class="list-group-item" ><%=noticeList.get(i).getNb_title() %></a>
								<% } %>
							</div>
						</div>
					  	<div id="menu1" class="tab-pane fade">
							<div class="list-group">
					      		<% for(int i=0;i<eventList.size();i++){ %>
						      	<a href="/academy_ignis/EventView?login=member&pageNo=1&num=<%= eventList.get(i).getEb_num()%>" class="list-group-item"><%=eventList.get(i).getEb_title() %></a>
						      	<%} %>
							</div>
						</div>
					</div>
	  			</div>
	  		</div>
	  	</div>
	  	<%-- 진료안내 / 온라인예약 --%>
	    <div class="col-sm-6">
	    	<div class="reservIndex">
	    		<img src="/academy_ignis/image/reserv.png" class="img-responsive" style="width:100%" alt="진료시간 안내">
	    		<div class="reservBtn">
	    			<a href="/academy_ignis/departmentAll" class="btn godo" role="button">진료 안내</a>
	    			<a href="/academy_ignis/reserv" class="btn godo" role="button">온라인 예약</a>
	    		</div>
	    	</div>
	    </div>
	  </div>
	</div>	
</div>
<%-- Body 종료 --%>
<%-- Footer 시작 --%>
<%@include file="./footer/footer.jsp" %>
<%-- Footer 종료 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/jquery-confirm.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/academy_ignis/script/index_login.js?v=6"></script>
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>