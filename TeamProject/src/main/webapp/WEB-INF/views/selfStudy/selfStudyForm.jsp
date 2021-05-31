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
    right: 27%;
    top: 600px;
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
   	width: 1200px;
    height: 900px;
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%);
    position: absolute;
    right: 0%;
    left: 25%;
    bottom: 17%;
}

#tab {
	display: none;
	position: absolute;
    width: 400px;
    height: 900px;
    right: 12%;
    top: 202px;
    border-radius: 15px;
    box-shadow: 0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%);
}
</style>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
$(document).ready(function(){
    var target = $("#tab");
    
		timerStart = setInterval(function() {
			var nowTime = new Date().getTime() //1ms당 한 번씩 현재시간 timestamp를 불러와 nowTime에 저장
			var sec = newTime.getSeconds() //초
			$("stopwatch").html(newTime.getSeconds() - sec)
			}, 1)
    
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

// 	$("#stopwatch").click(function(){
// 		let today = new Date()
// 		let lastHours = today.getHours();
// 		console.log(lastHours - today.getHours());
// 		$("#stopwatch").html(lastHours - today.getHours());
// 	})
	
});
</script>


<body>
	
	<i class="fas fa-angle-double-left" id="OpenBtn"></i>
	<canvas id="jsCanvas" class="canvas"></canvas>
	
	<table id="tab">
		
			<th><label>메뉴</label></th>
			<tr>
				<td colspan="2"><center><p>기출 문제 불러오기</p></td>
				<td colspan="2"><center><p>필기 불러오기 </p></td>
				<td colspan="2"><center><p>저장하기</p></td>
			</tr>
			
			<th><label>스톱워치</label></th>
			<tr>
				<td colspan="6"><center><p id="stopwatch">1</p></center></td>
			</tr>
			
			<tr>
				<td><input type="button" value="11" /></td>
				<td><input type="button" value="12" /></td>
				<td><input type="button" value="13" /></td>
				<td><input type="button" value="14" /></td>
				<td><input type="button" value="15" /></td>
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
		</center>
	</table>
	
  
</body>
