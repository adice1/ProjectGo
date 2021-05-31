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