<!-- viewForm.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>
<script>
	$(document).ready(function() {
		$("#btn").click(function() {
			$.ajax({
				url: "${home}/commboard/test",
				type: "post",
				data: {
					no : $("#commNo").val(),
					title : $("#commTitle").val(),
					contents : $("#commContents").val(),
					writedate : $("#commwritedate").val()
				}
		});
	})
})
</script>

<center>
<input type="hidden" id="boardObject" value="${board }">
<input type="hidden" id="userName" value="song">

<input type="hidden" name="pno" value="${board.no }">
<input type="hidden" id="commNo" name="no" value="${board.no }">
<input type="hidden" id="commTitle" name="title" value="${board.title }">
<input type="hidden" id="commContents"name="contents" value="${board.contents }">
<input type="hidden" id="commwritedate"name="contents" value="${board.writedate }">

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
		<td style="width: 350px; height:40px;" align="right" valign="top">
		<c:forEach var="attachMap" items="${attachLst }">
			<a href="${home }resources/upload/${attachMap.SYSTEMFILE }">${attachMap.ORIGINFILE }</a><br/> 
		</c:forEach>	
		</td>
	</tr>
	<tr>
		<td colspan=2 style="width: 650px; height: 300px" valign="top">
		<pre>${board.contents }</pre>
		</td>
	</tr>
	<tr>
		<td colspan=2><hr/><br /></td>
	</tr>
	<tr>
			<td>
				<textarea name="comment_contents" />${comment.comment_contents }</textarea>
				<input id="comment" type="text">
				<button id="btn">쓰기</button>
				<button>취소</button>
			</td>
	</tr>	
	<tr>
		<td colspan=2><hr /></td>
	</tr>
	<tr>
		<td colspan=2 align="right" >
			<button formaction="${home }commboard/write" style="width: 60px; ">글쓰기</button>
			<button formaction="${home }commboard/reply" style="width: 60px; ">답글</button>
			<button formaction="${home }commboard/modify" style="width: 60px; ">수정</button>
			<button formaction="${home }commboard/delete" style="width: 60px; ">삭제</button>
			<button formaction="${home }commboard/commboardProc" style="width: 60px; ">목록</button>
		</td>
	</tr>
</table>
</center>