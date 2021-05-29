<!-- viewForm.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>
<script>
	$(document).ready(function() {
		// 해당 게시글 댓글 출력
// 		console.log($('#commentlist_id').val())
		$.ajax({
			url: "${home}commboard/commentSelect",
			type: "post",
			data: {
				Comment_bno : $("#commNo").val()
			},
			success : function(data){
// 				console.log(data);
					for(var i=0; i<data.length; i++){
					$(".commentlist").append(
							"<br />"+
							"<input id='commentlist_id' type='text' value='" + data[i].comment_id + "'disabled='disabled' />" +
							"<input id='commentlist_contents' type='text' value='" + data[i].comment_contents + "' />" +
							"<input id='commentlist_writedate' type='text' value='"+ data[i].comment_writedate +"' disabled='disabled' />"+	
							"<input id='commentlist_no' type='hidden' value='"+ data[i].comment_no +"' disabled='disabled' />"+	
							"<input type='button' id='commentlist_modify' value='수정' />"+
							"<input type='button' id='commentlist_delete' value='삭제' /><br />");
					}
			}
		})
		// 댓글 삽입				
		$("#btn").click(function() {
			if($("#comment_id").val() != "")
			{
				if($("#comment_contents").val() !== "")
				{
					$.ajax({
						url: "${home}commboard/commentwrite",
						type: "post",
						data: {
							Comment_bno : $("#commNo").val(),
							comment_contents : $("#comment_contents").val(),
							comment_id : $("#comment_id").val()
						},
						success : function(data){
// 							alert("댓글이 등록되었습니다.");
							$("#comment_contents").val("")
// 							console.log(data);
								$(".commentlist").append(
										"<br />"+
										"<input id='commentlist_id' type='text' value='" + data.comment_id + "'disabled='disabled' />" +
										"<input id='commentlist_contents' type='text' value='" + data.comment_contents + "' />" +
										"<input id='commentlist_writedate' type='text' value='"+ data.comment_writedate +"' disabled='disabled' />"+	
										"<input id='commentlist_no' type='hidden' value='"+ data.comment_no +"' disabled='disabled' />"+	
										"<input type='button' id='commentlist_modify' value='수정' />"+
										"<input type='button' id='commentlist_delete' value='삭제' /><br />");
						}
					})
 				}
 				else alert("내용을 입력해주세요!");
 			}
 			else alert("로그인을 해주세요!")
 		})
 	// 댓글 수정
	$(document).on('click', "#commentlist_modify", function(){
// 		alert( $(this).prev().val() ) // no
// 		alert( $(this).prev().prev().prev().val() ) // 내용
// 		alert( $(this).prev().prev().prev().prev().val() ) // id
		let id = $(this).prev().prev().prev().prev().val()
		let contents = $(this).prev().prev().prev().val()
		console.log(id);
		console.log(contents);
		
		if(id == $("#comment_id").val())
		{
			if(contents !== "")
			{
				$.ajax({
					url: "${home}commboard/commentmodify",
					type: "post",
					data: {
						Comment_no : $(this).prev().val(),
						comment_contents : $(this).prev().prev().prev().val()
					},
					success : function(data){
						alert("수정 완료");
					}
				})
			}
			else alert("내용을 입력해주세요!");
		}
		else alert("id가 틀립니다.");
	})		
	
	// 댓글 삭제
	$(document).on('click', "#commentlist_delete", function(){

		let id = $(this).prev().prev().prev().prev().prev().val();
		let pw = $(this).prev().prev().val();
		let re = $(this).parent()
		console.log(re);
// 		console.log(id);
// 		console.log(pw);
// 		console.log($(this).parent().remove);
		console.log($("#comment_id").val());
		
		if(id == $("#comment_id").val())
		{
				$.ajax({
					url: "${home}commboard/commentdelete",
					type: "post",
					data: {
						Comment_no : $(this).prev().prev().val()
					},
					success : function(data){
						$(this).parent().remove();
						alert("수정 완료");
					}
				})
		}
		else alert("id가 틀립니다.");
	})	
//
})
</script>
<center>

<div class="pb">

</div>

<form action="${home }commboard/detailRead">

<input type="hidden" name="pno" value="${board.no }">

<input type="hidden" id="commNo" name="no" value="${board.no }">
<input type="hidden" id="commTitle" name="title" value="${board.title }">
<input type="hidden" id="commContents" value="${board.contents }">
<input type="hidden" id="commwritedate" value="${board.writedate }">

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
				<textarea id="comment_contents" name="comment_contents" /></textarea>
				<input id="comment_id" type="text" value="${usrId }" disabled="disabled" />
				<input type="button" id="btn" value="작성완료" />
				<input type="button" value="취소" />
				<div id="commentlist"></div>
			</td>
			
	</tr>
<%-- 				<c:forEach var="comment" items="${commentlst }"> --%>
					<tr>
						<td>
								<br />
								<div class="commenttitle">
								<div class="commentlist" id="commentlist">
<%-- 									<input id="commentlist_no" type="hidden" value="${comment.comment_no }"> --%>
<%-- 									<input id="commentlist_id" type="text" value="${comment.comment_id}" disabled="disabled" /> --%>
<%-- 									<input id="commentlist_contents" type="text" value="${comment.comment_contents}" /> --%>
<%-- 									<input id="commentlist_writedate" type="text" value="${comment.comment_writedate}" disabled="disabled" /> --%>
<!-- 									<input type="button" id="listbtn" value="수정" /> -->
<!-- 									<input type="button" id="listdel" value="삭제" /> -->
								</div>
								</div>
						</td>
					</tr>
<%-- 				</c:forEach> --%>
			
	
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
</form>
</center>