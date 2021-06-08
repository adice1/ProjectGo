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
	
.styles{
	font-size: 40px;
    margin-top: 10px;
    margin-left: 10px;
    margin-bottom: 10px;
    margin-right: 10px;
    height: 50px;
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

#rangetab{
	display: none;
    position: absolute;
    width: 200px;
    height: 200px;
    right: 17%;
    left: 83.8%;
    top: 175px;
    border-radius: 15px;
    box-shadow: 0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%);
}

#font_view_tab{
	display: none;
    position: absolute;
    width: 200px;
    height: 200px;
    right: 17%;
    left: 83.8%;
    top: 175px;
    border-radius: 15px;
    box-shadow: 0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%);
}

#colortab{
	display: none;
    position: absolute;
    width: 200px;
    height: 600px;
    right: 17%;
    left: 83.8%;
    top: 175px;
    border-radius: 15px;
    box-shadow: 0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%);
}

.Colors{
	width: 170px;
    height: 50px;
    margin: 15px;
    border-radius: 25px;
    cursor: pointer;
    box-shadow: 0 4px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%);
}

.jsRange{
	width: 100px;
    height: 100px;
    margin-left: 50px;
    margin-top: 50px;
    margin-right: 50px;
    margin-bottom: 50px;
}

.font_view{
    font-size: 86px;
    margin-left: 50px;
    margin-right: 50px;
}
.font_range{
	width: 100px;
    height: 80px;
    margin-right: 50px;
    margin-left: 50px;
}
</style>	

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>

