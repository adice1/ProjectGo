<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="topHome" value="/"/>

<%
	HttpSession topSession = request.getSession(false);
	String sessionId = (String)topSession.getAttribute("id");
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script> 
$(document).ready(function(){
  $("#board").click(function(){
	 $(".panel").slideToggle("fast");
	 $(".questions").slideUp("fast");
    
  });
  $("#Questions").click(function(){
	  
	    $(".questions").slideToggle("fast");
	    $(".panel").slideUp("fast");
	  });
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
ul li{display: inline-block; margin: 15px 30px;}
*{margin:0; padding:0;}
body .box{
	background-color: #F3EEE8;
}
.panel, #board, .questions, #uestions {
  
  background-color: #F3EEE8;
  /* border: solid 1px #c3c3c3; */
}
.panel, .questions {
  padding: 3px;
  display: none;
}
</style>
<div class="box">
<h1 align="center">에이콘 아카데미</h1><br/>
<ul>
	<li><a href="${topHome}index?formpath=home">홈</a></li>
	<li><a href="${topHome}index?formpath=intro">소개</a></li>	
	<%-- <li><a href="${topHome}index?formpath=board">게시판</a></li> --%>
	<li id="board">게시판</li>
	<%-- <li><a href="${topHome}index?formpath=preQuestions">기출문제</a></li> --%>
	<li id="Questions">기출문제</li>
	<li><a href="${topHome}index?formpath=videoLecture">동영상 강의</a></li>
	<li><a href="${topHome}index?formpath=selfStudy">자율 학습방</a></li>
	<%	if(sessionId==null){ %>
	<li style="margin-left: 530px"><a href="${topHome}index?formpath=login">로그인</a></li>
	<li><a href="${topHome}index?formpath=member">회원가입</a></li>
	<%}else{ 	%>
	<li style="margin-left: 330px"> ${id } 님 환영합니다.</li>
	<li><a href="${topHome}login/logout">로그아웃</a></li>
	<%} %>
	
	<div style="margin-left: 185px"><a class="panel" href="${topHome}index?formpath=QuestionBoard">Q&A 게시판</a></div>
	<div style="margin-left: 185px"><a class="panel" href="${topHome}index?formpath=communityboard">자유 게시판</a></div>
	
	<div style="margin-left: 322px"><a class="questions" href="${topHome}index?formpath=yearExam">연도별</a></div>
	<div style="margin-left: 322px"><a class="questions" href="${topHome}index?formpath=smartExam">맞춤형</a></div>
	<div style="margin-left: 322px"><a class="questions" href="${topHome}index?formpath=randExam">랜덤 기출</a></div>
	
</ul>
<br/>
</div>

<hr/>
