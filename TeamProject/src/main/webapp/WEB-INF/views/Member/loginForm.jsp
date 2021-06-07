<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>

<center>
<h3><font color="red">${msg }</font></h3>
<form id="frm" action="${home }login/loginProc" method="post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type=text id="id" name='id' placeholder='ID 입력'/></td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td><input type=password name='pw' placeholder='PW 입력'/></td>
	</tr>
	<tr>
	<input type="hidden" onclick="loginKakaoDB(frm, '${home}login/loginKakaoDB');" value="카카오로그인" id="kakaoProc">
		<td colspan=2 align='center'>
			<input type=submit value='로그인' style="width: 86px; "/>
			<a href="javascript:kakaoLogin();"> 
	<img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="width: 150px; height: 60px;"></a>
		</td>
	</tr>
		
</table>
</form>
</center>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
window.Kakao.init("2c64b70129020a7f07ff409696b492cd");
function kakaoLogin() {
	window.Kakao.Auth.login({
		scope:'	profile, account_email, gender',
		success: function(authObj) {
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
					console.log(kakao_account.email);
					var id = document.getElementById("id").value = kakao_account.email;
					document.getElementById("kakaoProc").click();
				}
			});
		}
	});	
}
function loginKakaoDB(frmId, path){
	frmId.action=path;
	frmId.submit();
}
</script>