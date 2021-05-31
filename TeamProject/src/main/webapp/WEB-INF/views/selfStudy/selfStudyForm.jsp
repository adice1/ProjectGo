<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/"/>

<style>
.canvas{
    width: 700px;
    height: 700px;
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
}
</style>

<center>
<form action="selfstudy/test">

	<canvas id="jsCanvas" class="canvas">
		<input type="input" name="tv" value="테스트값" />
		<input type="submit" value="확인"/>
		

		
	</canvas>
	
	<div id="mySidenav" class="sidenav">
		<a href="#">About</a>
		<a href="#">Services</a>
		<a href="#">Clients</a>
		<a href="#">Contact</a>
	</div>
	
</form>
</center>