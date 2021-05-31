<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>
 
<script type="text/javascript">
function setParentAddr(zipcode, address){
	opener.document.getElementById("zipcode").value = zipcode;
	opener.document.getElementById("addr1").value = address;
	window.close();
}
</script>

<form action="${home }myInfo/postModifySelect" method="post">
<h1>동면<input type="text" name="addr"><input type="submit" value="우편번호 검색"></h1>
</form>
<c:forEach var="zip" items="${zipLst}">
	<c:set var="zipcode" value="${zip.zipcode }"/>
	<c:set var="address" value="${zip.sido } ${zip.sigungu } ${zip.doro }"/>
	
	<div onclick="setParentAddr('${zipcode }', '${address }')">
	${zipcode } ${address }<br/>
	</div>
</c:forEach>
<%-- ${zipcode.zipcode } ${zipcode.sido } ${zipcode.sigungu } ${zipcode.doro } --%>
