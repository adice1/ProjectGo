<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>
<script type="text/javascript">
function ModifyPwCloss(cmd){
	window.opener.location.href=cmd;
    self.close();
}
function MyInfoProc(cmd, frmId) {
	var newPw = document.getElementById("newPw").value
	var newPwOk = document.getElementById("newPwOk").value
	
	if(newPw =="" || newPwOk =="" || newPw =="" && newPwOk =="" )
		alert('비밀본호를 입력해주세요');
	else if(newPw != newPwOk)
		alert('비밀번호 입력값이 일치하지 않습니다.');
	else if(newPw == newPwOk ) {
				window.opener.location.href=cmd+"?newPw="+newPw;
			    self.close();
	}
}
</script>
<center>
<h1> ${authNum }</h1>
<form id="frm" action="${home }myInfo/passModify" method="post">
<input type="hidden" id="authNumProc" name="authNumProc" value="${authNum }">
<table>
	<tr><td colspan="4" align="center"><h1>비밀번호 수정</h1><hr/><br/></td></tr>
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
	<tr>
		<td align='right' height=40>새 패스워드</td>
		<td>
			<input type=text id="newPw" name='newPw' placeholder='pw 입력'/> 
		</td>
	</tr>
	<tr>
		<td align='right'>새 패스워드 확인</td>
		<td>
			<input type=text id="newPwOk" name='newPwOk' placeholder='pw 입력'/> 
		</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan=4>
			<button onclick="MyInfoProc('${home }myInfo/MyInfoProcPw', 'frm');"  style="width: 120px;">수정</button>
			<button onclick="ModifyPwCloss('${home }myInfo/MyInfoFormProc');"  style="width: 120px;">나가기</button>
		</td>
	</tr>
</table>
</form>
</center>