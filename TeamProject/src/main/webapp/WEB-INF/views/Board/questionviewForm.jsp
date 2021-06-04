<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.ip{
    margin-top: 30px;
    margin-bottom: 30px;
    margin-left: 90px;
    margin-right: 90px;
    border:1px solid; padding:10px;
}

.you{
    margin-top: 30px;
    margin-bottom: 30px;
    margin-left: 90px;
    margin-right: 90px;
    border:1px solid; padding:10px;
}
#po{
   margin-top: 20px;
}

</style>
<c:url var="home" value="/"/>
<center>

<div>
<form class="ip" action="${home }QuestionBoard/QuestionWrite">
<h2 align="center">질문글입니다.</h2>
<input type="hidden" name="pno" value="${board.no }">
<input type="hidden" name="no" value="${board.no }">
<input type="hidden" name="title" value="${board.title }">
<input type="hidden" name="contents" value="${board.contents }">
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
			<a href="${home }resources/upload/${attachMap.ATTACHEFILE }">${attachMap.FILEPATH }</a><br/> 
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
			<button style="width: 60px; ">글쓰기</button>
			<button style="width: 60px; " formaction="${home }QuestionBoard/replyProc">${btnName }</button>
			<button style="width: 60px; " formaction="${home }QuestionBoard/delete">삭제</button>
		</td>
	</tr>
</table>
</form>
</div>


<div>
<c:forEach var="Reply" items="${Replylist }">
<form class="you" action="${home }QuestionBoard/QuestionWrite">
<h2 align="center">답변글입니다.</h2>
<input type="hidden" name="pno" value="${Reply.no }">
<input type="hidden" name="no" value="${Reply.no }">
<input type="hidden" name="title" value="${Reply.title }">
<input type="hidden" name="contents" value="${Reply.contents }">
<table style="width: 650px; ">

	<tr>
		<td style="width: 300px; height:40px;" valign="middle">
		
		<h2>${Reply.title }</h2></td>
		<td style="width: 350px; height:40px;" align="right" valign="bottom">${Reply.writedate }</td>
	</tr>
	<tr>
		<td colspan=2><hr/></td>
	</tr>
	<tr>
		<td  style="width: 300px; height:40px;" valign="top">${Reply.id }</td>
		<td style="width: 350px; height:40px;" align="right" valign="top">첨부파일
		<c:forEach var="attachMap" items="${attachLst }">
			<a href="${home }resources/upload/${attachMap.ATTACHEFILE }">${attachMap.FILEPATH }</a><br/> 
		</c:forEach></td>
	</tr>
	<tr>
		<td colspan=2 style="width: 650px; height: 300px" valign="top">
		
		<pre>${Reply.contents }
		</pre>
		</td>
	</tr>
	<tr>
		<td colspan=2><hr/></td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<button style="width: 60px; ">글쓰기</button>
			<button style="width: 60px; " formaction="${home }QuestionBoard/replyProc">${btnName }</button>
			<button style="width: 60px; " formaction="${home }QuestionBoard/delete">삭제</button>
		</td>
		
	</tr>
</table>

</form>
</c:forEach>
</div>
</center>