$(document).ready(function(){
	
	var canvas = $("#jsCanvas")[0]
	var canvas_mode = $("#canvas_mode")
	
	var canvas_status = "draw"
	
	var ctx = canvas.getContext('2d')
	var colors = $("#jsColors")
	var mode = $("#fill")
	
	const W_CANVAS_SIZE = 700
	const H_CANVAS_SIZE = 600
	const INITIAL_COLOR = "#2c2c2c"
	
	
	ctx.fillStyle = "white"
	ctx.fillRect(0, 0, W_CANVAS_SIZE, H_CANVAS_SIZE)
	ctx.strokeStyle = "#2c2c2c"
	ctx.fillStyle = "#2c2c2c"
	ctx.lineWidth = 2.5
	
	let target = $("#tab")
	let colortab = $("#colortab")
	let rangetab = $("#rangetab")
	let font_tab = $("#font_view_tab");
	
	var font_style_status = "normal";
	var font_thick_status = "normal";
	var font_range = $(".font_range").val();
	
	
	let flag = $("#flag")
	
	var scream = $("#scream");
	var noteimg = $("#noteimg")
	
	var tic = 0;
    var timer
    var currentTime;
    
    var fontX
    var fontY
   	
//     $("#msg").keyup(function(e){
//     	$("#msgout").text($("#msg").val())
//     })
    
	$("#OpenBtn").click(function(){
	    target.toggle()
	    rangetab.hide()
	    colortab.hide()
	    font_tab.hide()
	});  
	
	$("#color").click(function(){
		colortab.toggle();
		rangetab.hide()
		font_tab.hide()
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
	
	$("#range").click(function(){
		rangetab.toggle()
		colortab.hide()
		font_tab.hide()
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
	
	$("#font_thick").click(function(){
		if(font_thick_status == "normal"){
			$("#font_thick").css("font-weight", "bold")
			$(".font_view").css("font-weight", "bold")
			font_thick_status = "bold";
		}else{
			$("#font_thick").css("font-weight", "normal") 
			$(".font_view").css("font-weight", "normal")
			font_thick_status = "normal"
		}
		rangetab.hide()
		colortab.hide()
		font_tab.show();
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
		
	$("#font_style").click(function(){
		if(font_style_status == "normal"){
			$("#font_style").css("font-style", "italic")
			$(".font_view").css("font-style", "italic")
			font_style_status = "italic"
		}else{
			$("#font_style").css("font-style", "normal")
			$(".font_view").css("font-style", "normal")
			font_style_status = "normal"
		}
		rangetab.hide()
		colortab.hide()
		font_tab.show();
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
    
/// 파일 입출력  ////////////////////////////////////
///////////////////////////////////////////////// 
    $("#newnote").click(function(){
		ctx.fillStyle = "white";
    	ctx.fillRect(0, 0, W_CANVAS_SIZE, H_CANVAS_SIZE);
		ctx.globalCompositeOperation = "source-over";
    }).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
		
	$("#qload").click(function(){
		ctx.rect(0, 40, 50, 50);
		ctx.drawImage(scream[0], 10, 10, 640, 480);
    }).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
		
	$("#nload").click(function(){
		$.ajax({
			url: "${home}selfstudy/SelectStudy",
			type: "POST",
			data: {
				id : $("#usrId").val()
			},
			success : function(res){
				
				let ndata = res[0].systemfile
				ndate = res[0].systemfile.text()
				var blob = new Blob([ndata], {type:'image/png'});

				nloadURL = URL.createObjectURL(blob)
				console.log(nloadURL)
				
				let noteimg = $("#noteimg").attr("src", nloadURL)
				
				var ctx = canvas.getContext('2d');
				
// 				ctx.rect(20, 40, 50, 50);
 				ctx.drawImage(noteimg[0], 5, 5, 640, 480);
				
			}
		})
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
		
	$("#save").click(function(){

		let systemfile = canvas.toDataURL("image/png")
		
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
						alert("저장완료!")
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
		

//// 타이머  ///////////////////////////////////////
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

//////////////////////////////////

//////////필기도구
//////////////////////////////////

	var painting = false
	var filling = false
		
	$("#canvas_mode").click(function(){
		if(canvas_status == "draw"){
			canvas_status = "write"
			$("#canvas_mode").html("<b>글쓰기 상태</b>")
		}else if(canvas_status == "write"){
			canvas_status = "draw"
			console.log(canvas_status+" 을 선택하셨습니다.")
			$("#canvas_mode").html("<b>그리기 상태</b>")
		}
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});	
		
	$("#jsCanvas").click(function(event){
		if(canvas_status == "draw"){
			if(filling){
				ctx.fillRect(0, 0, W_CANVAS_SIZE, H_CANVAS_SIZE)
			}
			$("#jsCanvas").mousedown(function(){
				painting = true
			}).mouseup(function(){
				painting = false
			}).mouseleave(function(){
				painting = false
			}).on("mousemove", function(event){
				let x = event.offsetX;
			    let y = event.offsetY;
			    if(!painting){
			        ctx.beginPath();
			        ctx.moveTo(x, y);
			    } else {
			        ctx.lineTo(x, y);
			        ctx.stroke();
			    }
			}).on("contextmenu", function(event){
			})
		}else{
			$("#msg").focus()
			$("#msg").val("")
// 			$("#msg").keyup(function(e){
// 				$("#msgout").html(e.key)
// 			})
			
			fontX = event.offsetX;
		    fontY = event.offsetY;
		    
			ctx.font = font_style_status + " "+ font_thick_status + " " + $(".font_range").val() + "px" + " " + "serif";
// 			console.log(ctx.font);
// 			console.log(font_range)
// 		    console.log(x)
// 		    console.log(y)
// 			console.log(canvas_status)
// 			var font_style_status = "normal";
// 			var font_thick_status = "normal";
// 			let font_range = $(".font_range").val();
			
		}
	})
	
	$("#msg").keyup(function(event){

		$("#msgout").text($("#msg").val())
		
		console.log($("#msgout").text())
		ctx.fillText($("#msgout").text(), fontX, fontY)
		console.log($("#msgout").length)
// 		if($("#msg").length)
		
// 		ctx.font = font_style_status + " "+ font_thick_status + " " + $(".font_range").val() + "px" + " " + "serif";
// 		ctx.fillText($("#msgout").text(), 300, 300)
// 		ctx.fillText($("#msgout").text(), x, y)
	})
	
	$(".Colors").each(function(e){
		$(this).click(function(event){
			event.preventDefault();
			const color = event.target.style.backgroundColor;
	 	    ctx.strokeStyle = color;
	 	    ctx.fillStyle = color;
		})
	})
	
	$("#jsRange").on("click", function(e){
		const size = (e.target.value);
		ctx.lineWidth = size;
		$("#rangeprint").html(size)
	});
	
	$("#fill").on("click", function(e){
		 if(filling === true){
		        filling = false;
		        mode.html("Fill");
		    }else{
		        filling = true;
		        mode.html("Paint");
		        ctx.fillStyle = ctx.strokeStyle;
		    }
	}).mouseover(function(){
		$(this).css("color", "00c471")
		$(this).css("box-shadow", "0 0px 6px rgb(50 50 93 / 11%), 0 1px 3px rgb(0 0 0 / 8%");
	}).mouseout(function(){
		$(this).css("color", "black")
		$(this).css("box-shadow", "");
	});
	
		
	$(".font_range").mousemove(function(){
		$(".font_view").css("font-size", ($(".font_range").val()));
	})
});    

</script>
<div class="styles" align="center" style="font-style: normal"></div>

<body>
	<input type="text" id="msg">
	<div id="msgout"></div>

	<input type="hidden" id="usrId" value="<%=usrId %>" />
	<input type="hidden" id="flag" value="false">
	<input type="hidden" id="saveTimer" />
	<img id="scream" src="resources/Quiz02.jpg" hidden="true" alt="The Scream">
	<img id="noteimg">
	
	<i class="fas fa-angle-double-left" id="OpenBtn"></i>

	<canvas id="jsCanvas" class="canvas" width="700" height="600" ></canvas>

	<table id="tab">
			<th colspan="6" align="center"><b>메뉴</b></th>
			<tr>
				<td id="newnote"  align="center">새로 만들기</td>
				<td id="qload" colspan="2" align="center">기출 문제 불러오기</td>
				<td id="nload" align="center">필기 불러오기 </td>
				<td id="save" align="center">저장하기</td>
			</tr>
			<th colspan="6" align="center"><b>스톱워치</b></th>
			<tr>
				<td id="StopWatch" colspan="6" align="center"></td>
			</tr>
			<tr colspan="6" align="center">
					<td id="start" colspan="2" align="center">시작</td>
					<td id="Pause" colspan="2" align="center">일시정지</td>
					<td id="recode" colspan="2" align="center">저장</td>
					<td></td>
					<td></td>
			</tr>
			
			<tr>
				<td id="canvas_mode" colspan="6" align="center"><b>그리기</b></td>
			</tr>
			
			<th colspan="6" align="center"><b>그리기 도구</b></th>
			<tr>
				<td id="color" colspan="2" align="center">Color</td>
				<td id="range" colspan="2" align="center">Range</td>
				<td id="fill" colspan="2" align="center">Fill</td>
			</tr>
				<th colspan="6" align="center"><b>글쓰기 도구</b></th>
			<tr>
				<td id="font_style" colspan="2" align="center" style="font-size: 15px;">스타일</td>
				<td id="font_thick" colspan="2" align="center" style="font-size: 15px;">굵기</td>
				<td align="center" colspan="2" >서체</td>
			</tr>
	</table>
	
	<div id="colortab">
			<div class="controls__colors" id="jsColors">
				<div class="Colors" style="background-color: #2c2c2c"></div>
				<div class="Colors" style="background-color: white" ></div>
				<div class="Colors" style="background-color: #ff3b30"></div>
				<div class="Colors" style="background-color: #ff9500"></div>
				<div class="Colors" style="background-color: #ffcc00"></div>
				<div class="Colors" style="background-color: #4cd963"></div>
            	<div class="Colors" style="background-color: #5ac8fa"></div>
            	<div class="Colors" style="background-color: #0579ff"></div>
            	<div class="Colors" style="background-color: #5856d6"></div>
			</div>
	</div>
	
	<div id="rangetab">
			
			<div class="controls__range" id="jsRange">
				<div id="rangeprint" align="center"></div>
				<input class="jsRange"  type="range" min="0.1" max="10.0" value="2.5" step="0.1">
			</div>
	</div>
	
	<div id="font_view_tab">
		<div class="font_view" align="center">가</div>
		<input class="font_range"  type="range" min="1.0" max="100.0" value="80.0" step="1.0">
	</div>
	
</body>





