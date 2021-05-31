<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="topHome" value="/"/>
<c:set var="topHome2" value="/"/>

<%
	HttpSession topSession = request.getSession(false);
	String sessionId = (String)topSession.getAttribute("id");
	
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script> 
$(document).ready(function(){
  $("#board").mouseover(function(){
	 $(".panel").slideToggle("fast");
	 $(".questions").slideUp("fast");
	 $(".myLst").slideUp("fast");
  });
  $("#Questions").mouseover(function(){
	    $(".questions").slideToggle("fast");
	    $(".panel").slideUp("fast");
	    $(".myLst").slideUp("fast");
	  });
  $("#myRoom").click(function() {
	  $(".myLst").slideToggle("fast");
	  $(".questions").slideUp("fast");
	  $(".panel").slideUp("fast");
	  
  })
});
</script>

<style type="text/css">
<!--
a:link{color:black;font-family:sans-serif;text-decoration:none;}
a:visited{color:black;font-family:sans-serif;text-decoration:none;}
a:hover{color:#cc3300; font-weight:bold; }
a:active{color:#ff00cc; text-decoration:underline; }
-->
ul{list-style: none;}
ul li{
	display: inline-block;
	 margin: 15px 30px;
	}
*{margin:0; padding:0;}
body .box{
	background-color: #F3EEE8;
}
.panel, .questions, .myLst {
  background-color: #FFFFFF;
  padding: 3px;
  display: none;
  
}
</style>
<head><link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"></head>

<div class="box"><br/>
<h1 ><a href="${topHome}index?formpath=home"><img src="${topHome}/resources/icornImg.png" width="139px" height="40px"></a></h1><br/>
<ul>
	<%-- <li><a href="${topHome}index?formpath=home">홈</a></li> --%>
	<li><a href="${topHome}index?formpath=intro">소개</a></li>	
	<li id="board">게시판</li>
	<li id="Questions">기출문제</li>
	<li><a href="${topHome}index?formpath=videoLecture">동영상 강의</a></li>
	<li><a href="${topHome}index?formpath=selfStudy">자율 학습방</a></li>
	<%	if(sessionId==null){ %>
	<li style="margin-left: 530px"><a href="${topHome}index?formpath=login">로그인</a></li>
	<li><a href="${topHome}index?formpath=member">회원가입</a></li>
	<%}else{ 	%>
	<li style="margin-left: 480px"> ${id } 님 환영합니다.</li>
	<li id="myRoom" style="margin-left: -5px;"><i class="material-icons">menu</i></li>
	<%} %>
</ul>
</div>
<hr/>