<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.ko{
     background: #F6F4F7;
}
.fo{
    height: 20px;
    font-size: 32px;
    font-weight: 700;
    color: #fff;
}
.go{
    
    height: 200px;
    background: #333B3D;
}
.ho{
   padding: 12px 0 8px 24px;
    color: #148200;
    font-size: 25px;
}
.you{
   margin-top: 20px;
}
.to{
    margin-bottom: 30px;
    margin-top: 10px;
   
}
.vo{
    margin-top: 20px;
    margin-bottom: 30px;
    border-style: dotted;
    border-width: thin;
    border-radius: 10px;
    background: #FFFFFF;
    width: 670px;
}
.pon{
    margin-bottom: 30px;
    margin-top: 40px;
}
.pos{

   width: 670px;
   height: 250px;
   background: #EBEBEB;
   margin-top: 50px;
}
.pos.pos1{

   width: 670px;
   height: 250px;
   background: #EBEBEB;
}

.hedder{
   margin-top: 20px;
   width: 670px;
   height: 50px;
   background: #e6e8da;
}
.foter{
  height: 200px;
  background-color: #333B3D;
}
</style>
<c:url var="home" value="/"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("div.title").css("cursor", "pointer").click(function(){
		let no = $(this).attr("id");
		$("#writeNo").val(no);
		$("#frm").attr("action", "${home }QuestionBoard/detailRead");
		$("#frm").submit();
	})
	$("#allSelect").click(function() {
		console.log(this.checked);
		$(".chkbox").prop('checked', this.checked);
		console.log($(".chkbox").length);
	})
	$(".chkbox").click(function() {
		console.log($(".chkbox").length);
		console.log($(".chkbox:checked").length);
		if($(".chkbox").length == $(".chkbox:checked").length)
			$("#allSelect").prop('checked', true);
		else
			$("#allSelect").prop('checked', false);
		
		let chked = $(".chkbox").length == $(".chkbox:checked").length;
		$("#allSelect").prop('checked', chked);
	})
});
</script>
<script type="text/javascript">
function proc(cmd){
	document.getElementById('frm').action=cmd;
	document.getElementById('frm').submit();

</script>
<html>
<body class="ko">
<div class="go"><h2 align="center" class="fo">이곳은 서로 소통하는 공간입니다.</h2></div>
<center>
<div class="pos">
<div class="hedder"><h1 class="ho">Q&A</h1>
<div class="pos1">
<ul>
<li>게임</li>
<li>스포츠</li>
<li>음식</li>
<li>교육</li>
<li>사회, 정치</li>
<li>생활</li>
<li>경제</li>
<li>미술</li>
<li>과학</li>
<li>컴퓨터통신</li>
<li>쇼핑</li>
<li>여행</li>
<li>오픈사전</li>
<li>고민Q&A</li>
<li>지역&플레이스</li>
<li>엔터테이먼트,예술</li>
</ul>

</div>
</div>
</div>


<h2 class="pon">댓글 목록</h2>
<div class="vo">
<form id="frm" action="${home }QuestionBoard/QuestionWrite" method="post">
<input type="hidden" id="writeNo" name="writeNo"/>
<table style="width: 650px; ">
	<thead>
	<tr>
		<th style="width: 40px; height:20px;" align="center">선택</th>
		<th style="width: 330px; height:20px;" align="center">제 목</th>
		<th style="width: 80px; height:20px;" align="center">작성자</th>
		<th style="width: 120px; height:20px;" align="center">작성일</th>
		<th style="width: 80px; height:20px;" align="center">조회수</th>
	</tr>
	
	<tr>
		<td style="width: 40px; height:20px;" align="center"><hr/></td>
		<td style="width: 330px; height:20px;" align="center"><hr/></td>
		<td style="width: 80px; height:20px;" align="center"><hr/></td>
		<td style="width: 120px; height:20px;" align="center"><hr/></td>
		<td style="width: 80px; height:20px;" align="center"><hr/></td>
	</tr>
	<c:forEach var="board" items="${boardLst }">
	<tr>
		<td style="width: 40px; height:40px;" align="center">
		<input type="checkbox" name="chkbox" value="${board.no }" class="chkbox"/></td>
		<td style="width: 330px; height:40px;" align="center"><pre>
		<div class="title" id="${board.no }">${board.title }</div></pre></td>
		<td style="width: 80px; height:40px;" align="center">${board.id }</td>
		<td style="width: 120px; height:40px;" align="center">${board.writedate }</td>
		<td style="width: 80px; height:40px;" align="center">${board.hit }</td>
	</tr>
	</c:forEach>
	<tr><td colspan=5><hr/></td></tr>
	<tr>
		<td colspan=2><input id="allSelect" type="checkbox"/>전체선택</td>
		<td colspan=3 align="right">
			<button style="width: 100px; ">글쓰기</button>
			<button formaction="${home }QuestionBoard/deletes" style="width: 100px; ">삭제</button>
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
</table>
</form>
<div class="you">
${navi }
</div>
<table>
<tr>
<td>
<form class="to" id="frm" action="${home}QuestionBoard/boardProc" method="post">
	<select name="searchName">
		<option value="all">전체</option>
		<option value="title">제목</option>
		<option value="id">작성자</option>
	</select>
	<input type=text name='searchWord'/>
	<input type="submit" name='searchBtn' value='검색' style="width: 80px; "/>
	</form>
	</div>
</td>
</tr>
</table>
</center>
<div class="foter">
</div>
</body>
</html>