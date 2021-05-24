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
	<div style="margin-left: 185px"><a class="panel" href="${topHome}index?formpath=QuestionBoard">Q&A 게시판</a></div>
   	<div style="margin-left: 185px"><a class="panel" href="${topHome}index?formpath=communityboard">자유 게시판</a></div>
   	<div style="margin-left: 322px"><a class="questions" href="${topHome}index?formpath=yearExam">연도별</a></div>
   	<div style="margin-left: 322px"><a class="questions" href="${topHome}index?formpath=smartExam">맞춤형</a></div>
   	<div style="margin-left: 322px"><a class="questions" href="${topHome}index?formpath=randExam">랜덤 기출</a></div>
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