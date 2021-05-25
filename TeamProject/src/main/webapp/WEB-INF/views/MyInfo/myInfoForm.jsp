<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>

<center>
<form action="${home }myInfo/MyInfoProc" method="post">
현재 비밀번호 : <input type="text" name="pw" id="pw"><button formaction="${home }myInfo/MyAuth">인증</button><br/>
			<input type="text"><button >확인</button><br/>
우편번호 : <input type="text"><button >확인</button><br/>
주소 : <input type="text"><br/>
상세주소 : <input type="text"><br/>
새 비밀번호 : <input type="text"><br/>
새 비밀번호 확인 : <input type="text"><br/>
<input type="submit" value="저장">
<input type="reset" value="취소">
</form>
</center>