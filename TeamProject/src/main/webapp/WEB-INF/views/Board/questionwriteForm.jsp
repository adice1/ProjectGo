<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="home" value="/"/>
<style>
.ro{
     
}
.io{
     margin-top: 35px;
}
.uo{
    border-style: dotted;
    border-width: thin;
    border-radius: 10px;
}

.po{
    background: #F6F4F7;
}
.do{
    background: #333B3D;
    height: 140px;
}
.jo{
    margin-top: 30px;
}
.co{

    background: #333B3D;
    height: 140px;
    
}
</style>
<html>
<body class="po">
<div class="do"></div>
<center>
<div class="jo">
<h2>답변글을 작성해주세요.</h2>
<div class="io">
<form id="to" action="${home }QuestionBoard/${proc}" method="post" enctype="multipart/form-data">
<input type="hidden" name="pno" value="${pno }">
<input type="text" name="no" value="${no }">

<table style="width: 650px; ">
	<tr>
		<td style="width: 80px; height:40px;" align="right">작성자</td>
		<td style="width: 570px; height:40px;">
			<input type=text name="id" value="${usrId }"/> 
		</td>
	</tr>
	<tr>
		<td  style="width: 80px; height:40px;" align="right">제 목</td>
		<td style="width: 570px; height:40px;">
			<input type=text name='title' value="${board.title }" style="width: 500px; "/> 
		</td>
	</tr>
	<tr>
		<td class="uo" colspan=2 align="right"><textarea class="uo" name="contents" style="width: 650px; height: 300px">${board.contents }</textarea></td>
	</tr>
	<div class="ro">
	<tr>
		<td align='right' height=40 colspan=2>
			<input type=file name="uploadfile" style="width: 300px; "/>
		</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan=2>
			<input type=submit value='${btnName }' style="width: 120px; "/>
			<input type=reset value='취소' style="width: 120px; "/>	 
		</td>
	</tr>
	</div>
</table>
</form>
</div>
</div>
</center>
<div class="co"></div>
</body>
</html>