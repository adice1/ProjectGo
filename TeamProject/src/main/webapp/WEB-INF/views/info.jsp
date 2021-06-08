<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="home" value="/"/>
<style>
div {  
    
}
#eo{
margin-bottom: 10px;
}
.zo{
    font-size: 15px;
    font-family: 'NanumGothic', 'Nanum Gothic', 'Malgun Gothic', 'dotum', 'helvetica', 'sans-serif';
    color: #000;
    background: #FFFFFF;    
}
.to{
    height: 100px;
    background: #FFFFFF;
    margin-bottom: 10px;    
}
.op{
    margin-top: 30px;
    
}
.do{
    height: 240px;
    width: 700px;
    background: #EBF4FA;
}
#ro{
    margin-top: 20px;
}
.go{

    background: #FFFFFF;
    height: 240px;
}
#co{
    margin-top: 30px;
    padding: 40px;
}
.mo{
    padding: 40px;
}
.so{
   height: 250px;
   width: 700px;
   background: #EBF4FA;
}
.qo{
   height: 250px;
}
.top{
    margin-top: 50px;
    padding: 30px;
}
.top1{
    margin-top: 30px;
    padding: 30px;
}
.ao{
    background: #EBF4FA;
    height: 450px;
    width: 600px;
}
.ao1{
    padding: 20px;
}
.ao2{
     padding: 0 0 20px 10px;
     margin-bottom: -20px;
}
.ao3{

     float: right;
     height: 450px;
     width: 150px;
     background: #EBEBEB;
}

body, html{
	height : 100%;
}
	#map {
		width : 400px;
		height : 270px;
		margin-top: 20px;
		margin-left: 20px;
		float: left;
		
	}
.ko{
     height : 200px;
}	
</style>
<html>
<head>
</head>
<body class="zo">

<div class="to"><h1 class="op" align="center"> 소개하기</h1></div>
<center><div class="do"><h2 id="co">자격증 기출 문제풀이<br/>
적절한 기출문제와 응용풀이 문제집</h2></div></center>

<div class="vo"><h2 class="mo" align="center">1. 맞춤형 기출문제</h2><br/> <h4 class="mo1" align="center">- 사용자는 정답률이 높은 문제 부터 시작하여 점수로 
사용자 유형별 레벨을 나눠 레벨에 따라 문제가 출제 됩니다.<br/>- 또한 사용자는 해당 레벨 문제를 100점 맞을떄까지 
반복 출제되며 100점일때 다음 레벨로 올라갈수있습니다. 그리고 각 유형레벨문제에서 자주 틀리는 경우 해당 유형 레벨이 강등됩니다.</h4><br/> 
</div>

<center><div class="so"><h2 class="top" align="center">2. 필기노트 기능 소개</h2><br/>
             <h4 class="top2" align="center">- 드래그로 그림, 글자를 자유롭게 필기가 가능합니다.</h4></div>
</center>

<div class="qo"><h2 class="top1" align="center">3. 채팅</h2><br/>
<h4 class="qa" align="center">- 실시간 채팅을 활용한 질문, 필지장 공유 등으로 학습의 서로의 부족한 지식을 보완할 수 있습니다.</h4></div>

<center><div class="ao"><div class="ao3"><h3>위치, 지도</h3></div><h2 class="ao1" align="left">찾아오는 길</h2><br/>
<h4 class="ao2" align="left">위치는 밑에 지도를 참고해주세요.</h4>
<div id="map" align="center">지도</div></center>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69ac8c008f5fb702ccd0bc81da8033a2"></script>
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.160865, 127.754386), //지도의 중심좌표.
				level: 13 //지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		</script>
		</div>
<div class="ko"></div>

</body>
</html>