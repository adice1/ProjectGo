<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
function postModify(cmd){
	window.name="우편번호 검색";
	window.open(cmd, "_blank", "top=200, left=1000, width=400, height=400");
}
function MyInfoProc(cmd, frmId) {
	var newPw = document.getElementById("newPw").value
	var newPwOk = document.getElementById("newPwOk").value
	
	if(newPw =="" || newPwOk =="" || newPw =="" && newPwOk =="" )
		alert('비밀본호를 입력해주세요');
	else if(newPw != newPwOk)
		alert('비밀번호 다르다');
	else if(newPw == newPwOk) {
		let frm = document.getElementById(frmId);
		frm.action=cmd;
		frm.submit();
	}
}
</script>

<center>
<h1> ${authNum }</h1>
<form id="frm" action="${home }myInfo/MyInfoProc" method="post">
<input type="hidden" id="authNumProc" name="authNumProc" value="${authNum }">
<table>
	<tr><td colspan="4" align="center"><h1>내 정보 수정</h1><hr/><br/></td></tr>
	<tr>
		<td align='right' height=40>현재 비밀번호</td>
		<td>
			<input type="text" name="pw" id="pw"> 
		</td>
		<td colspan="2"><button formaction="${home }myInfo/MyAuth">인증 생성</button></td>
	</tr>
	<tr>
		<td align='right' id="123" height=40>인증번호</td>
		<td>
			<input type=text id="authNumOk" name="authNumOk" placeholder='인증번호 입력' /> 
		</td>
		<td colspan="2"><button formaction="${home }myInfo/MyAuthOk">인증 확인</button></td>
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
		<td colspan="3">
			<input type=text name='addr1' id='addr1' value="${postcode.addr1 }" readonly="readonly" style="width: 475px; "/> 
		</td>
	</tr>
	<tr>
		<td align='right'>상세주소</td>
		<td colspan="3">
			<input type=text name='addr2' value="${postcode.addr2 }" style="width: 475px; "/> 
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td align='right' height=40>새 패스워드</td>
		<td>
			<input type=text id="newPw" name='newPw' placeholder='pw 입력'/> 
		</td>
		<td align='right'>새 패스워드 확인</td>
		<td>
			<input type=text id="newPwOk" name='newPwOk' placeholder='pw 입력'/> 
		</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan=4>
			<!-- <input type=submit value='수정' style="width: 120px; "/> -->
			<button onclick="MyInfoProc('${home }myInfo/MyInfoProc', 'frm');" style="width: 120px;">수정</button>
			<input type=reset value='취소' style="width: 120px; "/>	 
		</td>
	</tr>
</table>
</form>
</center>