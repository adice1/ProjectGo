<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ include file="common/header.jspf" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="home" value="/"/>

<html>
<body>
<div align="center">
<table style="width:100%;">
<tr>
	<td style="height:100px;"><%@ include file="common/top.jsp" %><br/>
   	<div style="margin-left: 1290px"><a class="myLst" href="${topHome}myInfo/MyInfoFormProc">정보수정</a></div>
	<div style="margin-left: 160px"><a class="panel" href="${topHome}QuestionBoard/boardProc">Q&A 게시판</a></div>
   	<div style="margin-left: 160px"><a class="panel" href="${topHome}commboard/commboardProc">커뮤니티 게시판</a></div>
   	<div style="margin-left: 290px"><a class="questions" href="${topHome}index?formpath=yearExam">연도별</a></div>
   	<div style="margin-left: 290px"><a class="questions" href="${topHome}index?formpath=smartExam">맞춤형</a></div>
   	<div style="margin-left: 290px"><a class="questions" href="${topHome}index?formpath=randExam">랜덤 기출</a></div>
   	
	<div class="myLst" style="margin-left: 1290px"><a href="${topHome}index?formpath=videoLst">동영상 리스트</a></div>
	<div class="myLst" style="margin-left: 1290px"><a href="${topHome}login/logout">로그아웃</a></div>
	</td>
</tr>
<tr>
	<td style="height:400px;"><c:import url="${home }${formpath }"/> </td>
</tr>
<tr>
	<td style="height:50px;"><%@ include file="common/footer.jspf" %></td>
</tr>
</table>
</div>
</body>
</html>