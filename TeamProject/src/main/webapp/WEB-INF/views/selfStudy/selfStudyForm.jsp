<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>

<link
    rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
    integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
    crossorigin="anonymous">
    
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine"> 
 
<style>
    body {
    margin: 0px;
}
 
header {
    height: 50px;
    width: 100%;
    background-color: grey;
    color: white;
    display: flex;
    align-items: center;
    column-gap: 10px;
    font-size: x-large;
}
 
#sidebar {
    display: none;
    position: fixed;
    top: 25%;
    right: 0;
    bottom: 0px;
    background-color: #ccccccd4;
    color: white;
    width: 300px;
    height: 50%;
    text-align: center;
}
 
.fa-angle-double-left{
	size: 30px;
    right: 37%;
    top: 450px;
    position: absolute;
    font-size: 4em;
    z-index: 1;
}

input {
	margin-top : 5%;
	margin-left : 10%;
	margin-right : 10%;
	width : 60px;
	height : 60px;
}

.canvas{   
   	width: 700px;
    height: 600px;
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%);
    position: absolute;
    right: 0%;
    left: 25%;
    bottom: 20%
}

#tab {
	display: none;
    position: absolute;
    width: 400px;
    height: 600px;
    right: 17%;
    top: 175px;
    border-radius: 15px;
    box-shadow: 0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%);
}


</style>	

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
$(document).ready(function(){
	let target = $("#tab");
	var tic = 0;
    var timer
	
    // 버튼을 클릭하면 사이드바 열림
    $(document).on("click", "#OpenBtn", function (e){
        target.show();
        target.addClass('emphasized');
    });
	    
    // 사이드바 외부를 클릭하면 사이드바 닫힘
	$(document).mousedown(function (e){
		if(target.has(e.target).length==0) {
			target.hide();
	  		target.removeClass('emphasized');
	    } 
	});

	$("#start").click(function(){
		
		var currentTime;
		var sec = 0;
		var min = 0;
		var hour = 0;
		
		timer = setInterval(function(){
			
			tic = tic + 1
			
			min = Math.floor(tic / 60);
			hour = Math.floor(min / 60);
			sec = tic % 60;
			min = min % 60;
			
			var currentHour = hour;
			var currentMin = min;
			var currentsec = sec;
			
			if(currentHour < 10)	currentHour = "0" + hour
			if(currentMin < 10)		currentMin = "0" + min
			if(currentsec < 10)		currentsec = "0" + sec
	
			currentTime = currentHour + " : " + currentMin + " : " + currentsec;
			
			$("#StopWatch").html(currentTime)
			$("#saveTimer").val(currentTime)
			
			},	1000)
	})
	
	$("#stop").click(function(){
		if(tic != 0){
			console.log($("#saveTimer").val())
			console.log(timer);
			clearInterval(timer);
		}
	})
	
	$("#recode").click(function(){
		$.ajax({
			url: "${home}selfstudy/stopWatchInsert",
			type: "POST",
			data: {
				timer : $("#saveTimer").val()
			},
			success : function(){
				alert("성공하셨습니다.")
			}
		})
	})
	
});
</script>


<body>
	
	<i class="fas fa-angle-double-left" id="OpenBtn"></i>
	<canvas id="jsCanvas" class="canvas"></canvas>
	
	<table id="tab">
			<input type="hidden" id="saveTimer" />
			<th>메뉴</th>
			<tr>
				<td colspan="2" style="align="center">기출 문제 불러오기</td>
				<td colspan="2" style="align="center">필기 불러오기 </td>
				<td colspan="2" style="align="center">저장하기</td>
			</tr>
			
			<th>스톱워치</th>
			<tr>
				<td id="StopWatch" colspan="6" align="center"></td>
			</tr>
			
			<tr align="center">
					<td id="start" colspan="2" align="center">시작</td>
					<td id="stop" colspan="1" align="center">멈춤</td>
					<td id="recode" colspan="2" align="center">기록</td>
			</tr>
			
			<tr>
				<td><input type="button" value="16" /></td>
				<td><input type="button" value="17" /></td>
				<td><input type="button" value="18" /></td>
				<td><input type="button" value="19" /></td>
				<td><input type="button" value="20" /></td>
			</tr>
			
			<th><label>필기도구</label></th>
			<tr>
				<td><input type="button" value="21" /></td>
				<td><input type="button" value="22" /></td>
				<td><input type="button" value="23" /></td>
				<td><input type="button" value="24" /></td>
				<td><input type="button" value="25" /></td>
			</tr>
			
			<tr>
				<td><input type="button" value="26" /></td>
				<td><input type="button" value="27" /></td>
				<td><input type="button" value="28" /></td>
				<td><input type="button" value="29" /></td>
				<td><input type="button" value="30" /></td>
			</tr>
	</table>
	
  
</body>
