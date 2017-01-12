<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-2 sidebar">
  	<div class="row">
	<div class="absolute-wrapper"> </div>
	<!-- Menu -->
	<div class="side-menu">
		<nav class="navbar navbar-default" role="navigation">
			<!-- Main Menu -->
			<div class="side-menu-container">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/academy_ignis/member"><span class="glyphicon glyphicon-user"></span> 회원관리</a></li>
					<li><a href="/academy_ignis/EventEntryList"><span class="glyphicon glyphicon-thumbs-up"></span> 응모이벤트관리</a></li>
					<li><a href="/academy_ignis/manage_Reserv"><span class="glyphicon glyphicon-cloud"></span> 예약관리</a></li>

					<!-- Dropdown-->
					<li class="panel panel-default" id="dropdown">
						<a data-toggle="collapse" href="#dropdown-lvl1">
							<span class="glyphicon glyphicon-list-alt"></span> 게시판관리 <span class="caret"></span>
						</a>

						<!-- Dropdown level 1 -->
						<div id="dropdown-lvl1" class="panel-collapse collapse">
							<div class="panel-body">
								<ul class="nav navbar-nav">
									<li><a href="/academy_ignis/notice?login=admin">공지사항</a></li>
									<li><a href="/academy_ignis/Event?login=admin">이벤트</a></li>
									<li><a href="/academy_ignis/qna?login=admin">QnA</a></li>
									<li><a href="/academy_ignis/Review?login=admin">치료후기</a></li>
								</ul>
							</div>
						</div>
					</li>

					<li><a href="#"><span class="glyphicon glyphicon-signal"></span> Link</a></li>

				</ul>
			</div><!-- /.navbar-collapse -->
		</nav>

	</div>
</div>  		</div>