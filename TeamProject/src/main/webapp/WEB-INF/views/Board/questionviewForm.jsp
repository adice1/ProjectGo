<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/" />
<center>
<form action="${home }QuestionBoard/QuestionWrite" >
<input type="hidden" name="pn" value="${board.no }">
<table style="width: 650px; ">
	<tr>
		<td style="width: 300px; height:40px;" valign="middle"><h2>${board.title }</h2></td>
		<td style="width: 350px; height:40px;" align="right" valign="bottom">${board.writedate }</td>
	</tr>
	<tr>
		<td colspan=2><hr/></td>
	</tr>
	<tr>
		<td  style="width: 300px; height:40px;" valign="top">${board.id }</td>
		<td style="width: 350px; height:40px;" align="right" valign="top">첨부파일
		<c:forEach var="attachMap" items="${attachLst }">
			<a href="${home }resources/upload/${attachMap.SYSTEMFILE }">${attachMap.ORIGINFILE }</a><br/> 
		</c:forEach></td>
	</tr>
	<tr>
		<td colspan=2 style="width: 650px; height: 300px" valign="top">
		<pre>${board.contents }
		</pre>
		</td>
	</tr>
	<tr>
		<td colspan=2><hr/></td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<input type=button style="width: 60px; " value='글쓰기'/> 
			<button style="width: 60px; " formaction="${home }QuestionBoard/reply"> 답글</button>
			<input type=button style="width: 60px; " value='수정'/>
			<button formaction="${home }QuestionBoard/delete" style="width: 60px; ">삭제</button>
			<input type=button style="width: 60px; " value='목록'/>
		</td>
	</tr>
</table>
</form>
</center>