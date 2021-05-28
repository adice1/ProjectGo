<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
function postModify(cmd){
	pop_auth = window.open(cmd, '내 정보 수정', 'top=10, left=10, width=600, height=600')
	pop_auth.focus();
}

</script>

<center>
<h1> ${authNum }</h1>
<form id="frm" action="${home }myInfo/MyInfoProc" method="post">
<table>
	<tr><td colspan="3" align="center"><h1>내 정보 수정</h1><hr/><br/></td></tr>
	<tr>
		<td align='right' height=40>현재 비밀번호</td>
		<td>
			<input type="text" name="pw" id="pw"> 
		</td>
		<%-- <td colspan="2"><button formaction="${home }myInfo/MyAuth">비밀번호 변경</button></td> --%>
		<td colspan="2"><button onclick="postModify('${home}myInfo/passModify')">비밀번호 변경</button></td>
	</tr>
	
	<c:forEach var="postcode" items="${myPost }">
	<tr>
		<td align='right'>우편번호</td>
		<td>
			<input type=text name='zipcode' id='zipcode' value="${postcode.zipcode }" readonly="readonly"/> 
		</td>
		<td colspan="2"><input type="button" onclick="postModify('${home}myInfo/postModify');" value="우편번호 검색"></td>
	</tr>
	<tr>
		<td align='right'>주소</td>
		<td colspan="2">
			<input type=text name='addr1' id='addr1' value="${postcode.addr1 }" readonly="readonly" style="width: 475px; "/> 
		</td>
	</tr>
	<tr>
		<td align='right'>상세주소</td>
		<td colspan="2">
			<input type=text name='addr2' value="${postcode.addr2 }" style="width: 475px; "/> 
		</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td align='center' height=40 colspan=4>
			<input type=submit value='수정' style="width: 120px; "/>
			<input type=reset value='취소' style="width: 120px; "/>	 
		</td>
	</tr>
</table>
</form>
</center>