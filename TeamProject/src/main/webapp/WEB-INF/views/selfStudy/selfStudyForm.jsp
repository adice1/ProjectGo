<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>
<%
	String usrId = (String)session.getAttribute("id");
%>

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
    height: 700px;
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
	let flag = $("#flag")
	
	var img = $("#scream");
//  var canvas = $("#jsCanvas")[0];
	console.log(canvas.toDataURL())
	var tic = 0;
    var timer
    var currentTime;
    
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
    
//	파일 입출력
///////////////////////////////////////////////// 
    
	$("#qload").click(function(){
		 
//     	var ctx = canvas.getContext('2d');
		ctx.rect(20, 40, 50, 50);
		ctx.drawImage(img[0], 1, 1, 640, 480);
// 		ctx.globalCompositeOperation = "source-over";
		
// 		console.log(img[0])
		console.log(canvas.toDataURL())

    }).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
		
	$("#nload").click(function(){
		
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
		
	$("#save").click(function(){

		let systemfile = canvas.toDataURL()
		console.log(systemfile);
		
		systemfile = canvas.toDataURL().split(",")[1]
		
		if($("#usrId").val() != "null"){
			
			let originfile = prompt("저장할 파일 이름을 입력하세요");
			
			if(originfile != "" && originfile != null){
				$.ajax({
					url: "${home}selfstudy/InsertStudy",
					type: "POST",
					data: {
						id : $("#usrId").val(),
						systemfile : systemfile,
						originfile : originfile
					},
					success : function(){
						alert("저장완료.")
						console.log(systemfile)
					}
				})
			}	else	alert("파일 이름을 입력해주세요!")
		}	else	alert("로그인을 해주세요!")
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
/////////////////////////////////////////////////		
		

//	타이머
///////////////////////////////////////////////// 
    $("#start").click(function(){
		
		var sec = 0;
		var min = 0;
		var hour = 0;
		
		$("#flag").val("false")
		$("#Pause").html("일시정지")
		
		timer = setInterval(function(){
			
			tic = tic + 1
			
			min = Math.floor(tic / 60);
			hour = Math.floor(min / 60);
			sec = tic % 60;
			min = min % 60;
			
			let currentHour = hour;
			let currentMin = min;
			let currentsec = sec;
			
			if(currentHour < 10)	currentHour = "0" + hour
			if(currentMin < 10)		currentMin = "0" + min
			if(currentsec < 10)		currentsec = "0" + sec
	
			currentTime = currentHour + " : " + currentMin + " : " + currentsec;
			
			$("#StopWatch").html(currentTime)
			$("#saveTimer").val(currentTime)

		},	1000)
	}).mouseover(function(){
		$(this).css("color", "00c471")
    	$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
    }).mouseout(function(){
    	$(this).css("color", "black")
    	$(this).css("box-shadow", "");
    });
    	
  
	$("#Pause").click(function(){
			
			if($("#flag").val() == 'true'){
				console.log(flag.val())
				console.log(currentTime)
					tic = 0
					$("#flag").val("false")
					$("#Pause").html("일시정지")
				
			}else{
				console.log(flag.val())
				if(tic != 0){
					$("#flag").val("true")
					$("#Pause").html("초기화")
					clearInterval(timer);
				}
			}
		}).mouseover(function(){
			$(this).css("color", "00c471")
    		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
    	}).mouseout(function(){
    		$(this).css("color", "black")
    		$(this).css("box-shadow", "");
    	});
	
    
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
	}).mouseover(function(){
		$(this).css("color", "00c471")
    	$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
    }).mouseout(function(){
    	$(this).css("color", "black")
    	$(this).css("box-shadow", "");
    });
    
    $("#StopWatch").css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%")

});    
/////////////////////////////////////////////////

</script>


