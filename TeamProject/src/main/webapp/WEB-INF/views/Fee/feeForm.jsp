<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:url var="home" value="/"/>
<style type="text/css">
body {
margin: 0;
padding: 0;
}
.square {
 width: 300px;
 height: 60px;
 background: pink;
 border-radius: 30px;
 transform: translate(12%, 0%);
 display:table-cell;vertical-align:middle;
 font-size: 25px;
}

</style>
<script type="text/javascript">
function feePamentProc(cmd){
	pop_auth = window.open(cmd, '결제 화면 띄우기', 'top=10, left=10, width=600, height=680')
	pop_auth.focus();
}
</script>
<body>
<center>
1. 상품 구성
<table border="1">
  <tr>
    <th></th>
    <th>맞춤형 기출문제</th>
    <th>자율 학습방 사용</th>
    <th>게시판 댓글</th>
  </tr>
  <tr>
    <td>구성</td>
    <td>자주 틀리는 반복출제<br/>
		유저 레벨별 문제 출제</td>
    <td>다양한 학습을 통한 지식 향상</td>
    <td>서로의 정보 공유를 통한 지식 향상</td>
  </tr>
  <tr>
    <td>요금</td>
    <td colspan="3">5500원</td>
  </tr>
</table>
<div class="square">
	<a onclick="feePamentProc('${home }Fee/feeProc')">결제하기</a>
	<%-- <button onclick="feePamentProc('${home }Fee/feeProc')">결제하기</button> --%>
</div>
</body>
</center>




