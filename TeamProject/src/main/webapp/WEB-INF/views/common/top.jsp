<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="topHome" value="/"/>

<%
	HttpSession topSession = request.getSession(false);
	String sessionId = (String)topSession.getAttribute("id");
%>

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
</style>
<div class="box">
<h1 align="center">에이콘 아카데미</h1>
<ul>
	<li><a href="${topHome}index?formpath=home">홈</a></li>
	<li><a href="${topHome}index?formpath=intro">소개</a></li>	
	<li><a href="${topHome}index?formpath=board">게시판</a></li>
	<li><a href="${topHome}index?formpath=preQuestions">기출문제</a></li>
	<li><a href="${topHome}index?formpath=studyroom">자율 학습방</a></li>
	<%	if(sessionId==null){ %>
	<li style="margin-left: 1050px"><a href="${topHome}index?formpath=login">로그인</a></li>
	<li><a href="${topHome}index?formpath=member">회원가입</a></li>
	<%}else{ 	%>
	<li style="margin-left: 730px"> ${id } 님 환영합니다.</li>
	<li><a href="${topHome}login/logout">로그아웃</a></li>
	<%} %>
</ul>
</div>
<hr/>
