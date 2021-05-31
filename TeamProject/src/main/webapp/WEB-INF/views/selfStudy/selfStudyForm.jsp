<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>

<link
    rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
    integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
    crossorigin="anonymous">
    
 <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Tangerine"> 
   

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
    right: 7%;
    top: 600px;
    position: absolute;
    font-size: 4em;
}

input {
	margin-top : 20%;
	margin-left : 25%;
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
    var target = $("#sidebar");

    // 버튼을 클릭하면 사이드바 열림
    $(document).on("click", "#OpenBtn", function (e){
        target.show();
        target.addClass('emphasized');
    });

    // 사이드바 외부를 클릭하면 사이드바 닫힘
    $(document).mouseup(function (e){
        if(target.has(e.target).length==0) {
            target.hide();
            target.removeClass('emphasized');
        } 
    });
    
    $("#test1").click(function(){
    	alert("글씨체를 선택하셨습니다.")
    });
    
    $("#test2").click(function(){
    	alert("볼드를 선택하셨습니다");
    });
    $("#test2").click(function(){
    	alert("크기를 선택하셨습니다");
    });
    
});

</script>


<body>
	
	<i class="fas fa-angle-double-left" id="OpenBtn"></i>
	<canvas id="jsCanvas" class="canvas"></canvas>
	
	
	<table id="tab">
		<tr>
		</tr>
	</table>
  
</body>
