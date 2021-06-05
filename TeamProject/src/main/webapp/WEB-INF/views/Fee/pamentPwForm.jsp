<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:url var="home" value="/"/>
<style type="text/css">
	.headBox {
		margin-top : 0px;
		background: #CA394F;
		text-align:center;
		height: 75px;
	} 
	.boxAll {
		margin : 0px;
		background: #F3EEE8;
		text-align:center; 
	}
	.boxTwo{
		margin : 25px;
	}
	.boxTwo button{ 
		width: 250px;
		height: 60px;
		 font-size:20px;
		 font-weight:bold;
	}
	.boxTwo table{
		background: #ffffff;
		width: 100%;
		height: 200px;
	}
	.boxTwo td{
		text-align: left;
		border : 1px solid black;
		margin : 10px;
	}
	.boxTwo th{
		text-align: center;
		border : 1px solid black;
		margin : 10px;
	}
	input {
  		width:300px;
  		height: 40px;
  		font-size:20px;
  		margin : 10px;
  		text-align: center;
	}	
</style>
<script type="text/javascript">
function openPopCloss(path){
   	window.close();
}
function openPopPwCloss(path){
	var pw = document.getElementById("pw").value
	
	if(pw != "") {
		window.close();
	}
	else {
		alert('비밀번호를 입력하세요');
	}
}
</script>

<body>
		<div class="boxAll">
		<div class="headBox">
		<div style="text-align:center">
		<h1 style="color: ffffff;">요금결제</h1>
		</div>
		</div>
		<div class="boxTwo">
		<form action="" method="post">
		<table width="350px">
			<tr bgcolor="#FAF8F6">
				<th colspan="2"><h2>패스워드</h2></th>
			</tr>
			<tr bgcolor="#F3EEE8">
				<th colspan="2"><input id="pw" type="password" placeholder='비밀번호 6자리 입력하세요'></th>
			</tr>
			<tr bgcolor="#FAF8F6">
				<th colspan="2"><button onclick="openPopCloss('${home}fee')">취소</button><button onclick="openPopPwCloss('${home}fee')">다음</button></th>
			</tr>
		</table>
		</form>
		<br/>
		</div>
		</div>
</body>