<body>
	<input type="hidden" id="usrId" value="<%=usrId %>" />
	<input type="hidden" id="flag" value="false">
	<input type="hidden" id="saveTimer" />

	<img id="scream" src="resources/Quiz02.jpg" hidden=""  alt="The Scream">
	
	<i class="fas fa-angle-double-left" id="OpenBtn"></i>
	
	<canvas id="jsCanvas" class="canvas">
	</canvas>
	
	
	<table id="tab">
			<th colspan="6" align="center"><b>메뉴</b></th>
			<tr>
				<td id="new"  align="center">새로 만들기</td>
				<td id="qload" colspan="2" align="center">기출 문제 불러오기</td>
				<td id="nload" align="center">필기 불러오기 </td>
				<td id="save" align="center">저장하기</td>
			</tr>
			<th colspan="6" align="center"><b>스톱워치</b></th>
			<tr>
				<td id="StopWatch" colspan="6" align="center"></td>
			</tr>
			<tr colspan="6" align="center">
					<td id="start" colspan="1" align="center">시작</td>
					<td id="Pause" colspan="2" align="center">일시정지</td>
					<td id="recode" colspan="2" align="center">저장</td>
					<td></td>
					<td></td>
			</tr>
			
			<th colspan="6" align="center"><b>필기도구</b></th>
			<tr>
				<td>21</td>
				<td>22</td>
				<td>23</td>
				<td>24</td>
			</tr>
			<tr>
				<td>26</td>
				<td>27</td>
				<td>28</td>
				<td>29</td>
			</tr>
	</table>
	
  
</body>

<script>
const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext("2d");
const colors = document.getElementsByClassName("jsColors");
const range = document.getElementById("jsRange");
const mode = document.getElementById("jsMode");
const saveBtn = document.getElementById("jsSave");

const INITIAL_COLOR = "#2c2c2c";
const CANVAS_SIZE = 700;

canvas.width = CANVAS_SIZE;
canvas.height = CANVAS_SIZE;

ctx.fillStyle = "white";
ctx.fillRect(0, 0, canvas.width, canvas.height);

ctx.strokeStyle = INITIAL_COLOR;
ctx.fillStyle = INITIAL_COLOR;
ctx.lineWidth = 2.5;

let painting = false;
let filling = false;

function stopPainting(){
    painting = false;
}

function startPainting(){
    painting = true;
}

function onMouseMove(event){
    const x = event.offsetX;
    const y = event.offsetY;
    if(!painting){
        ctx.beginPath();
        ctx.moveTo(x, y);
    } else {
        ctx.lineTo(x, y);
        ctx.stroke();
    }
}

function handleColorClick(event){
    const color = event.target.style.backgroundColor;
    ctx.strokeStyle = color;
    ctx.fillStyle = color;
}

function handleRangeChange(event){
    const size = (event.target.value);
    ctx.lineWidth = size;
}

function handleModeClick(event){
    if(filling === true){
        filling = false;
        mode.innerText = "Fill";
    }else{
        filling = true;
        mode.innerText = "Paint";
        ctx.fillStyle = ctx.strokeStyle;
    }
}

function handleCanvasClick(){
   if(filling){
       ctx.fillRect(0, 0, canvas.width, canvas.height);
    }   
}

function handleCM(event){
    event.preventDefault();
}

function handleSaveClick(){
    const image = canvas.toDataURL();
    const link = document.createElement("a");
    link.href = image;
    link.download = "PaintJS";
    link.click();
}

if(canvas){
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mousedown", startPainting);
    canvas.addEventListener("mouseup", stopPainting);
    canvas.addEventListener("mouseleave", stopPainting);
    canvas.addEventListener("click", handleCanvasClick);
    canvas.addEventListener("contextmenu", handleCM);
}

Array.from(colors).forEach(color =>
     color.addEventListener("click", handleColorClick)
     );

if(range){
    range.addEventListener("input", handleRangeChange)
}

if(mode){
    mode.addEventListener("click", handleModeClick)
}

if(saveBtn){
    saveBtn.addEventListener("click", handleSaveClick);
}
</script>
