<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>abouts_us</title>
<meta http-equiv="X-UA-Compatible"  content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/academy_ignis/css/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/academy_ignis/css/common.css">



</head> 
<style>
	div.container-large { margin : 2% auto; }
	.container-small {border-style:none;}
	img {width:90%; height:20%; margin : 0 auto; border : 1px solid #eee; }
	.container-tiny {margin : 5px 0;}
	div.hr { border-top : 1px solid #eee; float : left; width : 100%; }
	label.sub-letter { margin-top : 3%; min-width : 80%; }
	label.sub-letter span { font-weight : normal; }
	div.container-tiny { float: right;  }
</style>

<body>
	<%
		pageContext.include("../header/header.jsp");
	%>
<div class="wrapper">
	<div class="container">
		<%--
			pageContext.include("departmentLeftList.jsp");
		--%>
		<div class="col-xs-12 col-sm-12 col-md-12">
			<div class="container-fulid">
					<div class ="container-large col-xs-12 col-sm-12 col-md-12">
						<div class="container-median">
							<div class="container-small col-xs-12 col-sm-5 col-md-5">
								<img alt="사진 치아교정" src="/academy_ignis/image/gyoj.jpg" class="img-rounded img-responsive">
							</div>
							<div class="container-small col-xs-12 col-sm-7 col-md-7">
								<label class="sub-letter">
									<h4><strong>치아교정</strong></h4>
									<span>
									치아교정이란? 부정교합의 원인을 찾아내고, 얼굴모습과 조화를 고려한 적절한 치료계획이 요구됩니다.
									얼굴의 형태에 따라 치아의 배열을 맞추어 위아랫니가 잘 맞물리게 하며, 입의 모양을 바로 잡아주고
									음식물을 잘 씹을 수 있도록 해주는 것이 목적입니다. 발음 또한 명료해집니다.
									</span>
								</label>						
								<div class="container-tiny">
									<a href ="./reserv?type=gyoj"><button type="button" class="btn btn-info btn-default btn-reserv">예약하기</button></a>&nbsp;					
									<a href ="/academy_ignis/departmentInfo?guide=gyoj"><button type="button" class="btn btn-info btn-default btn-depart">상세보기</button></a>							
								</div>
							</div>							
						</div>
					</div>
					<div class="hr"></div>
					<div class = "container-large col-xs-12">
						<div class="container-median">
							<div class="container-small col-xs-12 col-sm-5 col-md-5">
								<img alt="사진 임플란트" src="/academy_ignis/image/imple.jpg" class="img-rounded img-responsive">
							</div>
							<div class="container-small col-xs-12 col-sm-7 col-md-7">
								<label class="sub-letter">
									<h4><strong>임플란트</strong></h4>
									<span>
									임플란트란? 치아의 결손이 있는 부위나 치아를 뽑은 자리에 인체에 무해하며 
									부작용이 없는 티타늄으로 제작된 본체를 심고 그 위에 자연치의 모양과 
									흡사한 보철물을 씌워 자연치의 기능을 회복시켜 주는 치료입니다.
									</span>
								</label>
								<div class="container-tiny">
									<a href ="./reserv?type=imple"><button type="button" class="btn btn-info btn-default btn-reserv">예약하기</button></a>&nbsp;			
									<a href ="/academy_ignis/departmentInfo?guide=imple"><button type="button"  class="btn btn-info btn-default btn-depart">상세보기</button></a>
								</div>
							</div>							
						</div>
					</div>
					<div class="hr"></div>
					<div class = "container-large col-xs-12">
						<div class="container-median">
							<div class="container-small col-xs-12 col-sm-5 col-md-5">
								<img alt="사진 치아미백" src="/academy_ignis/image/mibak.png" class="img-rounded img-responsive">
							</div>
							<div class="container-small col-xs-12 col-sm-7 col-md-7">
								<label class="sub-letter">
									<h4><strong>치아미백</strong></h4>
									<span>
									치아미백이란? 변색 치아를 하얗게 만드는 시술로서
									 치과에서의 미백(office bleaching)은	15% 고농도
									15% 고농도의 과산화수소를 사용하여 산화 작용으로
									착색제 구조를 단순화시켜 미백이 일어나는 것입니다.
									</span>
								</label>
								<div class="container-tiny">
									<a href ="./reserv?type=mibak"><button type="button" class="btn btn-info btn-default btn-reserv">예약하기</button></a>&nbsp;							
									<a href ="/academy_ignis/departmentInfo?guide=mibak"><button type="button" class="btn btn-info btn-default btn-depart">상세보기</button></a>							
								</div>
							</div>
						</div>
					</div>
					<div class="hr"></div>
					<div class = "container-large col-xs-12">
						<div class="container-median">
							<div class="container-small col-xs-12 col-sm-5 col-md-5">
								<img alt="사진 일반진료" src="/academy_ignis/image/normal.png" class="img-rounded img-responsive">
							</div>
							<div class="container-small col-xs-12 col-sm-7 col-md-7">
								<label class="sub-letter">
									<h4><strong>일반진료</strong></h4>
									<span>
									충치치료/실란트<br>
									사랑니 치료<br>
									스케일링<br>
									TBI / PMTC / 불소도포<br>
									올바른 칫솔법
									</span>
								</label>
								<div class="container-tiny">
									<a href ="./reserv?type=normal"><button type="button" class="btn btn-info btn-default btn-reserv ">예약하기</button></a>&nbsp;						
									<a href ="/academy_ignis/departmentInfo?guide=normal"><button type="button" class="btn btn-info btn-default btn-depart">상세보기</button></a>							
								</div>
							</div>
						</div>
					</div>
					<div class="hr"></div>
				<label class="sub-letter">
					<a href="javascript:history.go(-1)" ><button type="button" class="btn btn-default btn-info">뒤로 가기</button></a>
				</label>
			</div>
		</div>
	</div>
</div>
<%-- Footer 시작 --%>
<%@include file="../footer/footer.jsp" %>
<%-- Footer 종료 --%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="/academy_ignis/script/jquery-confirm.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="/academy_ignis/script/index_login.js?v=2"></script>
		
<%
	if (id != null) {
%>		<script type="text/javascript">userLogin();</script>
<% 	} else { %>
		<script type="text/javascript">userLogout();</script>
<%  } %>
</body>
</html>