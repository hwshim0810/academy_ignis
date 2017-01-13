<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.container-small {border-style:none;}
	img {width:70%; height:20%; }
</style>
<%
	String id = null;

	if (session.getAttribute("m_id") != null) 
		id = (String) session.getAttribute("m_id");
	
	String guideValue = request.getParameter("guide");
	System.out.println("guideValue의 값은 " +guideValue);
	
	String pictureName = "";
	String guideContent = "";
	
	if (guideValue.equals("gyoj")) {
		pictureName="gyoj.jpg";
		guideContent="치아교정 세부 내용"
		+"1) 교정 진단 : 초진(설문지 작성, 문진 등), 기본적인 X선 촬영, 치아 모형, 얼굴 사진, 구강 "
		+"내 사진 등의 자료를 이용하여 환자가 가진 문제점을 분석, 개개인에 적합한 치료 계획을 확립한다."
		+"2) 교정 치료 : 고정식 교정 장치, 가철식 교정 장치, 구외 장치 등을 이용하여 치아의 이동 및 턱뼈의"
		+"성장을 조절한다. [네이버 지식백과] 교정 치료 [orthodontic treatment](서울대학교병원 의학정보, 서울대학교병원)"
		;
	} else if (guideValue.equals("imple")) {
		pictureName="imple.jpg";
		guideContent="임플란트 세부 내용"
		+"마취를 한 후 잇몸을 절개한다. 턱뼈의 모양이 보이도록 절개된 잇몸을 벌려 준다. 임플란트 위치를 확인하고 "
		+"드릴링(drilling)을 하여 턱뼈 안에 임플란트가 들어갈 공간(hole)을 만들어준다. 임플란트 직경에 맞는 크기가 "
		+"될 때까지 여러 번의 드릴링을 한 후 조심스럽게 임플란트를 심는다. 의사의 판단에 따라 임플란트가 보이지 "
		+"않도록 잇몸을 완전히 덮고 봉합을 하는 2회 수술 방법으로 시술하거나, 임플란트의 치유 지대주가 보이는 상태로 "
		+"잇몸을 봉합하는 1회 수술법으로 임플란트를 턱뼈에 식립한다.(서울대학교병원 의학정보, 서울대학교병원)" 
		;
	} else if (guideValue.equals("mibak")) {
		pictureName="mibak.png";
		guideContent="치아미백 세부 내용 1) 치과 내 미백과정 "
		+"① 전 과정 동안 입술과 볼을 보호하기 위해 볼을 제껴주는 치과용장치(retractor)를 장착한다."
        +"광원으로부터 환자를 보호하기 위해 보안경을 착용하게 한다."
		+"② 일반적으로 오른쪽 제 1소구치에서 왼쪽 제1소구치(작은 어금니)까지 치아를 격리한다."
        +"③ 치은 보호제를 도포하고 침의 분비를 막기 위해 거즈나 롤 코튼(roll cotton)을 사용한다."
		+"④ 광촉매제가 포함된 분말과 과산화수소를 혼합하여 치아 표면에 2mm 두께로 위치시킨다."
		+"⑤ 20~40분간 광원 조사를 하여 미백제를 활성화시킨다."
		+"⑥ 미백제 제거 후 2% 중성불화 나트륨겔을 5~10분간 도포하여 과민 반응을 줄인다."
		+"⑦ 자가 미백을 위해 본을 떠서 미백 장치를 제작한다."
		+"⑧ 미백 장치에 3% 미만의 과산화수소 미백제를 도포 후 집에서 장착한다."
		+"[네이버 지식백과] 치아 미백 [tooth whitening] (서울대학교병원 의학정보, 서울대학교병원)";
	} else if (guideValue.equals("normal")) {
		pictureName="normal.png";
		guideContent="일반진료 세부 내용"
		+"1) 아말감(amalgam) 충전 : 아말감 합금의 성분은 은 65%, 주석 29%, 구리 6%, 아연 2%, "
		+"수은 3%로 이루어져 있다. 아말감은 1회 치료가 가능하고 조작이 간편하고 접착제가 필요가 "
		+"없는 장점이 있으나, 인장강도(재료가 감당할 수 있는 최대의 변형력)가 낮고(즉 아말감 자체를"
		+"사방에서 받쳐주지 않으면 재료 자체가 무너질 수 있음), 경계 주위가 떨어져 나갈 수가 있으며, "
		+"색조가 치아색과 같지 않고, 다른 금속이 부딪힐 경우 정전기 발생 가능성이 있다는 단점이 있다. "
		+"또 굳는 시간이 24시간으로 매우 길다. (서울대학교병원 의학정보, 서울대학교병원)"
		;
	} else {
		System.out.println(guideValue+"는 오류입니다.");
	}
%>
	

<body>
	<%
		pageContext.include("../header/header.jsp");
	%>
	<div class="wrapper">
		<div class="container">
			<%--
				pageContext.include("departmentLeftList.jsp");
			--%>
			<div class="col-xs-12 col-sm-9 col-md-10">
				<div class="container-fulid">
					<div class = "container-large col-xs-12">
						<div class="container-small col-sm-5">
							<img alt="사진" src="/academy_ignis/image/<%=pictureName %>" class="img-rounded img-responsive">
						</div>
						<div class="container-small col-sm-7">
							<label><strong>
							<%=guideContent %>							
							</strong></label>
						<div class="container-tiny">
						<a href ="./reserv?type=<%=guideValue%>"><button type="button" class="btn btn-lg btn-info btn-reserv">예약하기</button></a>&nbsp;			
						<a href="javascript:history.go(-1)"><button type="button" class="btn btn-lg btn-info">뒤로 가기</button></a>
						</div>
						</div>
					</div>						
				</div>
			</div>
		</div>
	</div>
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